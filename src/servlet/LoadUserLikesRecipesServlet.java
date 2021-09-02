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

import bean.LikedBean;
import bean.RecipeMetaBean;
import util.ChoiceTypeStrings;
import util.ReviewCount;

@WebServlet(urlPatterns="/loadUserLikesRecipes")
public class LoadUserLikesRecipesServlet extends HttpServlet 
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		int userid = Integer.parseInt(req.getParameter("userid"));
		LikedBean lb = new LikedBean();
		lb.setUserid(userid);
		try 
		{
			ArrayList<LikedBean> likes = lb.likesByUserId();
			ArrayList<RecipeMetaBean> likedRecipes = new ArrayList<>();
			ArrayList<ReviewCount> likedReviews = new ArrayList<>();
			ArrayList<ChoiceTypeStrings> likedCts = new ArrayList<>();
			
			for(LikedBean l : likes)
			{
				int rid = l.getRecipeid();
				RecipeMetaBean rm = new RecipeMetaBean();
				rm.setRecipeid(rid);
				likedRecipes.add(rm.RecipeMetaByRecipeId().get(0));
				
				ReviewCount rv = new ReviewCount();
				rv.setReview(rid);
				likedReviews.add(rv);
				
				ChoiceTypeStrings ct = new ChoiceTypeStrings();
				ct.setChoiceTypeStrings(rid);
				likedCts.add(ct);
			}	
			
			ArrayList<Object> finalOut = new ArrayList<>();
			finalOut.add(likedRecipes);
			finalOut.add(likedReviews);
			finalOut.add(likedCts);
			
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
