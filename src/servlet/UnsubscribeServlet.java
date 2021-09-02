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

import bean.FollowBean;

@WebServlet(urlPatterns="/unsubscribe")
public class UnsubscribeServlet extends HttpServlet 
{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
    	int userid = Integer.parseInt(req.getParameter("userid"));
    	int subsid = Integer.parseInt(req.getParameter("subsid"));
    	
    	FollowBean fb = new FollowBean();
    	fb.setFollows(userid);
    	fb.setFollowed(subsid);
    	
    	try 
    	{
			int res = fb.deleteFollowByFollowAndFollowedId();
			String msg = "";
			if(res == 0)
			{
				msg = "failed";
			}	
			else
			{
				msg = "successful";
			}	
			
			ObjectMapper mapper = new ObjectMapper();
			String jsonString = mapper.writeValueAsString(msg);
			PrintWriter out = resp.getWriter();
			out.println(jsonString);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
}
