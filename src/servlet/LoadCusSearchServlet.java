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
import bean.IngredBean;
import bean.TypeBean;

@WebServlet(urlPatterns="/loadCusSearch")
public class LoadCusSearchServlet extends HttpServlet 
{
   @Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
		
		try 
		{
			IngredBean ing = new IngredBean();
			ArrayList<IngredBean> ingreds = ing.allIngreds();
			
			ChoiceBean cb = new ChoiceBean();
			ArrayList<ChoiceBean> choices = cb.allChoices();
			
			TypeBean tb = new TypeBean();
			ArrayList<TypeBean> types = tb.allTypes();
			
			ArrayList<Object> finalOut = new ArrayList<>();
			finalOut.add(ingreds);
			finalOut.add(choices);
			finalOut.add(types);
			
			ObjectMapper mapper = new ObjectMapper();
			PrintWriter out = resp.getWriter();
			String jsonString = mapper.writeValueAsString(finalOut);
			out.println(jsonString);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}
}
