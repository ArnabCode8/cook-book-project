package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import bean.AlbumBean;
import bean.RecipeMetaBean;
import util.ChoiceTypeStrings;
import util.ReviewCount;

@WebServlet(urlPatterns="/myContentAlbum")
public class MyContentAlbumServlet extends HttpServlet 
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		int userid = Integer.parseInt(req.getParameter("userid"));
		RecipeMetaBean rm = new RecipeMetaBean();
		rm.setUserid(userid);
		
		try 
		{
			ArrayList<RecipeMetaBean> myRecipes = rm.RecipeMetaByUserId();
			ArrayList<ReviewCount> myReviews = new ArrayList<>();
			ArrayList<ChoiceTypeStrings> myCts = new ArrayList<>();
			AlbumBean ab = new AlbumBean();
			ab.setUserid(userid);
			ArrayList<AlbumBean> myAlbums = ab.AlbumByUserId();
			
			for(RecipeMetaBean r : myRecipes)
			{
				int recipeid = r.getRecipeid();
				ReviewCount rv = new ReviewCount();
				ChoiceTypeStrings ct = new ChoiceTypeStrings();
				
				rv.setReview(recipeid);
				ct.setChoiceTypeStrings(recipeid);
				
				myReviews.add(rv);
				myCts.add(ct);
			}	
			
			ArrayList<Object> finalOut = new ArrayList<>();
			finalOut.add(myRecipes);
			finalOut.add(myReviews);
			finalOut.add(myCts);
			finalOut.add(myAlbums);
			System.out.println("content size : " + myRecipes.size() + " album size : " + myAlbums.size());
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
