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

import bean.RatingBean;
import bean.UserBean;

@WebServlet(urlPatterns= "/loadrating")
public class RecipeRatingServlet extends HttpServlet 
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String rid = req.getParameter("recipeid");
		int recipeid = Integer.parseInt(rid);
		
		System.out.println("Recipe Id Received in rating servlet " + recipeid);
		
		RatingBean rb = new RatingBean();
		rb.setRecipeid(recipeid);
		
		try 
		{
			ArrayList<RatingBean> rates = rb.ratingByRecipeId();
			ArrayList<UserBean> users = new ArrayList<>();
			
			for(RatingBean r : rates)
			{
			   int uid = r.getUserid();
			   UserBean ub = new UserBean();
			   ub.setUserid(uid);
			   ArrayList<UserBean> tempUsers = ub.UsersById();
			   users.add(tempUsers.get(0));
			}	
			
			// rates and users both are filled so now convert to jsonString and send 
			ArrayList<Object> finalOut = new ArrayList<>();
			finalOut.add(rates);
			finalOut.add(users);
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
