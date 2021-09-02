package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Comparator;

import util.DBConnection;

public class TypeBean 
{
	private int typeid;
	private String name;
	
	public int getTypeid() {
		return typeid;
	}
	public void setTypeid(int typeid) {
		this.typeid = typeid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public void showType()
	{
	   System.out.println(this.typeid + " : " + this.name);	
		
	}
	
	public int addType() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.cookdbConnect();
		
		
		//sql query
		
		String sql = "insert into type(name) values(?)";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, name);
			
		
		//execute
		//ps.execute();
		int res = ps.executeUpdate();
		
		//close the connection
		con.close();
		
		return res;
		
	}
	
	public TypeBean typeById() throws SQLException
	{
		//register the driver
				Connection con = DBConnection.cookdbConnect();
				
				//sql query
				
				String sql = "select *from type where typeid=?";
				
				//prepare statement
				
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setInt(1, typeid);
				
				TypeBean tb = new TypeBean();
				
				ResultSet rs = ps.executeQuery();
				
				while(rs.next())
				{
					tb.setTypeid(rs.getInt("typeid"));
					tb.setName(rs.getString("name"));
				}
				
	return tb;
				
	}
	
	public ArrayList<TypeBean> allTypes() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.cookdbConnect();
		
		//sql query
		
		String sql = "select *from type";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ArrayList<TypeBean> types = new ArrayList<>();
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next())
		{
			TypeBean tb = new TypeBean();
			tb.setTypeid(rs.getInt("typeid"));
			tb.setName(rs.getString("name"));
			types.add(tb);
		}
		
    return types;
	}
	
	public static Comparator<TypeBean> typeNameOrder = new Comparator<TypeBean>() {

		public int compare(TypeBean p1, TypeBean p2) {
		   String Name1 = p1.getName().toUpperCase();
		   String Name2 = p2.getName().toUpperCase();

		   //ascending order
		   return Name1.compareTo(Name2);

		   //descending order
		   //return StudentName2.compareTo(StudentName1);
	    }};

	
	
	public static void main(String[] args) 
	{
		TypeBean tb = new TypeBean();
		ArrayList<TypeBean> types = new ArrayList<>();
		
		try 
		{
			types = tb.allTypes();
			
			for(TypeBean t : types)
			{
				System.out.println(t.getTypeid() + " : " + t.getName());
			}	
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
