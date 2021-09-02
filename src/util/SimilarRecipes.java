package util;

import java.util.Comparator;

import bean.UserBean;

public class SimilarRecipes 
{
	//primary
	private int recipeid;
	private String name;
	private int per;
	private int rating;
	private int views;
	
	//secondary
	private String writername;
	
	
	public String getWritername() {
		return writername;
	}
	public void setWritername(String writername) {
		this.writername = writername;
	}
	public int getRating() {
		return rating;
	}
	
	public void setRating(int rating) {
		this.rating = rating;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public int getRecipeid() {
		return recipeid;
	}
	public void setRecipeid(int recipeid) {
		this.recipeid = recipeid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPer() {
		return per;
	}
	public void setPer(int per) {
		this.per = per;
	}
	
	public void showSimilarRecipes()
	{
		System.out.println("recipeid : " + this.recipeid);
		System.out.println("name : " + this.name);
		System.out.println("similarity percent : " + this.per);
	}
	
	public static Comparator<SimilarRecipes> recipeSimilarityOrder = new Comparator<SimilarRecipes>() {

		public int compare(SimilarRecipes p1, SimilarRecipes p2) {
		   int per1 = p1.getPer();
		   int per2 = p2.getPer();

		   //ascending order
		   return per2 - per1;

		   //descending order
		   //return StudentName2.compareTo(StudentName1);
	    }};


}
