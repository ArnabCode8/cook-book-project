package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

import util.DBConnection;
import util.DateDemo;

public class RecipeMetaBean 
{
	private int recipeid;
	private String title;
	private int userid;
	private int diet;
	private int rating;
	private String ingred;
	private String choice;
	private String type; //continent
	private String descrip; // veg or non veg
	private String date;
	private int views;
	
	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public void showRecipeMeta()
	{
		System.out.println("Recipe Id : " + this.recipeid);
		System.out.println("Recipe Title : " + this.title);
		System.out.println("Recipe Written By : UserId" + this.userid);
		System.out.println("Recipe Diet measure : " + this.diet);
		System.out.println("Recipe Rating : " + this.rating);
		System.out.println("Recipe Ingredients Id: " + this.ingred);
		System.out.println("Recipe Choice : " + this.choice);
		System.out.println("Recipe Type : " + this.type);
		System.out.println("Recipe descrip : " + this.descrip);
		System.out.println("Recipe Last Date Modified : " + this.date);
		System.out.println("Views : " + this.views);
	}
	
	public int getRecipeid() {
		return recipeid;
	}
	public void setRecipeid(int recipeid) {
		this.recipeid = recipeid;
	}
	public String getTitle() {
		return title;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getDiet() {
		return diet;
	}
	public void setDiet(int diet) {
		this.diet = diet;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getIngred() {
		return ingred;
	}
	public void setIngred(String ingred) {
		this.ingred = ingred;
	}
	public String getChoice() {
		return choice;
	}
	public void setChoice(String choice) {
		this.choice = choice;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDescrip() {
		return descrip;
	}
	public void setDescrip(String descrip) {
		this.descrip = descrip;
	}
	
	//needed function
	//addRecipeMeta : done
	//recepiesByUserId : done
	//recepiesByType lunch dinner snacks dessert : done
	//recepiesBychoice : done
	//recepiesByTypeAndChoice : done
	
	public ArrayList<RecipeMetaBean> RecipeMetaByTypeAndChoice() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.cookdbConnect();
		
		
		//sql query
		
		String sql = "select *from recipe where type=? and choice=?";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, type);
		ps.setString(2, choice);
		
		
		ArrayList<RecipeMetaBean> allrecipes = new ArrayList<>();
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next())
		{
			RecipeMetaBean rm = new RecipeMetaBean();
			
			rm.setRecipeid(rs.getInt("recipeid"));
			
			rm.setUserid(rs.getInt("userid"));
			rm.setTitle(rs.getString("title"));
			rm.setDiet(rs.getInt("diet"));
			rm.setRating(rs.getInt("rating"));
			
			rm.setChoice(rs.getString("choice"));
			rm.setIngred(rs.getString("ingred"));
			rm.setType(rs.getString("type"));
			rm.setDescrip(rs.getString("descrip"));
			rm.setViews(rs.getInt("views"));
			rm.setDate(rs.getString("date"));
			
			
			allrecipes.add(rm);
		}
		
		return allrecipes;
		
	}

	
	
	
	public ArrayList<RecipeMetaBean> RecipeMetaByChoice() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.cookdbConnect();
		
		
		//sql query
		
