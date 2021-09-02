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

import bean.ChoiceBean;

@WebServlet(urlPatterns="/allchoices")
public class AllChoicesServlet extends HttpServlet 
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		ChoiceBean cb = new ChoiceBean();
		
		try 
		{
			ArrayList<ChoiceBean> choices = cb.allChoices();
			
			ObjectMapper mapper = new ObjectMapper();
			String jsonString = mapper.writeValueAsString(choices);
			PrintWriter out = resp.getWriter();
			out.println(jsonString);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
