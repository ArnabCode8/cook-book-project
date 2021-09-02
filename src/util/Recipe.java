package util;

import java.sql.SQLException;
import java.util.ArrayList;

import bean.ChoiceBean;
import bean.IngredBean;
import bean.RecipeMetaBean;
import bean.TypeBean;
import bean.UserBean;

public class Recipe {
	
	//recipemetabean, userbean, choicebean, typebean, ingredbean, String content
	
      public RecipeMetaBean rm;
      public UserBean user;
      public ArrayList<ChoiceBean> choicelist;
      public ArrayList<TypeBean> typelist;
      public ArrayList<IngredBean> ingredlist;
      public String content;
      
      public void showRecipe()
      {
    	  System.out.println("Recipe Meta-Data");
    	  this.rm.showRecipeMeta();
    	  System.out.println("Written By : ");
    	  this.user.showUser();
    	  
    	  System.out.println("Choices : ");
    	  for(ChoiceBean c : this.choicelist)
    	  {
    		  c.showChoice();
    	  }	
    	  
    	  System.out.println("Types : ");
    	  for(TypeBean c : this.typelist)
    	  {
    		  c.showType();
    	  }
    	  
    	  System.out.println("Ingreds : ");
    	  for(IngredBean c : this.ingredlist)
    	  {
    		  c.showIngred();
    	  }
    	  
    	  System.out.println("Recipe Content : ");
    	  System.out.println(this.content);
    	  
      }
      
      public void setRecipeContent(RecipeMetaBean r) throws SQLException
      {
    	  this.rm = r;
    	  int txtid = rm.getRecipeid();
    	  int userid = rm.getUserid();
    	  String choicetxt = rm.getChoice();
    	  String typetxt = rm.getType();
    	  String ingredtxt = rm.getIngred();
    	  String[] choicestxt = choicetxt.split(" ");
    	  String[] typestxt = typetxt.split(" ");
    	  String[] ingredstxt = ingredtxt.split(" ");
    	  ArrayList<Integer> choiceArr = new ArrayList<>();
    	  ArrayList<Integer> typeArr = new ArrayList<>();
    	  ArrayList<Integer> ingredArr = new ArrayList<>();
    	  
    	  for(String s : choicestxt)
    	  {
    		  int k = Integer.parseInt(s);
    		  choiceArr.add(k);
    	  }	  
    	  
    	  for(String s : typestxt)
    	  {
    		  int k = Integer.parseInt(s);
    		  typeArr.add(k);
    	  }	
    	  
    	  for(String s : ingredstxt)
    	  {
    		  int k = Integer.parseInt(s);
    		  ingredArr.add(k);
    	  }	
    	  
    	  UserBean u = new UserBean();
    	  u.setUserid(userid);
    	  ArrayList<UserBean> users = u.UsersById(); 
    	  this.user = users.get(0);
    	  
    	  ChoiceBean cb = new ChoiceBean();
    	  TypeBean tb = new TypeBean();
    	  IngredBean ib = new IngredBean();
    	  
    	  this.choicelist = new ArrayList<>();
    	  this.typelist = new ArrayList<>();
    	  this.ingredlist = new ArrayList<>();
    	  
    	  for(Integer i : choiceArr)
    	  {
    		  cb.setChoiceid(i);
    		  ChoiceBean cbTemp = cb.ChoiceById().get(0);
    		  choicelist.add(cbTemp);
    	  }	  
    	  
    	  for(Integer i : typeArr)
    	  {
    		  tb.setTypeid(i);
    		  TypeBean tbTemp = tb.typeById();
    		  typelist.add(tbTemp);
    	  }	
    	  
    	  for(Integer i : ingredArr)
    	  {
    		  ib.setIngredid(i);
    		  IngredBean ibTemp = ib.ingredById();
    		  ingredlist.add(ibTemp);
    	  }	
    	  
    	  Tool tt = new Tool();
    	  this.content = tt.getRecipeContentById(txtid);
    	  //Tool.getRecipeContentById(txtid);
    	   
      }
      
      public static void main(String[] args) 
      {
		 int recipeid = 1;
		 RecipeMetaBean rm = new RecipeMetaBean();
		 rm.setRecipeid(recipeid);
		 
		 try 
		 {
			RecipeMetaBean rm1 = rm.RecipeMetaByRecipeId().get(0);
			Recipe r = new Recipe();
			r.setRecipeContent(rm1);
			r.showRecipe();
			
			
			
		 } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	  }

}
