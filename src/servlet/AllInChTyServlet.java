package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import bean.ChoiceBean;
import bean.IngredBean;
import bean.TypeBean;

@WebServlet(urlPatterns="/loadall")
public class AllInChTyServlet extends HttpServlet 
{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
    	IngredBean ib = new IngredBean();
    	ChoiceBean cb = new ChoiceBean();
    	TypeBean tb = new TypeBean();
    	
    	try 
    	{
			ArrayList<IngredBean> ingreds = ib.allIngreds();
			ArrayList<ChoiceBean> choices = cb.allChoices();
			ArrayList<TypeBean> types = tb.allTypes();
			
			//System.out.println("Ingreds : " + ingreds.size() + " choices : " + choices.size() + " types : " + types.size());
			
			Collections.sort(ingreds,IngredBean.ingredNameOrder);
			Collections.sort(choices,ChoiceBean.choiceNameOrder);
			Collections.sort(types,TypeBean.typeNameOrder);
			
			ArrayList<Object> finalOut = new ArrayList<>();
			finalOut.add(ingreds);
			finalOut.add(choices);
			finalOut.add(types);
			
			
			
			ObjectMapper mapper = new ObjectMapper();
			String jsonString = mapper.writeValueAsString(finalOut);
			PrintWriter out = resp.getWriter();
			out.println(jsonString);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
}
