package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.DBConnection;

public class LikedBean 
{
	private int userid;
	private int recipeid;
	
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getRecipeid() {
		return recipeid;
	}
	public void setRecipeid(int recipeid) {
		this.recipeid = recipeid;
	}
	
	public int addLike() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.cookdbConnect();
		
		
		//sql query
		
		String sql = "insert into liked(userid,recipeid) values(?,?)";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, userid);
		ps.setInt(2, recipeid);
		
		//execute
		//ps.execute();
		int res = ps.executeUpdate();
		
		//close the connection
		con.close();
		
		return res;
		
	}
	
	public ArrayList<LikedBean> likesByUserIdAndRecipeId() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.cookdbConnect();
		
		
		//sql query
		
		String sql = "select *from liked where userid=? and recipeid=?";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, userid);
		ps.setInt(2, recipeid);
		
		ArrayList<LikedBean> alllikes = new ArrayList<>();
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next())
		{
			LikedBean lb = new LikedBean();
			
			lb.setUserid(rs.getInt("userid"));
			lb.setRecipeid(rs.getInt("recipeid"));
			
			alllikes.add(lb);
		}
		
		return alllikes;
	}
	
	
	public ArrayList<LikedBean> likesByUserId() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.cookdbConnect();
		
		
		//sql query
		
		String sql = "select *from liked where userid=?";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, userid);
		
		ArrayList<LikedBean> alllikes = new ArrayList<>();
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next())
		{
			LikedBean lb = new LikedBean();
			
			lb.setUserid(rs.getInt("userid"));
			lb.setRecipeid(rs.getInt("recipeid"));
			
			alllikes.add(lb);
		}
		
		return alllikes;
	}
	
	public ArrayList<LikedBean> likesByRecipeId() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.cookdbConnect();
		
		
		//sql query
		
		String sql = "select *from liked where recipeid=?";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, recipeid);
		
		ArrayList<LikedBean> alllikes = new ArrayList<>();
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next())
		{
			LikedBean lb = new LikedBean();
			
			lb.setUserid(rs.getInt("userid"));
			lb.setRecipeid(rs.getInt("recipeid"));
			
			alllikes.add(lb);
		}
		
		return alllikes;
	}
	
	
	public int deleteLikeByUserAndRecipeId() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.cookdbConnect();
		
		
		//sql query
		
		String sql = "delete from liked where userid=? and recipeid=?";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, userid);
		ps.setInt(2, recipeid);
		
		//execute
		//ps.execute();
		int res = ps.executeUpdate();
		
		//close the connection
		con.close();
		
		return res;
	}
	
	public void showLike()
	{
		System.out.println("userid : " + this.userid + " Likes recipeid : " + this.recipeid);
	}
	
	public static void main(String[] args) 
	{
		LikedBean lb = new LikedBean();
		lb.setUserid(2);
		
		try 
		{
			ArrayList<LikedBean> likes = lb.likesByUserId();
			for(LikedBean l : likes)
			{
				l.showLike();
			}	
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
