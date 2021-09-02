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

import bean.CommentBean;

@WebServlet(urlPatterns="/updateCmt")
public class UpdateCommentServlet extends HttpServlet 
{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
    	
    	String uid = req.getParameter("userid");
    	String rid = req.getParameter("recipeid");
    	String cid = req.getParameter("commentid");
    	String commentText = req.getParameter("txt");
    	
    	int userid = Integer.parseInt(uid);
    	int recipeid = Integer.parseInt(rid);
    	int commentid = Integer.parseInt(cid);
    	
    	System.out.println("uid : " + uid + " rid : " + rid + " cid : " + cid);
    	System.out.println("txt" + commentText);
    	
    	
    	
    	CommentBean cb = new CommentBean();
    	cb.setCommentid(commentid);
    	cb.setRecipeid(recipeid);
    	cb.setUserid(userid);
    	cb.setCommentText(commentText);
    	
    	
    	try 
    	{
			int res = cb.updateComment();
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
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    }
}
