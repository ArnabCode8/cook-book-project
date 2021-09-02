package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import bean.ChoiceBean;
import bean.UserBean;
import util.FollowerReviewCount;
import util.Subscrip;
import util.Tool;

@WebServlet(urlPatterns = "/loadAccInfo")
public class AccInfoServlet extends HttpServlet 
{
   @Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
		//himself choices followers subscriptions
	    String uid = req.getParameter("userid");
	    int userid = Integer.parseInt(uid);
	    
	    try 
	    {
	    	UserBean ub = new UserBean();
		    ub.setUserid(userid);
			UserBean u = ub.UsersById().get(0);
			
			//userbean got
			
			ChoiceBean cb = new ChoiceBean();
			ArrayList<ChoiceBean> choices = cb.allChoices();
			
			//choices got
			
			ArrayList<FollowerReviewCount> follows = Tool.followersOfUserId(userid);
			
			//followers got
			
			ArrayList<Subscrip> subscriptions = Tool.subscriptionOfUserId(userid);
			Collections.sort(subscriptions,Subscrip.newContOrder);
			//subscriptions got
			
			ArrayList<Object> finalOut = new ArrayList<>();
			
			finalOut.add(u);
			finalOut.add(choices);
			finalOut.add(follows);
			finalOut.add(subscriptions);
			
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
