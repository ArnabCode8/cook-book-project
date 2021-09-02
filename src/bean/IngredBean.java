package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;

import com.sun.scenario.effect.AbstractShadow.ShadowMode;

import util.DBConnection;

public class IngredBean 
{
	private int ingredid;
	private String name;
	private int weight;
	
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	public int getIngredid() {
		return ingredid;
	}
	public void setIngredid(int ingredid) {
		this.ingredid = ingredid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public void showIngred()
	{
		System.out.println(this.ingredid + " : Name : " + this.name + " Weight : " + this.weight);
	}
	
	public int addIngred() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.cookdbConnect();
		
		
		//sql query
		
		String sql = "insert into ingreds(name,weight) values(?,?)";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, name);
		ps.setInt(2, weight);
			
		//execute
		//ps.execute();
		int res = ps.executeUpdate();
		
		//close the connection
		con.close();
		
		return res;
		
	}
	
	public IngredBean ingredById() throws SQLException
	{
		//register the driver
				Connection con = DBConnection.cookdbConnect();
				
				//sql query
				
				String sql = "select *from ingreds where ingredid=?";
				
				//prepare statement
				
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setInt(1, ingredid);
				
				
				ResultSet rs = ps.executeQuery();
				
				IngredBean tb = new IngredBean();
				
				while(rs.next())
				{
					tb.setIngredid(rs.getInt("ingredid"));
					tb.setName(rs.getString("name"));
					tb.setWeight(rs.getInt("weight"));
				}
				
	return tb;
				
	}
	
	public ArrayList<IngredBean> allIngreds() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.cookdbConnect();
		
		//sql query
		
		String sql = "select *from ingreds";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ArrayList<IngredBean> ingreds = new ArrayList<>();
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next())
		{
			IngredBean tb = new IngredBean();
			tb.setIngredid(rs.getInt("ingredid"));
			tb.setName(rs.getString("name"));
			tb.setWeight(rs.getInt("weight"));
			
			ingreds.add(tb);
		}
		
    return ingreds;
	}
	
	public static Comparator<IngredBean> ingredNameOrder = new Comparator<IngredBean>() {

		public int compare(IngredBean p1, IngredBean p2) {
		   String Name1 = p1.getName().toUpperCase();
		   String Name2 = p2.getName().toUpperCase();

		   //ascending order
		   return Name1.compareTo(Name2);

		   //descending order
		   //return StudentName2.compareTo(StudentName1);
	    }};

	public HashMap<Integer, Integer> ingredWeightMap() throws SQLException
	{
		HashMap<Integer, Integer> mp = new HashMap<>();
		IngredBean ib = new IngredBean();
		ArrayList<IngredBean> ingreds = ib.allIngreds();
		
		for(IngredBean i : ingreds)
		{
			int id = i.getIngredid();
			int wt = i.getWeight();
			
			mp.put(id, wt);
		}	
		
		return mp;
	}
	
	public void showMap(HashMap<Integer, Integer> mp)
	{
		if(!mp.isEmpty()) 
		{
	         
			Iterator<Integer> itr = mp.keySet().iterator();
			while (itr.hasNext()) 
			{
				Integer k = itr.next();
				System.out.println(k + " : " + mp.get(k));
			}

	     }
		
	}
	
	public static void main(String[] args) 
	{
		IngredBean ib = new IngredBean();
		try 
		{
			//ib.setName("");
			//ib.setWeight(2);
			
			int res = ib.addIngred();
			
			if(res == 1)
			{
				System.out.println("Successfully Added");
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