		String sql = "select *from recipe where choice=?";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, choice);
		
		ArrayList<RecipeMetaBean> allrecipes = new ArrayList<>();
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next())
		{
			RecipeMetaBean rm = new RecipeMetaBean();
			
			rm.setRecipeid(rs.getInt("recipeid"));
			
			rm.setUserid(rs.getInt("userid"));
			rm.setTitle(rs.getString("title"));
			rm.setDiet(rs.getInt("diet"));
			rm.setRating(rs.getInt("rating"));
			
			rm.setChoice(rs.getString("choice"));
			rm.setIngred(rs.getString("ingred"));
			rm.setType(rs.getString("type"));
			rm.setDescrip(rs.getString("descrip"));
			
			rm.setDate(rs.getString("date"));
			rm.setViews(rs.getInt("views"));
			
			allrecipes.add(rm);
		}
		
		return allrecipes;
		
	}

	
	
	public int addRecipeMeta() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.cookdbConnect();
		
		
		//sql query
		
		String sql = "insert into recipe(title,userid,diet,rating,ingred,choice,type,descrip,date) values(?,?,?,?,?,?,?,?,?)";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, title);
		ps.setInt(2, userid);
		ps.setInt(3, diet);
		ps.setInt(4, rating);
		ps.setString(5, ingred);
		ps.setString(6, choice);
		ps.setString(7, type);
		ps.setString(8, descrip);
		ps.setString(9, date);
			
		
		//execute
		//ps.execute();
		int res = ps.executeUpdate();
		
		//close the connection
		con.close();
		
		return res;
		
	}
	
	public ArrayList<RecipeMetaBean> RecipeMetaByUserId() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.cookdbConnect();
		
		
		//sql query
		
		String sql = "select *from recipe where userid=?";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, userid);
		
		ArrayList<RecipeMetaBean> allrecipes = new ArrayList<>();
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next())
		{
			RecipeMetaBean rm = new RecipeMetaBean();
			
			rm.setRecipeid(rs.getInt("recipeid"));
			
			rm.setUserid(rs.getInt("userid"));
			rm.setTitle(rs.getString("title"));
			rm.setDiet(rs.getInt("diet"));
			rm.setRating(rs.getInt("rating"));
			
			rm.setChoice(rs.getString("choice"));
			rm.setIngred(rs.getString("ingred"));
			rm.setType(rs.getString("type"));
			rm.setDescrip(rs.getString("descrip"));
			rm.setViews(rs.getInt("views"));
			rm.setDate(rs.getString("date"));
			
			
			allrecipes.add(rm);
		}
		
		return allrecipes;
		
	}
	
	
	
	public ArrayList<RecipeMetaBean> allRecipeMeta() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.cookdbConnect();
		
		
		//sql query
		
		String sql = "select *from recipe";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ArrayList<RecipeMetaBean> allrecipes = new ArrayList<>();
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next())
		{
			RecipeMetaBean rm = new RecipeMetaBean();
			
			rm.setRecipeid(rs.getInt("recipeid"));
			
			rm.setUserid(rs.getInt("userid"));
			rm.setTitle(rs.getString("title"));
			rm.setDiet(rs.getInt("diet"));
			rm.setRating(rs.getInt("rating"));
			
			rm.setChoice(rs.getString("choice"));
			rm.setIngred(rs.getString("ingred"));
			rm.setType(rs.getString("type"));
			rm.setDescrip(rs.getString("descrip"));
			rm.setViews(rs.getInt("views"));
			rm.setDate(rs.getString("date"));
			
			
			allrecipes.add(rm);
		}
		
		return allrecipes;
		
	}
	
	
	
	
	public int updateViews() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.cookdbConnect();
		
		
		//sql query
		
		String sql = "update recipe set views=? where recipeid=?";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		
				
		ps.setInt(1, views);
		ps.setInt(2, recipeid);		
		//execute
		//ps.execute();
		int res = ps.executeUpdate();
		
		//close the connection
		con.close();
		
		return res;	
	}

	
	public ArrayList<RecipeMetaBean> RecipeMetaByRecipeId() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.cookdbConnect();
		
		
		//sql query
		
		String sql = "select *from recipe where recipeid=?";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, recipeid);
		
		ArrayList<RecipeMetaBean> allrecipes = new ArrayList<>();
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next())
		{
			RecipeMetaBean rm = new RecipeMetaBean();
			
			rm.setRecipeid(rs.getInt("recipeid"));
			
			rm.setUserid(rs.getInt("userid"));
			rm.setTitle(rs.getString("title"));
			rm.setDiet(rs.getInt("diet"));
			rm.setRating(rs.getInt("rating"));
			
			rm.setChoice(rs.getString("choice"));
			rm.setIngred(rs.getString("ingred"));
			rm.setType(rs.getString("type"));
			rm.setDescrip(rs.getString("descrip"));
			
			rm.setDate(rs.getString("date"));
			rm.setViews(rs.getInt("views"));
			
			allrecipes.add(rm);
		}
		
		return allrecipes;
		
	}


	public ArrayList<RecipeMetaBean> RecipeMetaByType() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.cookdbConnect();
		
		
		//sql query
		
		String sql = "select *from recipe where type=?";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, type);
		
		ArrayList<RecipeMetaBean> allrecipes = new ArrayList<>();
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next())
		{
			RecipeMetaBean rm = new RecipeMetaBean();
			
			rm.setRecipeid(rs.getInt("recipeid"));
			
			rm.setUserid(rs.getInt("userid"));
			rm.setTitle(rs.getString("title"));
			rm.setDiet(rs.getInt("diet"));
			rm.setRating(rs.getInt("rating"));
			
			rm.setChoice(rs.getString("choice"));
			rm.setIngred(rs.getString("ingred"));
			rm.setType(rs.getString("type"));
			rm.setDescrip(rs.getString("descrip"));
			
			rm.setDate(rs.getString("date"));
			rm.setViews(rs.getInt("views"));
			
			allrecipes.add(rm);
		}
		
		return allrecipes;
		
	}
	
	//Comparators module
	
	public static Comparator<RecipeMetaBean> recipeNameOrder = new Comparator<RecipeMetaBean>() {

		public int compare(RecipeMetaBean p1, RecipeMetaBean p2) {
		   String Name1 = p1.getTitle().toUpperCase();
		   String Name2 = p2.getTitle().toUpperCase();

		   //ascending order
		   return Name1.compareTo(Name2);

		   //descending order
		   //return StudentName2.compareTo(StudentName1);
	    }};
	
	public static Comparator<RecipeMetaBean> recipeRatingOrder = new Comparator<RecipeMetaBean>() {

			public int compare(RecipeMetaBean p1, RecipeMetaBean p2) {
			   int rating1 = p1.getRating();
			   int rating2 = p2.getRating();

			   //ascending order
			   return rating2 - rating1;

			   //descending order
			   //return StudentName2.compareTo(StudentName1);
		    }};


	public static Comparator<RecipeMetaBean> recipeViewsOrder = new Comparator<RecipeMetaBean>() {

				public int compare(RecipeMetaBean p1, RecipeMetaBean p2) {
				   int views1 = p1.getViews();
				   int views2 = p2.getViews();

				   //ascending order
				   return views2 - views1;

				   //descending order
				   //return StudentName2.compareTo(StudentName1);
			    }};
    

	public static Comparator<RecipeMetaBean> recipeDietOrder = new Comparator<RecipeMetaBean>() {

					public int compare(RecipeMetaBean p1, RecipeMetaBean p2) {
					   int diet1 = p1.getDiet();
					   int diet2 = p2.getDiet();

					   //ascending order
					   return diet1 - diet2;

					   //descending order
					   //return StudentName2.compareTo(StudentName1);
				    }};
				    

	public static Comparator<RecipeMetaBean> recipeDateOrder = new Comparator<RecipeMetaBean>() {

						public int compare(RecipeMetaBean p1, RecipeMetaBean p2) {
						   String date1 = p1.getDate();
						   String date2 = p2.getDate();
						   
						   DateDemo d = new DateDemo();

						   //ascending order
						   return d.subtractDateString(date1, date2);

						   //descending order
						   //return StudentName2.compareTo(StudentName1);
					    }};
		    
					    
					    
					    
	public static void showRecipeArray(ArrayList<RecipeMetaBean> recipes)
	{
		for(RecipeMetaBean r : recipes)
		{
		    System.out.println(r.getTitle());
		}	
	}
			    	    
	public static void main(String[] args) 
	{
		int userid = 1;
		RecipeMetaBean rm = new RecipeMetaBean();
		rm.setUserid(userid);
		try 
		{
			ArrayList<RecipeMetaBean> recipes = rm.RecipeMetaByUserId();
			Collections.sort(recipes, RecipeMetaBean.recipeDateOrder);
			
			for(RecipeMetaBean r : recipes)
			{
				System.out.println(r.getTitle() + " : date: " + r.getDate());
			}	
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
	}

}
