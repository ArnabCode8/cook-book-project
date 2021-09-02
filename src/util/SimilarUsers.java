package util;

import java.util.Comparator;

import bean.UserBean;

public class SimilarUsers 
{
	private int userid;
	private String name;
	private int per;
	private int count;
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
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
	
	
	public static Comparator<SimilarUsers> similarUserPercentOrder = new Comparator<SimilarUsers>() {

		public int compare(SimilarUsers p1, SimilarUsers p2) {
		   int per1 = p1.getPer();
		   int per2 = p2.getPer();
		   //ascending order
		   return (per2 - per1);

		   //descending order
		   //return StudentName2.compareTo(StudentName1);
	    }};
	
	
	public void showSimilarUser()
	{
		System.out.println("userid : " + this.userid);
		System.out.println("name : " + this.name);
		System.out.println("similarity percent : " + this.per);
		System.out.println("Content count : " + this.count);
	}
	

}
