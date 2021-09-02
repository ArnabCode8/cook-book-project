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

import bean.RecipeMetaBean;
import util.DateDemo;
import util.Tool;

@WebServlet(urlPatterns="/submitRecipe")
public class SubmitRecipeServlet extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		int userid = Integer.parseInt(req.getParameter("userid"));
		String ingred = req.getParameter("ingred");
		String choice = req.getParameter("choice");
		String type = req.getParameter("type");
		String descrip = req.getParameter("descrip");
		int diet = Integer.parseInt(req.getParameter("diet"));
		String title = req.getParameter("title");
		String recipe = req.getParameter("recipe");
		int rating = 0;
		DateDemo d = new DateDemo();
		String date = d.getCurrentDate();
		
		RecipeMetaBean rm = new RecipeMetaBean();
		
		//9 parameters except recipeid
		rm.setUserid(userid);
		rm.setIngred(ingred);
		rm.setChoice(choice);
		rm.setType(type);
		rm.setDescrip(descrip);
		rm.setDiet(diet);
		rm.setTitle(title);
		rm.setRating(rating);
		rm.setDate(date);
		
		//recipe content goes to the expbean through tool
		Tool t = new Tool();
		
		try 
		{
			t.addRecipeContent(recipe);
			int res = rm.addRecipeMeta();
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
