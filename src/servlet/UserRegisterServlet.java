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

import bean.UserBean;

@WebServlet(urlPatterns = "/userregister")
public class UserRegisterServlet extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String name = req.getParameter("name");
		String mail = req.getParameter("mail");
		String choices = req.getParameter("choices");
		
		System.out.println("Came here");
		
		UserBean ub = new UserBean();
		ub.setEmail(mail);
		ub.setUsername(name);
		ub.setChoice(choices);
		
		try 
		{
			
			int res = ub.addUser();
			String msg = "";
			
			if(res == 1)
			{
				msg = "Successful";
			}
			else
			{
				msg = "Failed";
			}	
			
			ObjectMapper mapper = new ObjectMapper();
			PrintWriter out = resp.getWriter();
			String jsonString = mapper.writeValueAsString(msg);
			out.println(jsonString);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
