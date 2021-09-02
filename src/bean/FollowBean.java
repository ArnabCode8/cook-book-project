package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.DBConnection;

public class FollowBean 
{
	private int follows;
	private int followed;
	public int getFollows() {
		return follows;
	}
	public void setFollows(int follows) {
		this.follows = follows;
	}
	public int getFollowed() {
		return followed;
	}
	public void setFollowed(int followed) {
		this.followed = followed;
	}
	
	public int addFollow() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.cookdbConnect();
		
		
		//sql query
		
		String sql = "insert into follow(follows,followed) values(?,?)";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, follows);
		ps.setInt(2, followed);
		
		//execute
		//ps.execute();
		int res = ps.executeUpdate();
		
		//close the connection
		con.close();
		
		return res;
		
	}
	
	
	
	public ArrayList<FollowBean> FollowsByFollowed() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.cookdbConnect();
		
		
		//sql query
		
		String sql = "select *from follow where followed=?";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, followed);
		
		ArrayList<FollowBean> allfollows = new ArrayList<>();
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next())
		{
			FollowBean fb = new FollowBean();
			
			fb.setFollows(rs.getInt("follows"));
			fb.setFollowed(rs.getInt("followed"));
			
			allfollows.add(fb);
		}
		
		return allfollows;
		
	}
	
	public ArrayList<FollowBean> FollowsByFollowsId() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.cookdbConnect();
		
		
		//sql query
		
		String sql = "select *from follow where follows=?";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, follows);
		
		ArrayList<FollowBean> allfollows = new ArrayList<>();
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next())
		{
			FollowBean fb = new FollowBean();
			
			fb.setFollows(rs.getInt("follows"));
			fb.setFollowed(rs.getInt("followed"));
			
			allfollows.add(fb);
		}
		
		return allfollows;
		
	}
	
	public int deleteFollowByFollowAndFollowedId() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.cookdbConnect();
		
		
		//sql query
		
		String sql = "delete from follow where follows=? and followed=?";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, follows);
		ps.setInt(2, followed);
		
		//execute
		//ps.execute();
		int res = ps.executeUpdate();
		
		//close the connection
		con.close();
		
		return res;
	}
	
	
	
	public void showFollow()
	{
		System.out.println(this.follows + " follows : " + this.followed);
	}
	
	
	public static void main(String[] args) 
	{
		FollowBean fb = new FollowBean();
		fb.setFollowed(3);
		fb.setFollows(1);
		
		try 
		{
			int res = fb.addFollow();
			if(res == 1)
			{
				System.out.println("Successfully Added");
			}	
			else
			{
				System.out.println("Failed to Add");
			}	
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
