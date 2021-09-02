package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.DBConnection;

public class RatingBean 
{
	private int recipeid;
	private int userid;
	private int rate;
	public int getRecipeid() {
		return recipeid;
	}
	public void setRecipeid(int recipeid) {
		this.recipeid = recipeid;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getRate() {
		return rate;
	}
	public void setRate(int rate) {
		this.rate = rate;
	}
	
	public int addRating() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.cookdbConnect();
		
		
		//sql query
		
		String sql = "insert into rating(recipeid,userid,rate) values(?,?,?)";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, recipeid);
		ps.setInt(2,userid);
		ps.setInt(3, rate);
			
		
		//execute
		//ps.execute();
		int res = ps.executeUpdate();
		
		//close the connection
		con.close();
		
		return res;
		
	}
	
	public int updateRating() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.cookdbConnect();
		
		
		//sql query
		
		String sql = "update rating set rate=? where recipeid=? and userid=?";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		
				
		ps.setInt(1, rate);
		ps.setInt(2, recipeid);
		ps.setInt(3, userid);
		
		//execute
		//ps.execute();
		int res = ps.executeUpdate();
		
		//close the connection
		con.close();
		
		return res;	
	}
	
	
	public ArrayList<RatingBean> ratingByRecipeId() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.cookdbConnect();
		
		
		//sql query
		
		String sql = "select *from rating where recipeid=?";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, recipeid);
		
		ArrayList<RatingBean> allrates = new ArrayList<>();
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next())
		{
			RatingBean rb = new RatingBean();
			
			rb.setRecipeid(rs.getInt("recipeid"));
			rb.setUserid(rs.getInt("userid"));
			rb.setRate(rs.getInt("rate"));
			
			allrates.add(rb);
		}
		
		return allrates;
		
	}

	public ArrayList<RatingBean> ratingByRecipeIdAndUserId() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.cookdbConnect();
		
		
		//sql query
		
		String sql = "select *from rating where recipeid=? and userid=?";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);	
		ps.setInt(1, recipeid);
		ps.setInt(2, userid);
		
		
		ArrayList<RatingBean> allrates = new ArrayList<>();
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next())
		{
			RatingBean rb = new RatingBean();
			
			rb.setRecipeid(rs.getInt("recipeid"));
			rb.setUserid(rs.getInt("userid"));
			rb.setRate(rs.getInt("rate"));
			
			allrates.add(rb);
		}
		
		return allrates;
		
	}
	
	public void showRates()
	{
		System.out.println("Recipe Id : " + this.recipeid);
		System.out.println("User Id : " + this.userid);
		System.out.println("Rating is : " + this.rate);
	}

	public static void main(String[] args) 
	{
		RatingBean rb = new RatingBean();
		rb.setRecipeid(1);
		rb.setUserid(1);
		rb.setRate(4);
		
		try 
		{
	       int res = rb.addRating();
	       if(res == 1)
	       {
	    	   System.out.println("Successful");
	       }
	       else
	       {
	    	   System.out.println("Failed");
	       }
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
