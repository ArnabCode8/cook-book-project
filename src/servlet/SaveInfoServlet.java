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

import bean.UserBean;

@WebServlet(urlPatterns = "/saveToServ")
public class SaveInfoServlet extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String uname = req.getParameter("username");
		String choices = req.getParameter("choices");
		int userid = Integer.parseInt(req.getParameter("userid"));
		
		System.out.println("uname : " + uname + " choices : " + choices);
		
		UserBean ub = new UserBean();
		ub.setUserid(userid);
		
		try 
		{
			UserBean u = ub.UsersById().get(0);
			
			if(choices.equals("empty") == false)
			{
				u.setChoice(choices);
			}	
			
			u.setUsername(uname);
			String msg = "";
			int res = u.updateUserById();
			
			if(res == 1)
			{
				msg = "successful";
			}
			else
			{
				msg = "failed";
			}	
			System.out.println("Operation Status : " + msg);
			ArrayList<String> msgs = new ArrayList<>();
			msgs.add(msg);
			
			ObjectMapper mapper = new ObjectMapper();
			String jsonString = mapper.writeValueAsString(msgs);
			PrintWriter out = resp.getWriter();
			out.println(jsonString);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
