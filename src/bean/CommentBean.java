package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.DBConnection;

public class CommentBean 
{
   private int commentid;
   private int userid;
   private int recipeid;
   private String commentText;

	public int getCommentid() {
		return commentid;
	}
	public void setCommentid(int commentid) {
		this.commentid = commentid;
	}
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
	public String getCommentText() {
		return commentText;
	}
	public void setCommentText(String commentText) {
		this.commentText = commentText;
	}
	
	public int addCommentRaw() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.cookdbConnect();
		
		
		//sql query
		
		String sql = "insert into comments(commentid,userid,recipeid,commentText) values(?,?,?,?)";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, commentid);
		ps.setInt(2,userid);
		ps.setInt(3, recipeid);
		ps.setString(4, commentText);
			
		
		//execute
		//ps.execute();
		int res = ps.executeUpdate();
		
		//close the connection
		con.close();
		
		return res;
		
	}
	
	public ArrayList<CommentBean> CommentsByUserIdRecipeId() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.cookdbConnect();
		
		
		//sql query
		
		String sql = "select *from comments where userid=? and recipeid=?";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, userid);
		ps.setInt(2, recipeid);
		
		ArrayList<CommentBean> allcmt = new ArrayList<>();
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next())
		{
			CommentBean cb = new CommentBean();
			cb.setUserid(rs.getInt("userid"));
			cb.setCommentid(rs.getInt("commentid"));
			cb.setRecipeid(rs.getInt("recipeid"));
			cb.setCommentText(rs.getString("commentText"));
			
			allcmt.add(cb);
		}
		
		return allcmt;
		
	}
	
	public ArrayList<CommentBean> CommentsByRecipeId() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.cookdbConnect();
		
		
		//sql query
		
		String sql = "select *from comments where recipeid=?";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, recipeid);
		
		ArrayList<CommentBean> allcmt = new ArrayList<>();
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next())
		{
			
			CommentBean cb = new CommentBean();
			cb.setUserid(rs.getInt("userid"));
			cb.setCommentid(rs.getInt("commentid"));
			cb.setRecipeid(rs.getInt("recipeid"));
			cb.setCommentText(rs.getString("commentText"));
			
			allcmt.add(cb);
		}
		
		return allcmt;	
	}
    
	public int updateComment() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.cookdbConnect();
		
		
		//sql query
		
		String sql = "update comments set commentText=? where commentid=? and userid=? and recipeid=?";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		
				
		ps.setString(1, commentText);
		ps.setInt(2, commentid);
		ps.setInt(3, userid);
		ps.setInt(4, recipeid);
		
		//execute
		//ps.execute();
		int res = ps.executeUpdate();
		
		//close the connection
		con.close();
		
		return res;	
	}
   
	public void showComment()
	{
		System.out.println("Comment Id : " + this.commentid);
		System.out.println("User Id : " + this.userid);
		System.out.println("Recipe Id : " + this.recipeid);
		System.out.println("Comment Text : " + this.commentText);
		System.out.println("Length : " + this.commentText.length());
	}
	
	
	public static void main(String[] args) 
	{
	   CommentBean cb = new CommentBean();
	   cb.setRecipeid(1);
	   try 
	   {
		   
		ArrayList<CommentBean> cmts = cb.CommentsByRecipeId();
		
		for(CommentBean c : cmts)
		{
			c.showComment();
		}	
		
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	   
	   
	//end of driver code	
	}
	
}
