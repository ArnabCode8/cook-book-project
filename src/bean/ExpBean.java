package bean;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.Reader;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.Clob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.DBConnection;
import util.FileDemo1;

public class ExpBean 
{
	private int txtid;
	private String content;
	
	public int getTxtid() {
		return txtid;
	}
	public void setTxtid(int txtid) {
		this.txtid = txtid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public void addContent(String loc) throws SQLException
	{
		//register the driver
		Connection con = DBConnection.cookdbConnect();
		int res = 0;
		
		//sql query
		
		String sql = "insert into experiment(content) values(?)";
		
		//prepare statement
		
		File f = new File(loc);
		FileReader fr;
		try 
		{	
			fr = new FileReader(f);
			PreparedStatement ps = con.prepareStatement(sql);
			  
			ps.setCharacterStream(1,fr,(int)f.length());  
			
			
			//execute
			//ps.execute();
			 res = ps.executeUpdate();
			
			System.out.println("Successfully Entered");
			
			//close the connection
			con.close();
			
			
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		//return res;
	}
	
	
	public void updateContent(String loc) throws SQLException
	{
		//register the driver
		Connection con = DBConnection.cookdbConnect();
		
		
		//sql query
		
		String sql = "update experiment set content=? where txtid=?";
		
		//prepare statement
		
		int res = 0;
				
		File f = new File(loc);
		FileReader fr;
		try 
		{	
			fr = new FileReader(f);
			PreparedStatement ps = con.prepareStatement(sql);
			  
			ps.setCharacterStream(1,fr,(int)f.length());  
			ps.setInt(2, txtid);
			
			//execute
			//ps.execute();
			 res = ps.executeUpdate();
			
			System.out.println("Successfully Updated");
			
			//close the connection
			con.close();
			
			
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
	}
	
	public void retrieveContent(String loc) throws SQLException, IOException
	{
		Connection con = DBConnection.cookdbConnect();
		
		PreparedStatement ps=con.prepareStatement("select * from experiment where txtid=?");
		
		ps.setInt(1, txtid);
		
		ResultSet rs=ps.executeQuery();  
		rs.next();//now on 1st row  
		              
		Clob c=rs.getClob(2);  
		Reader r=c.getCharacterStream();              
		              
		FileWriter fw=new FileWriter(loc);  

		FileDemo1 fd = new FileDemo1();
		fd.clearTextFromFile(loc);
		
		int i;  
		while((i=r.read())!=-1)  
		fw.write((char)i);  
		              
		fw.close();  
		con.close();  
		              
		System.out.println("successfully Retrieved"); 
	}
	
	
	public static void main(String[] args) 
	{
		ExpBean eb = new ExpBean();
		String loc = "C:\\Users\\Arnab\\eclipse-workspace\\CookBookProject\\WebContent\\myFolder\\tempRecipe.txt";
		eb.setTxtid(1);
		
		try 
		{
			
			eb.updateContent(loc);
			
			//eb.retrieveContent(loc);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
