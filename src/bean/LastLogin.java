package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.DBConnection;

public class LastLogin 
{
	private int userid;
	private String lastlogindate;
	
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getLastlogindate() {
		return lastlogindate;
	}
	public void setLastlogindate(String lastlogindate) {
		this.lastlogindate = lastlogindate;
	}
	
	public int addLastLoginDateToUserIdRaw() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.cookdbConnect();
		
		
		//sql query
		
		String sql = "insert into lastlogin(userid,lastlogindate) values(?,?)";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, userid);
		ps.setString(2, lastlogindate);
		
		//execute
		//ps.execute();
		int res = ps.executeUpdate();
		
		//close the connection
		con.close();
		
		return res;
		
	}
	
	public int updateLastLoginDateToUserId() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.cookdbConnect();
		
		
		//sql query
		
		String sql = "update lastlogin set lastlogindate=? where userid=?";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		
				
		ps.setString(1, lastlogindate);
		ps.setInt(2, userid);
		
		//execute
		//ps.execute();
		int res = ps.executeUpdate();
		
		//close the connection
		con.close();
		
		return res;	
	}
	
	public ArrayList<LastLogin> lastLoginByUserId() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.cookdbConnect();
		
		
		//sql query
		
		String sql = "select *from lastlogin where userid=?";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, userid);
		
		ArrayList<LastLogin> logs = new ArrayList<>();
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next())
		{
			LastLogin ll = new LastLogin();
			ll.setUserid(rs.getInt("userid"));
			ll.setLastlogindate(rs.getString("lastlogindate"));
			
			logs.add(ll);
		}
		
		return logs;
	}
	
	public static int addLastLoginDateToUserId(int userid,String date1) throws SQLException
	{
		LastLogin ll = new LastLogin();
		ll.setUserid(userid);
		ll.setLastlogindate(date1);
		ArrayList<LastLogin> logs = ll.lastLoginByUserId();
		int res = 0;
		if(logs.size() == 0)
		{
			res = ll.addLastLoginDateToUserIdRaw();
		}
		else
		{
			res = ll.updateLastLoginDateToUserId();
		}
		
	return res;	
	}
	
	public static void main(String[] args) {
		
		try 
		{
			int res = addLastLoginDateToUserId(1, "2020-06-08");
			if(res == 1)
			{
				System.out.println("Successfully last login added");
			}
			else
			{
				System.out.println("last login entry failed");
			}	
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
