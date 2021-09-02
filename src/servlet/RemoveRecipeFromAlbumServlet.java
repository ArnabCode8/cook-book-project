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

import bean.AlbumBean;

@WebServlet(urlPatterns="/removeRecipeFromAlbum")
public class RemoveRecipeFromAlbumServlet extends HttpServlet 
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		int recipeid = Integer.parseInt(req.getParameter("recipeid"));
		int albumid = Integer.parseInt(req.getParameter("albumid"));
		int count = Integer.parseInt(req.getParameter("count"));
		int userid = Integer.parseInt(req.getParameter("userid"));
		
		try 
		{
			String msg = "failed";
			if(count == 1)
			{
				AlbumBean ab = new AlbumBean();
				ab.setAlbumid(albumid);
				ab.setUserid(userid);
				int res = ab.deleteAlbumByAlbumIdAndUserId();
				if(res != 0)
				{
					msg = "successful"; //successful
				}	
			}
			else
			{
				int res = AlbumBean.reduceRecipeFromAlbum(recipeid, albumid, userid);
				if(res != 0)
				{
					msg = "successful";
				}
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
