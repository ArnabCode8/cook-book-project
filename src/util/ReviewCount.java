package util;

import java.sql.SQLException;
import java.util.ArrayList;

import bean.CommentBean;
import bean.RatingBean;

public class ReviewCount 
{
	private int recipeid;
	public int getRecipeid() {
		return recipeid;
	}
	public void setRecipeid(int recipeid) {
		this.recipeid = recipeid;
	}

	private int oneCount;
	private int twoCount;
	private int threeCount;
	private int fourCount;
	private int fiveCount;
	private int cmtCount;
	
	
	public int getOneCount() {
		return oneCount;
	}
	public void setOneCount(int oneCount) {
		this.oneCount = oneCount;
	}
	public int getTwoCount() {
		return twoCount;
	}
	public void setTwoCount(int twoCount) {
		this.twoCount = twoCount;
	}
	public int getThreeCount() {
		return threeCount;
	}
	public void setThreeCount(int threeCount) {
		this.threeCount = threeCount;
	}
	public int getFourCount() {
		return fourCount;
	}
	public void setFourCount(int fourCount) {
		this.fourCount = fourCount;
	}
	public int getFiveCount() {
		return fiveCount;
	}
	public void setFiveCount(int fiveCount) {
		this.fiveCount = fiveCount;
	}
	public int getCmtCount() {
		return cmtCount;
	}
	public void setCmtCount(int cmtCount) {
		this.cmtCount = cmtCount;
	}
	
	public void setReview(int recipeid) throws SQLException
	{
		RatingBean rb = new RatingBean();
		rb.setRecipeid(recipeid);
		ArrayList<RatingBean> rates = rb.ratingByRecipeId();
		int r1 = 0,r2 = 0,r3 = 0,r4 = 0,r5 = 0;
		for(RatingBean r : rates)
		{
			if(r.getRate() == 1)
			{
				r1 = r1 + 1;
			}
			else if(r.getRate() == 2)
			{
				r2 = r2 + 1;
			}
			else if(r.getRate() == 3)
			{
				r3 = r3 + 1;
			}
			else if(r.getRate() == 4)
			{
				r4 = r4 + 1;
			}
			else if(r.getRate() == 5)
			{
				r5 = r5 + 1;
			}
		}
		
		this.oneCount = r1;
		this.twoCount = r2;
		this.threeCount = r3;
		this.fourCount = r4;
		this.fiveCount = r5;
		
		CommentBean cb = new CommentBean();
		cb.setRecipeid(recipeid);
		ArrayList<CommentBean> cmts = cb.CommentsByRecipeId();
		this.cmtCount = cmts.size();
		this.recipeid = recipeid;
	}
	
	public void showReviewCount()
	{
		System.out.println("RecipeId : " + this.recipeid);
		System.out.println(this.oneCount + " : Rated One");
		System.out.println(this.twoCount + " : Rated Two");
		System.out.println(this.threeCount + " : Rated Three");
		System.out.println(this.fourCount + " : Rated Four");
		System.out.println(this.fiveCount + " : Rated Five");
		System.out.println("Comments : " + this.cmtCount);
	}
	
	public static void main(String[] args) 
	{
	   int recipeid = 1;
	   ReviewCount rc = new ReviewCount();
	   try 
	   {
		
		   rc.setReview(recipeid);
		   rc.showReviewCount();
		   
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
