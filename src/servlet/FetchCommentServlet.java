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

import bean.CommentBean;
import bean.UserBean;

@WebServlet(urlPatterns = "/fetchcomment")
public class FetchCommentServlet extends HttpServlet 
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
	   String rid = req.getParameter("recipeid");
	   int recipeid = Integer.parseInt(rid);
	   System.out.println("Recipe Id Sent " + recipeid);
	   
	   CommentBean cb = new CommentBean();
	   cb.setRecipeid(recipeid);
	   
	   try 
	   {
		   ArrayList<CommentBean> allCmts = cb.CommentsByRecipeId();
		   ArrayList<UserBean> allUsers = new ArrayList<>();
		   ArrayList<UserBean> tempUsers = new ArrayList<>();
		   ArrayList<Object> finalOut = new ArrayList<>();
		   
		   for(CommentBean c : allCmts)
		   {
			   int userid = c.getUserid();
			   UserBean u = new UserBean();
			   u.setUserid(userid);
			   tempUsers = u.UsersById();
			   allUsers.add(tempUsers.get(0));
		   }	   
		   
		   finalOut.add(allCmts);
		   finalOut.add(allUsers);
		   
		   ObjectMapper mapper = new ObjectMapper();
		   PrintWriter out = resp.getWriter();
		   String jsonString = mapper.writeValueAsString(finalOut);
		   System.out.println("Went Alright Upto This");
		   System.out.println("Count of Comments : " + allCmts.size());
		   System.out.println("Count of Users : " + allUsers.size());
		   System.out.println("Count of finalOut : " + finalOut.size());
		   
		   out.println(jsonString);
		   
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	   
	   
	}
}
