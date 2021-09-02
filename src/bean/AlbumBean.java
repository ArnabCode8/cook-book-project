package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.DBConnection;

public class AlbumBean 
{
	private int userid;
	private int albumid;
	private String name;
	private String content;
	
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getAlbumid() {
		return albumid;
	}
	public void setAlbumid(int albumid) {
		this.albumid = albumid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public int addAlbumRaw() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.cookdbConnect();
		
		
		//sql query
		
		String sql = "insert into album(userid,albumid,name,content) values(?,?,?,?)";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, userid);
		ps.setInt(2, albumid);
		ps.setString(3, name);
		ps.setString(4, content);
			
		
		//execute
		//ps.execute();
		int res = ps.executeUpdate();
		
		//close the connection
		con.close();
		
		return res;
		
	}
	
	public static int addAlbum(int userid,String name,String content) throws SQLException
	{
		AlbumBean ab = new AlbumBean();
		ab.setUserid(userid);
		ArrayList<AlbumBean> albums = ab.AlbumByUserId();
		if(albums.size() == 0)
		{
			ab.setUserid(userid);
			ab.setAlbumid(1);
			ab.setName(name);
			ab.setContent(content);
			
			int res = ab.addAlbumRaw();
			return res;
		}
		
		int aid = 0;
		for(AlbumBean a : albums)
		{
			aid = a.getAlbumid();
		}
		
		aid = aid + 1;
		ab.setUserid(userid);
		ab.setAlbumid(aid);
		ab.setName(name);
		ab.setContent(content);
		int res = ab.addAlbumRaw();
		
	return res;	
	}
	
	
	public static int editAlbumByUserAndAlbumId(int uid,int aid,String aname,String cont) throws SQLException
	{
		AlbumBean ab = new AlbumBean();
		ab.setUserid(uid);
		ab.setAlbumid(aid);
		ab.setName(aname);
		ab.setContent(cont);
		ArrayList<AlbumBean> als = ab.AlbumByUserAndAlbumId();
		int res = 0;
		if(als.size() == 0)
		{
			res = addAlbum(uid, aname, cont);
		}
		else
		{
			res = ab.updateAlbumByUserAndAlbumId(); 
		}	
		
	return res;	
	}
	
	public int updateContentByUserAndAlbumId() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.cookdbConnect();
		
		
		//sql query
		
		String sql = "update album set content=? where userid=? and albumid=?";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		
				
		ps.setString(1, content);
		ps.setInt(2, userid);
		ps.setInt(3, albumid);
		
		//execute
		//ps.execute();
		int res = ps.executeUpdate();
		
		//close the connection
		con.close();
		
		return res;	
	}
	
	public int updateNameByUserAndAlbumId() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.cookdbConnect();
		
		
		//sql query
		
		String sql = "update album set name=? where userid=? and albumid=?";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		
				
		ps.setString(1, name);
		ps.setInt(2, userid);
		ps.setInt(3, albumid);
		
		//execute
		//ps.execute();
		int res = ps.executeUpdate();
		
		//close the connection
		con.close();
		
		return res;	
	}
	
	public int updateAlbumByUserAndAlbumId() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.cookdbConnect();
		
		
		//sql query
		
		String sql = "update album set name=?, content=? where userid=? and albumid=?";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		
				
		ps.setString(1, name);
		ps.setString(2, content);
		ps.setInt(3, userid);
		ps.setInt(4, albumid);
		
		//execute
		//ps.execute();
		int res = ps.executeUpdate();
		
		//close the connection
		con.close();
		
		return res;	
	}
	
	public ArrayList<AlbumBean> AlbumByUserId() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.cookdbConnect();
		
		
		//sql query
		
		String sql = "select *from album where userid=?";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, userid);
		
		ArrayList<AlbumBean> albums = new ArrayList<>();
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next())
		{
			AlbumBean ub = new AlbumBean();
			ub.setUserid(rs.getInt("userid"));
			ub.setName(rs.getString("name"));
			ub.setAlbumid(rs.getInt("albumid"));
			ub.setContent(rs.getString("content"));
			
			albums.add(ub);
		}
		
		return albums;
		
	}
	
	public ArrayList<AlbumBean> AlbumByUserAndAlbumId() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.cookdbConnect();
		
		
		//sql query
		
		String sql = "select *from album where userid=? and albumid=?";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, userid);
		ps.setInt(2, albumid);
		
		ArrayList<AlbumBean> albums = new ArrayList<>();
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next())
		{
			AlbumBean ub = new AlbumBean();
			ub.setUserid(rs.getInt("userid"));
			ub.setName(rs.getString("name"));
			ub.setAlbumid(rs.getInt("albumid"));
			ub.setContent(rs.getString("content"));
			
			albums.add(ub);
		}
		
		return albums;
		
	}
	
	public void showAlbum()
	{
		System.out.println("userid : " + this.userid);
		System.out.println("albumid : " + this.albumid);
		System.out.println("album name : " + this.name);
		System.out.println("content : " + this.content);
	}
	
	
	
	public static int reduceRecipeFromAlbum(int recipeid,int albumid,int userid) throws SQLException
	{
		AlbumBean ab = new AlbumBean();
		ab.setAlbumid(albumid);
		ab.setUserid(userid);
		AlbumBean a = ab.AlbumByUserAndAlbumId().get(0); //only cont of a will be updated
		String contStr = a.getContent();
		String[] contArr = contStr.split(" ");
		String tempStr = "";
		for(String s : contArr)
		{
			if(Integer.parseInt(s.trim()) != recipeid)
			{
				tempStr = tempStr + s.trim() + " ";
			}	
		}
		
		int len = tempStr.length();
		tempStr = tempStr.substring(0, len-1);
		a.setContent(tempStr);
		int res = a.updateContentByUserAndAlbumId();
	return res;	
	}
	
	public int deleteAlbumByAlbumIdAndUserId() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.cookdbConnect();
		
		
		//sql query
		
		String sql = "delete from album where albumid=? and userid=?";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, albumid);
		ps.setInt(2, userid);
		
		//execute
		//ps.execute();
		int res = ps.executeUpdate();
		
		//close the connection
		con.close();
		
		return res;
	}
	
	
	public static void main(String[] args) 
	{
		AlbumBean ab = new AlbumBean();
		ab.setUserid(1);
		try 
		{
			ArrayList<AlbumBean> albums = ab.AlbumByUserId();
			for(AlbumBean a : albums)
			{
				a.showAlbum();
			}	
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
