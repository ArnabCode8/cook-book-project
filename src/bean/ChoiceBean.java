package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Comparator;

import util.DBConnection;

public class ChoiceBean {
	
	private int choiceid;
	private String name;
	
	public int getChoiceid() {
		return choiceid;
	}
	public void setChoiceid(int choiceid) {
		this.choiceid = choiceid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public void showChoice()
	{
		System.out.println("Choice Id : " + this.choiceid);
		System.out.println("Choice Name : " + this.name);
	}
	
	public static Comparator<ChoiceBean> choiceNameOrder = new Comparator<ChoiceBean>() {

		public int compare(ChoiceBean p1, ChoiceBean p2) {
		   String Name1 = p1.getName().toUpperCase();
		   String Name2 = p2.getName().toUpperCase();

		   //ascending order
		   return Name1.compareTo(Name2);

		   //descending order
		   //return StudentName2.compareTo(StudentName1);
	    }};

	
	
	public int addChoice() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.cookdbConnect();
		
		
		//sql query
		
		String sql = "insert into choice(name) values(?)";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1,name);
		
			
		
		//execute
		//ps.execute();
		int res = ps.executeUpdate();
		
		//close the connection
		con.close();
		
		return res;
		
	}

	public ArrayList<ChoiceBean> allChoices() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.cookdbConnect();
		
		
		//sql query
		
		String sql = "select *from choice";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);	
		
		ArrayList<ChoiceBean> allchoices = new ArrayList<>();
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next())
		{
			ChoiceBean cb = new ChoiceBean();
			cb.setChoiceid(rs.getInt("choiceid"));
			cb.setName(rs.getString("name"));
			
			allchoices.add(cb);
		}
		
		return allchoices;
		
	}

	public ArrayList<ChoiceBean> ChoiceById() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.cookdbConnect();
		
		
		//sql query
		
		String sql = "select *from choice where choiceid=?";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, choiceid);
		
		ArrayList<ChoiceBean> choices = new ArrayList<>();
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next())
		{
			ChoiceBean cb = new ChoiceBean();
			cb.setChoiceid(rs.getInt("choiceid"));
			cb.setName(rs.getString("name"));
			
			
			choices.add(cb);
		}
		
		return choices;
		
	}

	public static void main(String[] args) 
	{
		ChoiceBean cb = new ChoiceBean();
		
		try {
			
				ArrayList<ChoiceBean> choices = cb.allChoices();
				
				for(ChoiceBean c : choices)
				{
					c.showChoice();
				}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
