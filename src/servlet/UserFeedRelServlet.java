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

import bean.RecipeMetaBean;
import util.ChoiceTypeStrings;
import util.ReviewCount;
import util.Tool;

@WebServlet(urlPatterns="/userFeedRel")
public class UserFeedRelServlet extends HttpServlet 
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		int userid = Integer.parseInt(req.getParameter("userid"));
		try 
		{
			//feed part
			
			ArrayList<RecipeMetaBean> recipes = Tool.feedByUserId(userid);
			Collections.sort(recipes,RecipeMetaBean.recipeDateOrder);
			
			ArrayList<ReviewCount> reviews = new ArrayList<>();
			ArrayList<ChoiceTypeStrings> cts = new ArrayList<>();
			
			for(RecipeMetaBean r : recipes)
			{
				int rid = r.getRecipeid();
				
				ReviewCount rv = new ReviewCount();
				ChoiceTypeStrings ct = new ChoiceTypeStrings();
				
				rv.setReview(rid);
				ct.setChoiceTypeStrings(rid);
				
				reviews.add(rv);
				cts.add(ct);
			}	
			
			
			//relevent part
			
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
			
		
			
			ArrayList<Object> finalOut = new ArrayList<>();
			finalOut.add(recipes);
			finalOut.add(reviews);
			finalOut.add(cts);
			
			finalOut.add(recipes1);
			finalOut.add(reviews1);
			finalOut.add(cts1);
			
			
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
