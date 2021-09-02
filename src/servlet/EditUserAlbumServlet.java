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

@WebServlet(urlPatterns="/editUserAlbum")
public class EditUserAlbumServlet extends HttpServlet 
{
   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
   {
	  //userid albumid content albumname
	   int userid = Integer.parseInt(req.getParameter("userid"));
	   int albumid = Integer.parseInt(req.getParameter("albumid"));
	   String albumname = req.getParameter("albumname");
	   String content = req.getParameter("content");
	   
	   try 
	   {
		  int res = AlbumBean.editAlbumByUserAndAlbumId(userid, albumid, albumname, content);
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
