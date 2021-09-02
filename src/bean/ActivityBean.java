package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.DBConnection;
import util.DateDemo;

public class ActivityBean 
{
	
	private String status;
	private int count;
	private String idstr;
	private String extrainfo;
	private String date;
	private String statement;
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getIdstr() {
		return idstr;
	}
	public String getExtrainfo() {
		return extrainfo;
	}
	public void setExtrainfo(String extrainfo) {
		this.extrainfo = extrainfo;
	}
	public void setIdstr(String idstr) {
		this.idstr = idstr;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getStatement() {
		return statement;
	}
	public void setStatement(String statement) {
		this.statement = statement;
	}
	
	public int addActivityRaw() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.cookdbConnect();
		
		
		//sql query
		
		String sql = "insert into activity(status,count,idstr,extrainfo,date,statement) values(?,?,?,?,?,?)";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, status);
		ps.setInt(2, count);
		ps.setString(3, idstr);
		ps.setString(4, extrainfo);
		ps.setString(5, date);
		ps.setString(6, statement);
			
		
		//execute
		//ps.execute();
		int res = ps.executeUpdate();
		
		//close the connection
		con.close();
		
		return res;
		
	}
	
	public int updateActivityByStatusAndIdStr() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.cookdbConnect();
		
		
		//sql query
		
		String sql = "update activity set count=?, extrainfo=?, date=?, statement=? where status=? and idstr=?";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(5, status);
		ps.setInt(1, count);
		ps.setString(6, idstr);
		ps.setString(2, extrainfo);
		ps.setString(3, date);
		ps.setString(4, statement);
		
		//execute
		//ps.execute();
		int res = ps.executeUpdate();
		
		//close the connection
		con.close();
		
		return res;	
	}
	
	public ArrayList<ActivityBean> activityByStatusAndIdStr() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.cookdbConnect();
		
		
		//sql query
		
		String sql = "select *from activity where status=? and idstr=?";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, status);
		ps.setString(2, idstr);
		
		ArrayList<ActivityBean> activities = new ArrayList<>();
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next())
		{
			ActivityBean ab = new ActivityBean();
			ab.setStatus(rs.getString("status"));
			ab.setCount(rs.getInt("count"));
			ab.setIdstr(rs.getString("idstr"));
			ab.setExtrainfo(rs.getString("extrainfo"));
			ab.setDate(rs.getString("date"));
			ab.setStatement(rs.getString("statement"));
			
			activities.add(ab);
		}
		
		return activities;
	}
	
	public static int addRateNot(int recipeid,int doerid,int rate) throws SQLException
	{
	   String status = "rate";
	   String idstr = String.valueOf(recipeid);
	   
	   UserBean ub = new UserBean();
	   ub.setUserid(doerid);
	   UserBean u = ub.UsersById().get(0);
	   
	   RecipeMetaBean rm = new RecipeMetaBean();
	   rm.setRecipeid(recipeid);
	   RecipeMetaBean r = rm.RecipeMetaByRecipeId().get(0);
       String rname = r.getTitle();	   
	   String uname = u.getUsername();
	   DateDemo dd = new DateDemo();
	   String date = dd.getCurrentDate();
	   ActivityBean ab = new ActivityBean();
	   
	   ab.setStatus(status);
	   ab.setIdstr(idstr);
	  
	   int res = 0;
	   
	   ArrayList<ActivityBean> acts = ab.activityByStatusAndIdStr();
	   if(acts.size() == 0)
	   {
		   //no activity on this event, so add activity
		   //status count idstr extrainfo date statement
		   String statement = uname + " rated " + String.valueOf(rate) + " to your recipe: " + rname; 
		   String extrainfo = String.valueOf(doerid);
		   
		   ab.setCount(1);
		   ab.setExtrainfo(extrainfo);
		   ab.setDate(date);
		   ab.setStatement(statement);
		   
		   res = ab.addActivityRaw();
	   }
	   else
	   {
		   ActivityBean a = acts.get(0);
		   //extract extrainfo count from it
		   //extrainfo component replace
		   int c = a.getCount();
		   int exid = Integer.parseInt(a.getExtrainfo().trim());
		   String statement = uname + " rated : " + String.valueOf(rate) + ", along with " + String.valueOf(c) + " others ";
		   statement = statement + "to your recipe: " + rname;
		   c = c + 1;
		   String extrainfo = String.valueOf(doerid);
		   
		   ab.setCount(c);
		   ab.setExtrainfo(extrainfo);
		   ab.setDate(date);
		   ab.setStatement(statement);
		   
		   res = ab.updateActivityByStatusAndIdStr();
	   }	   
	   
	   return res;
	}
	
	public static int updateRateNot(int recipeid,int doerid,int rate) throws SQLException
	{
		RecipeMetaBean rm = new RecipeMetaBean();
		rm.setRecipeid(recipeid);
		RecipeMetaBean r = rm.RecipeMetaByRecipeId().get(0);
		String rname = r.getTitle();
		UserBean ub = new UserBean();
		ub.setUserid(doerid);
		UserBean u = ub.UsersById().get(0);
		String uname = u.getUsername();
		String status = "rate";
		String idstr = String.valueOf(recipeid);
		ActivityBean ab = new ActivityBean();
		
		ab.setStatus(status);
		ab.setIdstr(idstr);
		
		ActivityBean a = ab.activityByStatusAndIdStr().get(0);
		int c = a.getCount();
		String extrainfo = String.valueOf(doerid);
		String statement = uname + " rated : " + String.valueOf(rate) + ", along with " + String.valueOf(c) + " others ";
		statement = statement + "to your recipe: " + rname;
		DateDemo dd = new DateDemo();
		String date = dd.getCurrentDate();
		
		ab.setCount(c);
		ab.setExtrainfo(extrainfo);
		ab.setDate(date);
		ab.setStatement(statement);
		
		int res = ab.updateActivityByStatusAndIdStr();
		return res;
	}
	
    public static int addLikeNot(int recipeid,int doerid) throws SQLException
    {
    	UserBean ub = new UserBean();
    	ub.setUserid(doerid);
    	UserBean u = ub.UsersById().get(0);
    	String uname = u.getUsername();
    	RecipeMetaBean rm = new RecipeMetaBean();
    	rm.setRecipeid(recipeid);
    	RecipeMetaBean r = rm.RecipeMetaByRecipeId().get(0);
    	String rname = r.getTitle();
    	DateDemo dd = new DateDemo();
    	String date = dd.getCurrentDate();
    
    	String status = "like";
    	String idstr = String.valueOf(recipeid);
    	ActivityBean ab = new ActivityBean();
    	
    	ab.setStatus(status);
    	ab.setIdstr(idstr);
    	
    	int res = 0;
    	ArrayList<ActivityBean> acts = ab.activityByStatusAndIdStr();
    	if(acts.size() == 0)
    	{
    		String extrainfo = String.valueOf(doerid);
    		String statement = uname + " liked your recipe: " + rname;
            
    		ab.setCount(1);
    		ab.setDate(date);
    		ab.setExtrainfo(extrainfo);
    		ab.setStatement(statement);
    		
    		res = ab.addActivityRaw();
    	}
    	else
    	{
    		ActivityBean a = acts.get(0);
    		int c = a.getCount();
    		
    		String extrainfo = String.valueOf(doerid);
    		String statement = uname + " and" + String.valueOf(c) + " liked your recipe: " + rname;
    		c = c + 1;
            
    		ab.setCount(c);
    		ab.setDate(date);
    		ab.setExtrainfo(extrainfo);
    		ab.setStatement(statement);
    		
    		res = ab.updateActivityByStatusAndIdStr();
    	}	
    	
       return res;	
    }
    
    public static int addUnlikeNot(int recipeid, int doerid) throws SQLException
    {
    	String status = "like";
    	String idstr = String.valueOf(recipeid);
    	ActivityBean ab = new ActivityBean();
    	
    	ab.setStatus(status);
    	ab.setIdstr(idstr);
    	
    	ArrayList<ActivityBean> acts = ab.activityByStatusAndIdStr();
    	ActivityBean a = acts.get(0);
    	int exid = Integer.parseInt(a.getExtrainfo().trim());
    	DateDemo dd = new DateDemo();
    	String date = dd.getCurrentDate();
    	UserBean ub = new UserBean();
    	ub.setUserid(doerid);
    	UserBean u = ub.UsersById().get(0);
    	String uname = u.getUsername();
    	RecipeMetaBean rm = new RecipeMetaBean();
    	rm.setRecipeid(recipeid);
    	RecipeMetaBean r = rm.RecipeMetaByRecipeId().get(0);
    	String rname = r.getTitle();
    	int res = 0;
    	if(exid != doerid)
    	{
    		int c = a.getCount();
    		c = c - 1;
    		String statement = uname + " unliked, currently " + String.valueOf(c) + " likes on your recipe: " + rname;
    		a.setCount(c);
    		a.setStatement(statement);
    		a.setDate(date);
    		//that means before unlike, there was atleast two person liking the recipe
    		res = a.updateActivityByStatusAndIdStr();
    	}	
    	else
    	{
    		//here c will be checked if
    		
    		int c = a.getCount();
    		if(c == 1)
    		{
    			//set extrainfo 0
    			//set count 0
    			//set date statement
    			String extrainfo = String.valueOf(0);
    			String statement = uname + " unliked, currently no one likes on your recipe: " + rname;
    			
    			a.setCount(0);
    			a.setExtrainfo(extrainfo);
    			a.setDate(date);
    			a.setStatement(statement);
    			
    			res = a.updateActivityByStatusAndIdStr();
    		}
    		else
    		{
    			//update extrainfo
    			//set count 0
    			//set date statement
    			LikedBean lb = new LikedBean();
    			lb.setRecipeid(recipeid);
    			ArrayList<LikedBean> likes = lb.likesByRecipeId();
    			int id = 0;
    			for(LikedBean l : likes)
    			{
    				id = l.getUserid();
    			}	
    			String extrainfo = String.valueOf(id);
    			c = c - 1;
    			String statement = uname + " unliked, currently " + String.valueOf(c) + " likes on your recipe: " + rname;
    			a.setDate(date);
    			a.setCount(c);
    			a.setExtrainfo(extrainfo);
    			a.setStatement(statement);
    			
    			res = a.updateActivityByStatusAndIdStr();
    		}	
    		
    	}	
    	
    return res;	
    	
    }
    
    public static int addFollowNot(int userid, int followerid) throws SQLException
    {
       String idstr = String.valueOf(userid);
       String status = "follow";
       ActivityBean ab = new ActivityBean();
       
       ab.setStatus(status);
       ab.setIdstr(idstr);
       
       UserBean ub = new UserBean();
       ub.setUserid(followerid);
       UserBean u = ub.UsersById().get(0);
       String uname = u.getUsername();
       DateDemo dd = new DateDemo();
       String date = dd.getCurrentDate();
       ab.setDate(date);
       String extrainfo = String.valueOf(0);
       ab.setExtrainfo(extrainfo);
       String statement = "";
       int count = 0;
       int res = 0;
       
       ArrayList<ActivityBean> acts = ab.activityByStatusAndIdStr();
       if(acts.size() == 0)
       {
    	   statement = uname + " followes you now.";
    	   count = 1;
    	   ab.setCount(count);
           ab.setStatement(statement);
           res = ab.addActivityRaw();
       }
       else
       {
    	   ActivityBean a = acts.get(0);
    	   count = a.getCount();
    	   statement = uname + " and " + count + "others follow you now.";
    	   count = count + 1;
    	   ab.setCount(count);
           ab.setStatement(statement);
           res = ab.updateActivityByStatusAndIdStr();
       }	   
       
    return res;   
    }
    
    
    public static int addUnfollowNot(int userid, int followerid) throws SQLException
    {
    	UserBean ub = new UserBean();
    	ub.setUserid(followerid);
    	UserBean u = ub.UsersById().get(0);
    	String uname = u.getUsername();
    	String status = "follow";
    	String idstr = String.valueOf(userid);
    	ActivityBean ab = new ActivityBean();
    	ab.setStatus(status);
    	ab.setIdstr(idstr);
    	ArrayList<ActivityBean> acts = ab.activityByStatusAndIdStr();
    	ActivityBean a = acts.get(0);
    	int c = a.getCount();
    	c = c - 1;
    	a.setCount(c);
    	String statement = uname + " unfollowed you, followers remained: " + c;
    	a.setStatement(statement);
    	DateDemo dd = new DateDemo();
    	String date = dd.getCurrentDate();
    	a.setDate(date);
    	int res = a.updateActivityByStatusAndIdStr();
    
    	return res;	
    }
    
    public static int addWriteEditRecipeNot(int recipeid,int userid) throws SQLException
    {
    	UserBean ub = new UserBean();
    	ub.setUserid(userid);
    	UserBean u = ub.UsersById().get(0);
    	String uname = u.getUsername();
    	RecipeMetaBean rm = new RecipeMetaBean();
    	rm.setRecipeid(recipeid);
    	RecipeMetaBean r = rm.RecipeMetaByRecipeId().get(0);
    	String rname = r.getTitle();
   
    	//recipeid will go to idStr, userid will go to extra info
    	String status = "recipe";
    	String idstr = String.valueOf(recipeid);
    	ActivityBean ab = new ActivityBean();
    	
    	ab.setStatus(status);
    	ab.setIdstr(idstr);
    	ab.setCount(0);
    	
    	ArrayList<ActivityBean> acts = ab.activityByStatusAndIdStr();
    	DateDemo dd = new DateDemo();
    	String date = dd.getCurrentDate();
    	String extrainfo = String.valueOf(userid);
    	ab.setExtrainfo(extrainfo);
    	int res = 0;
    	
    	if(acts.size() == 0)
    	{
    		String statement = uname + " written a new recipe: " + rname;
    		ab.setDate(date);
    		ab.setStatement(statement);
    		res = ab.addActivityRaw();
    	}
    	else
    	{
    		String statement = uname + " edited the recipe: " + rname;
    		ActivityBean a = acts.get(0);
    		a.setDate(date);
    		a.setStatement(statement);
    		res = a.updateActivityByStatusAndIdStr();
    	}	
    	
    return res;
    }
    
    public static int addWriteEditAlbumNot(int userid,int albumid) throws SQLException
    {
    	//for album not idstr: userid + " " + albumid
    	UserBean ub = new UserBean();
    	ub.setUserid(userid);
    	UserBean u = ub.UsersById().get(0);
    	String uname = u.getUsername();
    	AlbumBean alb = new AlbumBean();
    	alb.setUserid(userid);
    	alb.setAlbumid(albumid);
    	AlbumBean al = alb.AlbumByUserAndAlbumId().get(0);
    	String aname = al.getName();
    	DateDemo dd = new DateDemo();
    	String date = dd.getCurrentDate();
    	
    	String status = "album";
    	String idstr = String.valueOf(userid) + " " + String.valueOf(albumid);
    	ActivityBean ab = new ActivityBean();
    	
    	ab.setStatus(status);
    	ab.setIdstr(idstr);
    	int res = 0;
    	ArrayList<ActivityBean> acts = ab.activityByStatusAndIdStr();
    	if(acts.size() == 0)
    	{
    		ab.setCount(0);
    		ab.setExtrainfo(String.valueOf(0));
    		ab.setDate(date);
    		String statement = uname + " created an album, named: " + aname;
    		ab.setStatement(statement);
    		res = ab.addActivityRaw();
    	}
    	else
    	{
    		ActivityBean a = acts.get(0);
    		a.setDate(date);
    		String statement = uname + " edited an album, named: " + aname;
    		a.setStatement(statement);
    		res = a.updateActivityByStatusAndIdStr();
    	}	
    	
    return res;	
    }
    
    
   //class end 
}
