package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Comparator;

import util.DBConnection;

public class UserBean {
	
	private int userid;
	private String username;
	private String email;
	private String choice;
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getChoice() {
		return choice;
	}
	public void setChoice(String choice) {
		this.choice = choice;
	}
	
	public void showUser()
	{
		System.out.println("UserID : " + this.userid);
		System.out.println("Username : " + this.username);
		System.out.println("Email ID : " + this.email);
		System.out.println("Choices of Recipes : " + this.choice);
	}
	
	public int addUser() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.cookdbConnect();
		
		
		//sql query
		
		String sql = "insert into user(username,email,choice) values(?,?,?)";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, username);
		ps.setString(2,email);
		ps.setString(3, choice);
			
		
		//execute
		//ps.execute();
		int res = ps.executeUpdate();
		
		//close the connection
		con.close();
		
		return res;
		
	}
	
	public int updateUserById() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.cookdbConnect();
		
		
		//sql query
		
		String sql = "update user set username=?, email=?, choice=? where userid=?";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		
				
		ps.setString(1, username);
		ps.setString(2, email);
		ps.setString(3, choice);
		ps.setInt(4, userid);
		
		//execute
		//ps.execute();
		int res = ps.executeUpdate();
		
		//close the connection
		con.close();
		
		return res;	
	}
	
	
	public int updateUserChoiceByUserId() throws SQLException
	{
		
		//register the driver
				Connection con = DBConnection.cookdbConnect();
				
				
				//sql query
				
				String sql = "update user set choice=? where userid=?";
				
				//prepare statement
				
				PreparedStatement ps = con.prepareStatement(sql);
				
						
				ps.setString(1, choice);
				ps.setInt(2, userid);
				
				//execute
				//ps.execute();
				int res = ps.executeUpdate();
				
				//close the connection
				con.close();
				
				return res;
		
		
	}
	
	public ArrayList<UserBean> allUsers() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.cookdbConnect();
		
		
		//sql query
		
		String sql = "select *from user";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);	
		
		ArrayList<UserBean> alluser = new ArrayList<>();
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next())
		{
			UserBean ub = new UserBean();
			ub.setUserid(rs.getInt("userid"));
			ub.setUsername(rs.getString("username"));
			ub.setChoice(rs.getString("choice"));
			ub.setEmail(rs.getString("email"));
			
			alluser.add(ub);
		}
		
		return alluser;
		
	}

	public ArrayList<UserBean> UsersById() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.cookdbConnect();
		
		
		//sql query
		
		String sql = "select *from user where userid=?";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, userid);
		
		ArrayList<UserBean> alluser = new ArrayList<>();
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next())
		{
			UserBean ub = new UserBean();
			ub.setUserid(rs.getInt("userid"));
			ub.setUsername(rs.getString("username"));
			ub.setEmail(rs.getString("email"));
			ub.setChoice(rs.getString("choice"));
			
			alluser.add(ub);
		}
		
		return alluser;
		
	}
	
	public static Comparator<UserBean> userNameOrder = new Comparator<UserBean>() {

		public int compare(UserBean p1, UserBean p2) {
		   String Name1 = p1.getUsername().toUpperCase();
		   String Name2 = p2.getUsername().toUpperCase();

		   //ascending order
		   return Name1.compareTo(Name2);

		   //descending order
		   //return StudentName2.compareTo(StudentName1);
	    }};

	
	public static void main(String[] args) {
		
		UserBean ub = new UserBean();
		
		ub.setUserid(1);
		ub.setUsername("Renu Das");
		ub.setEmail("renu783das@gmail.com");
		ub.setChoice("indian bangladeshi moghlai");
		
		try {
			
				int res = ub.addUser();
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
