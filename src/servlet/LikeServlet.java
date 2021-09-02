package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import bean.LikedBean;

@WebServlet(urlPatterns="/likeServ")
public class LikeServlet extends HttpServlet 
{
   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
   {
	  int recipeid = Integer.parseInt(req.getParameter("recipeid"));
	  int userid = Integer.parseInt(req.getParameter("userid"));
	  String status = req.getParameter("status");
	  LikedBean lb = new LikedBean();
	  lb.setUserid(userid);
	  lb.setRecipeid(recipeid);
	  System.out.println("recipeid : " + recipeid + " userid : " + userid + " status : " + status);
	  String msg = "";
	  ObjectMapper mapper = new ObjectMapper();
	  PrintWriter out = resp.getWriter();
	  
	  if(status.equals("like"))
	  {
		  try 
		  {
				int res = lb.addLike();
				if(res == 1)
				{
					msg = "successful";
				}
				else
				{
					msg = "failed";
				}	
				System.out.println("like added");
				String jsonString = mapper.writeValueAsString(msg);
				out.println(jsonString);
			
		  } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		  }
		  
	  }
	  else
	  {
		  try 
		  {
				int res = lb.deleteLikeByUserAndRecipeId();
				if(res != 0)
				{
					msg = "successful";
				}
				else
				{
					msg = "failed";
				}	
				System.out.println("like removed");
				String jsonString = mapper.writeValueAsString(msg);
				out.println(jsonString);
			
		  } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		  }
		  
	  }	  
	  
   }
}
