package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import bean.LikedBean;
import bean.RecipeMetaBean;
import util.ChoiceTypeStrings;
import util.ReviewCount;
import util.SimilarRecipes;
import util.Tool;

@WebServlet(urlPatterns="/loadCusContent")
public class LoadCusContentServlet extends HttpServlet 
{
   @Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
		int userid = Integer.parseInt(req.getParameter("userid"));
		String query = req.getParameter("query");
		System.out.println("Query Received : " + query);
		
		//getGeneralSimilarRecipesOverThresholdByIngred
		String[] qArr = query.split("R");
		for(String s : qArr)
		{
			System.out.println(s);
		}	
		
		//in ch ty des yr sort
		
		String ingredQuery = qArr[0].split(":")[1].trim(); //ingred
		String choiceQuery = qArr[1].split(":")[1].trim(); //choice
		String typeQuery = qArr[2].split(":")[1].trim(); //type
		String descripQuery = qArr[3].split(":")[1].trim(); //descrip
		String yearQuery = qArr[4].split(":")[1].trim(); //year
		String sortQuery = qArr[5].split(":")[1].trim(); //sort
		String statusQuery = qArr[6].split(":")[1].trim(); //sort
		
		System.out.println("ingredQuery : " + ingredQuery);
		System.out.println("choiceQuery : " + choiceQuery);
		System.out.println("typeQuery : " + typeQuery);
		System.out.println("descripQuery : " + descripQuery);
		System.out.println("yearQuery : " + yearQuery);
		System.out.println("sortQuery : " + sortQuery);
		System.out.println("statusQuery : " + statusQuery);
		//if status query is 'query', that means servelet will process this validated query, not only the userid
		
		ArrayList<SimilarRecipes> simArr = new ArrayList<>();
		
		try 
		{
			
			if(statusQuery.equals("query"))
			{
				//filter module starts
				
				RecipeMetaBean rm = new RecipeMetaBean();
				ArrayList<RecipeMetaBean> allRecipes = rm.allRecipeMeta();
				//year filter
				String stDate = yearQuery + "-01-01";
				String edDate = yearQuery + "-12-31";
				
				ArrayList<RecipeMetaBean> resRecipes = Tool.recipesBtnDates(allRecipes, stDate, edDate);
				int choice = Integer.parseInt(choiceQuery);
				if(choice != 1)
				{
					resRecipes = Tool.choiceFilter(resRecipes, choice);
				}	
				
				int type = Integer.parseInt(typeQuery);
				if(type != 0)
				{
					resRecipes = Tool.typeFilter(resRecipes, type);
				}
				
				if(!descripQuery.equals("None"))
				{
					resRecipes = Tool.descripFilter(resRecipes, descripQuery);
				}	
				
				if(!ingredQuery.equals("0"))
				{
					// have to change from sim to recipemeta
					ArrayList<Object> tempRes = (ArrayList<Object>)Tool.getGeneralSimilarRecipesOverThresholdByIngred(ingredQuery, 10, resRecipes);
					resRecipes = (ArrayList<RecipeMetaBean>)tempRes.get(1);
					simArr = (ArrayList<SimilarRecipes>)tempRes.get(0);
					
					for(SimilarRecipes s : simArr)
					{
						s.showSimilarRecipes();
						System.out.println("-------------------------------------------");
					}	
					
				}	
				
				if(sortQuery.equals("date"))
				{
					Collections.sort(resRecipes, RecipeMetaBean.recipeDateOrder);
				}
				else if(sortQuery.equals("views"))
				{
					Collections.sort(resRecipes, RecipeMetaBean.recipeViewsOrder);
				}
				else if(sortQuery.equals("rating"))
				{
					Collections.sort(resRecipes, RecipeMetaBean.recipeRatingOrder);
				}
				else if(sortQuery.equals("diet"))
				{
					Collections.sort(resRecipes, RecipeMetaBean.recipeDietOrder);
				}
				else if(sortQuery.equals("name"))
				{
					Collections.sort(resRecipes, RecipeMetaBean.recipeNameOrder);
				}	
					
				ArrayList<ReviewCount> reviews1 = new ArrayList<>();
				ArrayList<ChoiceTypeStrings> cts1 = new ArrayList<>();
				
				for(RecipeMetaBean r : resRecipes)
				{
					int rid = r.getRecipeid();
					
					ReviewCount rv = new ReviewCount();
					ChoiceTypeStrings ct = new ChoiceTypeStrings();
					
					rv.setReview(rid);
					ct.setChoiceTypeStrings(rid);
					
					reviews1.add(rv);
					cts1.add(ct);
				}
				
				LikedBean lb = new LikedBean();
				lb.setUserid(userid);
				ArrayList<LikedBean> likes = lb.likesByUserId();
				
				ArrayList<Object> finalOut = new ArrayList<>();
				finalOut.add(resRecipes);
				finalOut.add(reviews1);
				finalOut.add(cts1);
				finalOut.add(likes);
				finalOut.add(simArr);
				ObjectMapper mapper = new ObjectMapper();
				String jsonString = mapper.writeValueAsString(finalOut);
				PrintWriter out = resp.getWriter();
				out.println(jsonString);
				
				//Non-null request process ends here
				
			}	
			else
			{
				ArrayList<RecipeMetaBean> recipes1 = Tool.releventByUserId(userid);
				   Collections.sort(recipes1,RecipeMetaBean.recipeDateOrder);
					
					ArrayList<ReviewCount> reviews1 = new ArrayList<>();
					ArrayList<ChoiceTypeStrings> cts1 = new ArrayList<>();
					
					for(RecipeMetaBean r : recipes1)
					{
						int rid = r.getRecipeid();
						
						ReviewCount rv = new ReviewCount();
						ChoiceTypeStrings ct = new ChoiceTypeStrings();
						
						rv.setReview(rid);
						ct.setChoiceTypeStrings(rid);
						
						reviews1.add(rv);
						cts1.add(ct);
					}
					
					LikedBean lb = new LikedBean();
					lb.setUserid(userid);
					ArrayList<LikedBean> likes = lb.likesByUserId();
					
					ArrayList<Object> finalOut = new ArrayList<>();
					finalOut.add(recipes1);
					finalOut.add(reviews1);
					finalOut.add(cts1);
					finalOut.add(likes);
					ObjectMapper mapper = new ObjectMapper();
					String jsonString = mapper.writeValueAsString(finalOut);
					PrintWriter out = resp.getWriter();
					out.println(jsonString);
			}	
			
		   
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		
		
	}
}
