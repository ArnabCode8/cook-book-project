package util;

import java.util.Comparator;

import bean.UserBean;

public class FollowerReviewCount 
{
	private int userid;
	private String name;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	private int cmtCount;
	private int ratingCount;
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getCmtCount() {
		return cmtCount;
	}
	public void setCmtCount(int cmtCount) {
		this.cmtCount = cmtCount;
	}
	public int getRatingCount() {
		return ratingCount;
	}
	public void setRatingCount(int ratingCount) {
		this.ratingCount = ratingCount;
	}
	
	public void showFollowerReview()
	{
		System.out.println("UserId : " + this.userid);
		System.out.println("Name : " + this.name);
		System.out.println("cmtCount : " + this.cmtCount);
		System.out.println("ratingCount : " + this.ratingCount);
	}
	
	public static Comparator<FollowerReviewCount> activityOrder = new Comparator<FollowerReviewCount>() {

		public int compare(FollowerReviewCount p1, FollowerReviewCount p2) {
		   
			int count1 = p1.getCmtCount() + p1.getRatingCount();
			int count2 = p2.getCmtCount() + p2.getRatingCount();
			
		   //ascending order
		   //return Name1.compareTo(Name2);
			return count2 - count1;

		   //descending order
		   //return StudentName2.compareTo(StudentName1);
	    }};

}
