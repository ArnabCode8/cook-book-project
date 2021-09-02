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

import bean.RecipeMetaBean;
import util.Recipe;

@WebServlet(urlPatterns = "/loadrecipe")
public class LoadRecipeServlet extends HttpServlet 
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String rid = req.getParameter("recipeid");
		System.out.println("recipeid Received : " + rid);
		int recipeid = Integer.parseInt(rid);
		
		RecipeMetaBean rm = new RecipeMetaBean();
		 rm.setRecipeid(recipeid);
		 
		 try 
		 {
			RecipeMetaBean rm1 = rm.RecipeMetaByRecipeId().get(0);
			Recipe r = new Recipe();
			r.setRecipeContent(rm1);
			//r.showRecipe();
			ArrayList<Object> rl = new ArrayList<>();
			rl.add(r.rm);
			rl.add(r.user);
			rl.add(r.choicelist);
			rl.add(r.typelist);
			rl.add(r.ingredlist);
			rl.add(r.content);
			
			
			ObjectMapper mapper = new ObjectMapper();
			String jsonString = mapper.writeValueAsString(rl);
			PrintWriter out = resp.getWriter();
			out.println(jsonString);
			
		 } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
