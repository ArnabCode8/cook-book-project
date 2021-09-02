package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import util.Tool;

@WebServlet(urlPatterns="/submitComment")
public class SubmitCommentServlet extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String rid = req.getParameter("recipeid");
		String uid = req.getParameter("userid");
		String txt = req.getParameter("txt");
		
		int recipeid = Integer.parseInt(rid);
		int userid = Integer.parseInt(uid);
		
		Tool t = new Tool();
		
		int res = t.addComment(recipeid, userid, txt);
		String msg = "";
		
		if(res == 1)
		{
		   msg = "successful";	
		}
		else
		{
		   msg = "failed"; 
		}	
		
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonString = mapper.writeValueAsString(msg);
		PrintWriter out = resp.getWriter();
		out.println(jsonString);
		
	}

}
