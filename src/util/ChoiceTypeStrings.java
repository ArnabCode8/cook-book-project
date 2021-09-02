package util;

import java.sql.SQLException;

import bean.ChoiceBean;
import bean.RecipeMetaBean;
import bean.TypeBean;
import bean.UserBean;

public class ChoiceTypeStrings {
	
	private int recipeid;
	private String choiceStr;
	private String typeStr;
	private String username;
	
	public int getRecipeid() {
		return recipeid;
	}
	public void setRecipeid(int recipeid) {
		this.recipeid = recipeid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getChoiceStr() {
		return choiceStr;
	}
	public void setChoiceStr(String choiceStr) {
		this.choiceStr = choiceStr;
	}
	public String getTypeStr() {
		return typeStr;
	}
	public void setTypeStr(String typeStr) {
		this.typeStr = typeStr;
	}
	
	public void setChoiceTypeStrings(int rid) throws SQLException
	{
	   this.recipeid = rid;
	   RecipeMetaBean rm = new RecipeMetaBean();
	   rm.setRecipeid(rid);
	   RecipeMetaBean r = rm.RecipeMetaByRecipeId().get(0);
	   String chStr = r.getChoice();
	   String tyStr = r.getType();
	   
	   int uid = r.getUserid();
	   UserBean ub = new UserBean();
	   ub.setUserid(uid);
	   UserBean u = ub.UsersById().get(0);
	   this.username = u.getUsername();
	   
	   String[] chArr = chStr.split(" ");
	   String[] tyArr = tyStr.split(" ");
	   
	   String tempChoiceStr = "";
	   String tempTypeStr = "";
	   
	   for(String c : chArr)
	   {
		   int k = Integer.parseInt(c.trim());
		   ChoiceBean cb = new ChoiceBean();
		   cb.setChoiceid(k);
		   ChoiceBean cbTemp = cb.ChoiceById().get(0);
		   tempChoiceStr = tempChoiceStr + cbTemp.getName() + ", ";
	   }	   
	   int len1 = tempChoiceStr.length();
	   tempChoiceStr = tempChoiceStr.substring(0, len1-2);
	   this.choiceStr = tempChoiceStr;
	   
	   for(String t : tyArr)
	   {
		   int k = Integer.parseInt(t.trim());
		   TypeBean tb = new TypeBean();
		   tb.setTypeid(k);
		   TypeBean tbTemp = tb.typeById();
		   tempTypeStr = tempTypeStr + tbTemp.getName() + ", ";
	   }	   
	   
	   len1 = tempTypeStr.length();
	   tempTypeStr = tempTypeStr.substring(0, len1 - 2);
	   this.typeStr = tempTypeStr;
	}
	
	public void showChoiceTypeStrings()
	{
		System.out.println("recipe id : " + this.recipeid);
		System.out.println("choices : " + this.choiceStr);
		System.out.println("types : " + this.typeStr);
	}
	
	public static void main(String[] args) 
	{
		int recipeid = 6;
		ChoiceTypeStrings ct = new ChoiceTypeStrings();
		try 
		{
			ct.setChoiceTypeStrings(recipeid);
			ct.showChoiceTypeStrings();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
