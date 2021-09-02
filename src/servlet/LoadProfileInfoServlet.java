package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import bean.CommentBean;
import bean.RatingBean;
import bean.RecipeMetaBean;
import bean.UserBean;
import util.FollowerReviewCount;
import util.SimilarUsers;
import util.Tool;

@WebServlet(urlPatterns="/loadprofileinfo")
public class LoadProfileInfoServlet extends HttpServlet 
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String uid = req.getParameter("userid");
		int userid = Integer.parseInt(uid);
		
		try 
		{
			Tool t = new Tool();
			ArrayList<UserBean> fs = t.followersOfUser(userid);
			Collections.sort(fs,UserBean.userNameOrder);
			
			RecipeMetaBean rm = new RecipeMetaBean();
			rm.setUserid(userid);
			
			ArrayList<RecipeMetaBean> recipes = rm.RecipeMetaByUserId();
			ArrayList<CommentBean> allCmts = new ArrayList<>();
			ArrayList<RatingBean> allRatings = new ArrayList<>();
			
			for(RecipeMetaBean r : recipes)
			{
				CommentBean cb = new CommentBean();
				RatingBean rb = new RatingBean();
				
				cb.setRecipeid(r.getRecipeid());
				rb.setRecipeid(r.getRecipeid());
				
				allCmts.addAll(cb.CommentsByRecipeId());
				allRatings.addAll(rb.ratingByRecipeId());
			}	
			
			
			HashMap<Integer, Integer> cmtMap = new HashMap<>();
			HashMap<Integer, Integer> ratingMap = new HashMap<>();
			
			for(CommentBean c : allCmts)
			{
				int k = c.getUserid();
				if(cmtMap.get(k) == null)
				{
					cmtMap.put(k, 1);
				}
				else
				{
					cmtMap.put(k, cmtMap.get(k) + 1);
				}	
			}	
			
			for(RatingBean c : allRatings)
			{
				int k = c.getUserid();
				if(ratingMap.get(k) == null)
				{
					ratingMap.put(k, 1);
				}
				else
				{
					ratingMap.put(k, ratingMap.get(k) + 1);
				}	
			}
			
			ArrayList<FollowerReviewCount> fr = new ArrayList<>();
			for(UserBean u : fs)
			{
				FollowerReviewCount frc = new FollowerReviewCount();
				frc.setUserid(u.getUserid());
				frc.setName(u.getUsername());
				int k = u.getUserid();
				
				if(cmtMap.get(k) == null)
				{
					frc.setCmtCount(0);
				}
				else
				{
					frc.setCmtCount(cmtMap.get(k));
				}
				
				if(ratingMap.get(k) == null)
				{
					frc.setRatingCount(0);
				}
				else
				{
					frc.setRatingCount(ratingMap.get(k));
				}
				
				fr.add(frc);
			}	
			
			Collections.sort(fr,FollowerReviewCount.activityOrder);
						
			UserBean ub = new UserBean();
			ub.setUserid(userid);
			ArrayList<UserBean> users = ub.UsersById();
			ArrayList<Object> finalOut = new ArrayList<>();
			
			finalOut.add(users.get(0));
			finalOut.add(fr); //followers list 
			
			ArrayList<SimilarUsers> sims = Tool.getSimilarUsers(userid);
			Collections.sort(sims,SimilarUsers.similarUserPercentOrder);
			finalOut.add(sims);
			
			ObjectMapper mapper = new ObjectMapper();
			String jsonString = mapper.writeValueAsString(finalOut);
			PrintWriter out = resp.getWriter();
			out.println(jsonString);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
