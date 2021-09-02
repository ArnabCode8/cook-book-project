package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import bean.AlbumBean;
import bean.ChoiceBean;
import bean.RecipeMetaBean;
import bean.TypeBean;
import util.DateDemo;
import util.ReviewCount;
import util.Tool;

@WebServlet(urlPatterns="/loadUserRecipes")
public class LoadUserRecipesServlet extends HttpServlet 
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String uid = req.getParameter("userid");
		int userid = Integer.parseInt(uid);
		RecipeMetaBean rm = new RecipeMetaBean();
		rm.setUserid(userid);
		HashSet<Integer> chInt = new HashSet<>();
		HashSet<Integer> tyInt = new HashSet<>();
		Tool t = new Tool();
		
		try 
		{
			ArrayList<RecipeMetaBean> recipes = rm.RecipeMetaByUserId(); //recipes
			
			ArrayList<ReviewCount> reviews = new ArrayList<>();
			
			for(RecipeMetaBean r : recipes)
			{
				String chTemp = r.getChoice();
				String tyTemp = r.getType();
				ArrayList<Integer> chTempInt = t.propStrToArr(chTemp);
				ArrayList<Integer> tyTempInt = t.propStrToArr(tyTemp);
				
				for(Integer i : chTempInt)
				{
					chInt.add(i);
				}
				
				for(Integer i : tyTempInt)
				{
					tyInt.add(i);
				}
				
				ReviewCount rc = new ReviewCount();
				rc.setReview(r.getRecipeid());
				reviews.add(rc);
				
			}	
			
			ArrayList<Integer> chArr = new ArrayList<>();
			ArrayList<Integer> tyArr = new ArrayList<>();
			Iterator<Integer> chItr = chInt.iterator();
			Iterator<Integer> tyItr = tyInt.iterator();
			
			while(chItr.hasNext())
			{
				chArr.add(chItr.next());
			}
			
			while(tyItr.hasNext())
			{
				tyArr.add(tyItr.next());
			}
			
			ArrayList<ChoiceBean> choices = t.getChoicesFromList(chArr); //choices
			ArrayList<TypeBean> types = t.getTypesFromList(tyArr); //types
			
			Collections.sort(choices,ChoiceBean.choiceNameOrder);
			Collections.sort(types,TypeBean.typeNameOrder);
			
			/*System.out.println("Choices : " + choices.size() + " Types : " + types.size());
			
			for(TypeBean tb : types)
			{
				tb.showType();
			}*/	
			
			ArrayList<Object> finalOut = new ArrayList<>();
			
			Collections.sort(recipes,RecipeMetaBean.recipeNameOrder);
			ArrayList<RecipeMetaBean> r1 = new ArrayList<>();
			r1.addAll(recipes);
			finalOut.add(r1); //name wise Sorted
			
			/*
			System.out.println("Name wise sorted");
			for(RecipeMetaBean r : recipes)
			{
				System.out.println(r.getTitle());
			}	
			System.out.println("------------------------------");	
			*/
			
			
			Collections.sort(recipes,RecipeMetaBean.recipeDateOrder);
			 //date wise Sorted
			ArrayList<RecipeMetaBean> r2 = new ArrayList<>();
			r2.addAll(recipes);
			finalOut.add(r2); //name wise Sorted
			
			/*
			System.out.println("Date wise sorted");
			for(RecipeMetaBean r : recipes)
			{
				System.out.println(r.getTitle() + " : " + r.getDate());
			}	
			System.out.println("------------------------------");	
			*/
			
			Collections.sort(recipes,RecipeMetaBean.recipeViewsOrder);
			//views wise Sorted
			ArrayList<RecipeMetaBean> r3 = new ArrayList<>();
			r3.addAll(recipes);
			finalOut.add(r3); //name wise Sorted
			
			/*
			System.out.println("Views wise sorted");
			for(RecipeMetaBean r : recipes)
			{
				System.out.println(r.getTitle() + " : " + r.getViews());
			}	
			System.out.println("------------------------------");	
			*/
			
			Collections.sort(recipes,RecipeMetaBean.recipeRatingOrder);
			//rating wise Sorted
			ArrayList<RecipeMetaBean> r4 = new ArrayList<>();
			r4.addAll(recipes);
			finalOut.add(r4); //name wise Sorted
			
			/*
			System.out.println("Rating wise sorted");
			for(RecipeMetaBean r : recipes)
			{
				System.out.println(r.getTitle() + " : " + r.getRating());
			}	
			System.out.println("------------------------------");	
			*/
			
			Collections.sort(recipes,RecipeMetaBean.recipeDietOrder);
			//diet wise Sorted
			ArrayList<RecipeMetaBean> r5 = new ArrayList<>();
			r5.addAll(recipes);
			finalOut.add(r5); //name wise Sorted
			
			/*
			System.out.println("Diet wise sorted");
			for(RecipeMetaBean r : recipes)
			{
				System.out.println(r.getTitle() + " : " + r.getDiet());
			}	
			System.out.println("------------------------------");	
			*/
			
			
			finalOut.add(choices);
			finalOut.add(types);
			finalOut.add(reviews);
			
			DateDemo d = new DateDemo();
			String today = d.getCurrentDate();
			String yesterday = d.backwardDate(1);
			
			finalOut.add(today);
			finalOut.add(yesterday);
			
			AlbumBean ab = new AlbumBean();
			ab.setUserid(userid);
			ArrayList<AlbumBean> albums = ab.AlbumByUserId();
			finalOut.add(albums);
			
			ObjectMapper mapper = new ObjectMapper();
			String jsonString = mapper.writeValueAsString(finalOut);
			PrintWriter out = resp.getWriter();
			out.println(jsonString);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
