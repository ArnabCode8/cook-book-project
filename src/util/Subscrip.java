package util;

import java.util.Comparator;

import bean.UserBean;

public class Subscrip 
{
	private int userid;
	private String name;
	private int newCont;
	
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
	public int getNewCont() {
		return newCont;
	}
	public void setNewCont(int newCont) {
		this.newCont = newCont;
	}
	
	public void showSubscript()
	{
		System.out.println("userid : " + this.userid);
		System.out.println("name : " + this.name);
		System.out.println("new Count : " + this.newCont);
	}
	
	public static Comparator<Subscrip> newContOrder = new Comparator<Subscrip>() {

		public int compare(Subscrip p1, Subscrip p2) {
		   int c1 = p1.getNewCont();
		   int c2 = p2.getNewCont();

		   //ascending order
		   return (c2 - c1);

		   //descending order
		   //return StudentName2.compareTo(StudentName1);
	    }};


}
