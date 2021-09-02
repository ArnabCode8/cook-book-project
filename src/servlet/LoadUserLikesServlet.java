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

@WebServlet(urlPatterns="/loadUserLikes")
public class LoadUserLikesServlet extends HttpServlet 
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
			ObjectMapper mapper = new ObjectMapper();
			String jsonString = mapper.writeValueAsString(likes);
			PrintWriter out = resp.getWriter();
			out.println(jsonString);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
