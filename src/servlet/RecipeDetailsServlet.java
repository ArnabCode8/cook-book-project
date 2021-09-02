package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.ChoiceBean;
import bean.IngredBean;
import bean.RatingBean;
import bean.RecipeMetaBean;
import bean.TypeBean;
import bean.UserBean;
import util.Tool;

@WebServlet(urlPatterns="/loadRecipeDetails")
public class RecipeDetailsServlet extends HttpServlet 
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		int userid = Integer.parseInt(req.getParameter("userid"));
		int recipeid = Integer.parseInt(req.getParameter("recipeid"));
		
		//meta txt choice type ingred rating sims like author
		//Tool.getRecipeContentById(txtid)
		
		ArrayList<ChoiceBean> choiceArr = new ArrayList<>();
		ArrayList<TypeBean> typeArr = new ArrayList<>();
		ArrayList<IngredBean> ingredArr = new ArrayList<>();
		ArrayList<RatingBean> ratingArr = new ArrayList<>(); 
		
		try 
		{
			RecipeMetaBean rm = new RecipeMetaBean();
			rm.setRecipeid(recipeid);
			RecipeMetaBean r = rm.RecipeMetaByRecipeId().get(0); // recipe meta done
			Tool tt = new Tool();
			String recipeContent = tt.getRecipeContentById(recipeid); //recipeTxt done
			int wid = r.getUserid();
			UserBean ub = new UserBean();
			ub.setUserid(wid);
			UserBean author = ub.UsersById().get(0); // author ready
			
			//choice module
			ChoiceBean cb = new ChoiceBean();
			String[] chStrArr = r.getChoice().split(" ");
			for(String s : chStrArr)
			{
				cb.setChoiceid(Integer.parseInt(s.trim()));
				ChoiceBean c = cb.ChoiceById().get(0);
				choiceArr.add(c);
				
			}	
			
			//type module
			TypeBean tb = new TypeBean();
			String[] tyStrArr = r.getType().split(" ");
			for(String s : tyStrArr)
			{
				tb.setTypeid(Integer.parseInt(s.trim()));
				TypeBean t = tb.typeById();
				typeArr.add(t);
			}	
			
			//ingred module
			IngredBean ib = new IngredBean();
			String[] inStrArr = r.getIngred().split(" ");
			for(String s : inStrArr)
			{
				ib.setIngredid(Integer.parseInt(s.trim()));
				IngredBean i = ib.ingredById();
				ingredArr.add(i);
			}	
			
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
