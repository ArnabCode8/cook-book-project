package util;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;


import bean.ChoiceBean;
import bean.CommentBean;
import bean.ExpBean;
import bean.FollowBean;
import bean.IngredBean;
import bean.LastLogin;
import bean.RatingBean;
import bean.RecipeMetaBean;
import bean.TypeBean;
import bean.UserBean;

public class Tool {
	
	public static int intersectionOfIntArray(ArrayList<Integer> arr1,ArrayList<Integer> arr2)
	{
		int len = arr1.size();
		int count = 0;
		for(int i=0;i<len;i++)
		{
			if(arr2.contains(arr1.get(i)))
			{
				count++;
			}	
		}
		
	return count;	
	}
	
	//this is only for user not guest
	public static ArrayList<RecipeMetaBean> feedByUserId(int userid) throws SQLException
	{
		LastLogin ll = new LastLogin();
		ll.setUserid(userid);
		LastLogin ull = ll.lastLoginByUserId().get(0);
		DateDemo d = new DateDemo();
		String today = d.getCurrentDate();
		String lastdate = ull.getLastlogindate();
		RecipeMetaBean rm = new RecipeMetaBean();
		ArrayList<RecipeMetaBean> recipes = rm.allRecipeMeta();
		ArrayList<RecipeMetaBean> filrec = recipesBtnDates(recipes, lastdate, today);
		FollowBean fb = new FollowBean();
		fb.setFollows(userid);
		ArrayList<FollowBean> fbs = fb.FollowsByFollowsId();
		
		ArrayList<Integer> followIds = new ArrayList<>(); //followed by the user
		ArrayList<Integer> choices = new ArrayList<>(); //choices of the user that he preffered to see
		
		for(FollowBean f : fbs)
		{
	        followIds.add(f.getFollowed());
		}
		
		UserBean ub = new UserBean();
		ub.setUserid(userid);
		UserBean u = ub.UsersById().get(0);
		String chTxt = u.getChoice();
		String chArr[] = chTxt.split(" ");
		for(String s : chArr)
		{
			choices.add(Integer.parseInt(s.trim()));
		}
		//users choices and followed ids are initialised
		
		ArrayList<RecipeMetaBean> finalRecipes = new ArrayList<>();
		for(RecipeMetaBean r : filrec)
		{
			
			if(followIds.size() != 0 && choices.get(0) == 1)
			{
				//follow filter applies, choice filter not

				//follow filter
				int writerid = r.getUserid();
				boolean flag1 = followIds.contains(writerid);
				
				//choice filter
				/*
				String tmpChTxt = r.getChoice();
				String tmpCh[] = tmpChTxt.split(" ");
				ArrayList<Integer> tmpChoices = new ArrayList<>();
				for(String s : tmpCh)
				{
					tmpChoices.add(Integer.parseInt(s.trim()));
				}	
				
				int x = intersectionOfIntArray(choices, tmpChoices);*/
				
				if(flag1 == true)
				{
					if(r.getUserid() != userid)
					{	
					   finalRecipes.add(r);
					}
				}
			}
			else if(followIds.size() == 0 && choices.get(0) != 1)
			{
				//follow filter is not applied, choice filter yes
				
				/*
				//follow filter
				int writerid = r.getUserid();
				boolean flag1 = followIds.contains(writerid);
				*/
				//choice filter
				
				String tmpChTxt = r.getChoice();
				String tmpCh[] = tmpChTxt.split(" ");
				ArrayList<Integer> tmpChoices = new ArrayList<>();
				for(String s : tmpCh)
				{
					tmpChoices.add(Integer.parseInt(s.trim()));
				}	
				
				int x = intersectionOfIntArray(choices, tmpChoices);
				
				if(x > 0)
				{
					if(r.getUserid() != userid)
					{	
					   finalRecipes.add(r);
					}
				}
				
			}
			else if(followIds.size() != 0 || choices.get(0) != 1)
			{
				//both is applied
				
				//follow filter
				int writerid = r.getUserid();
				boolean flag1 = followIds.contains(writerid);
				
				//choice filter
				
				String tmpChTxt = r.getChoice();
				String tmpCh[] = tmpChTxt.split(" ");
				ArrayList<Integer> tmpChoices = new ArrayList<>();
				for(String s : tmpCh)
				{
					tmpChoices.add(Integer.parseInt(s.trim()));
				}	
				
				int x = intersectionOfIntArray(choices, tmpChoices);
				
				if(flag1 == true || x > 0)
				{
					if(r.getUserid() != userid)
					{	
					   finalRecipes.add(r);
					}
				}	
				
			}
			else
			{
				//none applied
				if(r.getUserid() != userid)
				{	
				   finalRecipes.add(r);
				}
			}	
		}	
		
	return finalRecipes;	
	}
	
	
	public static ArrayList<RecipeMetaBean> releventByUserId(int userid) throws SQLException
	{
		DateDemo d = new DateDemo();
		String today = d.getCurrentDate();
		String yr = today.substring(0, 4);
		String date1 = yr + "-01-01";
		RecipeMetaBean rm = new RecipeMetaBean();
		ArrayList<RecipeMetaBean> recipes = rm.allRecipeMeta();
		ArrayList<RecipeMetaBean> filrec = recipesBtnDates(recipes, date1, today);
		FollowBean fb = new FollowBean();
		fb.setFollows(userid);
		ArrayList<FollowBean> fbs = fb.FollowsByFollowsId();
		
		ArrayList<Integer> followIds = new ArrayList<>(); //followed by the user
		ArrayList<Integer> choices = new ArrayList<>(); //choices of the user that he preffered to see
		
		for(FollowBean f : fbs)
		{
	        followIds.add(f.getFollowed());
		}
		
		UserBean ub = new UserBean();
		ub.setUserid(userid);
		UserBean u = ub.UsersById().get(0);
		String chTxt = u.getChoice();
		String chArr[] = chTxt.split(" ");
		for(String s : chArr)
		{
			choices.add(Integer.parseInt(s.trim()));
		}
		//users choices and followed ids are initialised
		
		ArrayList<RecipeMetaBean> finalRecipes = new ArrayList<>();
		for(RecipeMetaBean r : filrec)
		{
			
			if(followIds.size() != 0 && choices.get(0) == 1)
			{
				//follow filter applies, choice filter not

				//follow filter
				int writerid = r.getUserid();
				boolean flag1 = followIds.contains(writerid);
				
				//choice filter
				/*
				String tmpChTxt = r.getChoice();
				String tmpCh[] = tmpChTxt.split(" ");
				ArrayList<Integer> tmpChoices = new ArrayList<>();
				for(String s : tmpCh)
				{
					tmpChoices.add(Integer.parseInt(s.trim()));
				}	
				
				int x = intersectionOfIntArray(choices, tmpChoices);*/
				
				if(flag1 == true)
				{
					if(r.getUserid() != userid)
					{	
					   finalRecipes.add(r);
					}   
				}
			}
			else if(followIds.size() == 0 && choices.get(0) != 1)
			{
				//follow filter is not applied, choice filter yes
				
				/*
				//follow filter
				int writerid = r.getUserid();
				boolean flag1 = followIds.contains(writerid);
				*/
				//choice filter
				
				String tmpChTxt = r.getChoice();
				String tmpCh[] = tmpChTxt.split(" ");
				ArrayList<Integer> tmpChoices = new ArrayList<>();
				for(String s : tmpCh)
				{
					tmpChoices.add(Integer.parseInt(s.trim()));
				}	
				
				int x = intersectionOfIntArray(choices, tmpChoices);
				
				if(x > 0)
				{
					if(r.getUserid() != userid)
					{	
					   finalRecipes.add(r);
					}
				}
				
			}
			else if(followIds.size() != 0 && choices.get(0) != 1)
			{
				//both is applied
				
				//follow filter
				int writerid = r.getUserid();
				boolean flag1 = followIds.contains(writerid);
				
				//choice filter
				
				String tmpChTxt = r.getChoice();
				String tmpCh[] = tmpChTxt.split(" ");
				ArrayList<Integer> tmpChoices = new ArrayList<>();
				for(String s : tmpCh)
				{
					tmpChoices.add(Integer.parseInt(s.trim()));
				}	
				
				int x = intersectionOfIntArray(choices, tmpChoices);
				
				if(flag1 == true || x > 0)
				{
					if(r.getUserid() != userid)
					{	
					   finalRecipes.add(r);
					}
				}	
				
			}
			else
			{
				//none applied
				if(r.getUserid() != userid)
				{	
				   finalRecipes.add(r);
				}
			}	
		}	
		
	return finalRecipes;	
	}
	
	public static ArrayList<FollowerReviewCount> followersOfUserId(int userid) throws SQLException
	{
		Tool t = new Tool();
		ArrayList<UserBean> fs = t.followersOfUser(userid);
		
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
		
	return fr;	
	}
	
	public static ArrayList<RecipeMetaBean> recipesBtnDates(ArrayList<RecipeMetaBean> recipes,String date1,String date2)
	{
		ArrayList<RecipeMetaBean> res = new ArrayList<>();
		DateDemo d = new DateDemo();
		
		for(RecipeMetaBean r : recipes)
		{
			String tempDate = r.getDate();
			int m = d.subtractDateString(date1, tempDate);
			int n = d.subtractDateString(tempDate, date2);
			
			//System.out.println("date1 : " + date1 + " datetemp : " + tempDate + " date2 : " + date2);
			//System.out.println("diff 1 temp : " + m + " diff temp 2 : " + n);
			
			if(m >= 0 && n >= 0)
			{
				res.add(r);
			}
		}	
		
	return res;	
	}
	
	public static ArrayList<Subscrip> subscriptionOfUserId(int userid) throws SQLException
	{
		LastLogin ll = new LastLogin();
		ll.setUserid(userid);
		LastLogin lu = ll.lastLoginByUserId().get(0);
		String lastLoginDate = lu.getLastlogindate();
		DateDemo d = new DateDemo();
		String today = d.getCurrentDate();
		
		FollowBean fb = new FollowBean();
		fb.setFollows(userid);
		ArrayList<FollowBean> followeds = fb.FollowsByFollowsId();
		ArrayList<Subscrip> subs = new ArrayList<>();
		
		for(FollowBean f : followeds)
		{
			int uid = f.getFollowed();
			UserBean ub = new UserBean();
			ub.setUserid(uid);
			UserBean u = ub.UsersById().get(0); // userbean
			
			RecipeMetaBean rm = new RecipeMetaBean();
			rm.setUserid(uid);
			ArrayList<RecipeMetaBean> recipes = rm.RecipeMetaByUserId();
			ArrayList<RecipeMetaBean> rcs = recipesBtnDates(recipes, lastLoginDate, today); // new recipes since u last logged in
			
			Subscrip sc = new Subscrip();
			sc.setUserid(uid);
			sc.setName(u.getUsername());
			sc.setNewCont(rcs.size());
			
			subs.add(sc);
		}
		
	return subs;	
	}
	
	public static ArrayList<Object> getUserWrittenChoices(int userid) throws SQLException
	{
		RecipeMetaBean rm = new RecipeMetaBean();
		rm.setUserid(userid);
		ArrayList<RecipeMetaBean> recipes = rm.RecipeMetaByUserId();
		HashSet<Integer> rs = new HashSet<>();
		for(RecipeMetaBean r : recipes)
		{
			//propStrtoarr
			ArrayList<Integer> ids = propStrToArr(r.getChoice());
			
			for(Integer i : ids)
			{
				rs.add(i);
			}	
		}
		
		//rs is filled
		ArrayList<Integer> chs = new ArrayList<>();
		Iterator<Integer> itr = rs.iterator();
		while(itr.hasNext())
		{
			chs.add(itr.next());
		}
		
		ArrayList<Object> finalOut = new ArrayList<>();
		finalOut.add(recipes.size());
		finalOut.add(chs);
		
	return finalOut;	
	}

	//getSimilarUsers
	public static ArrayList<SimilarUsers> getSimilarUsers(int userid) throws SQLException
	{
		ArrayList<Integer> keyChoices = (ArrayList<Integer>) getUserWrittenChoices(userid).get(1);
		UserBean ub = new UserBean();
		ArrayList<UserBean> users = ub.allUsers();
		ArrayList<SimilarUsers> sims = new ArrayList<>();
		
		for(UserBean u : users)
		{
			int uid = u.getUserid();
			ArrayList<Object> tmp = getUserWrittenChoices(uid);
			ArrayList<Integer> listChoices = (ArrayList<Integer>) tmp.get(1);
			int count = (int) tmp.get(0);
			SimilarUsers s = new SimilarUsers();
			s.setUserid(u.getUserid());
			s.setName(u.getUsername());
			s.setCount(count);
			
			if(keyChoices.size() == 0 && listChoices.size() == 0)
			{
				s.setPer(0);
			}
			else
			{
				int k = arrayIntSimilarity(listChoices, keyChoices) + arrayIntSimilarity(keyChoices ,listChoices);
				double r = 2;
				double per = k/r;
				s.setPer((int)Math.round(per)); // has to be average of both
			}	
			
			if(s.getPer() > 0 && s.getUserid() != userid)
			{
				sims.add(s);
			}
		}	
		
		
		return sims;
	}
	
	
	public ArrayList<ChoiceBean> getChoicesFromList(ArrayList<Integer> ids) throws SQLException
	{
		ArrayList<ChoiceBean> choices = new ArrayList<>();
		ChoiceBean cb = new ChoiceBean();
		
		for(Integer i : ids)
		{
			cb.setChoiceid(i);
			ArrayList<ChoiceBean> tempChoices = cb.ChoiceById();
			choices.add(tempChoices.get(0));
		}
		
	return choices; 	
	}
	
	public ArrayList<TypeBean> getTypesFromList(ArrayList<Integer> ids) throws SQLException
	{
		ArrayList<TypeBean> types = new ArrayList<>();
		TypeBean cb = new TypeBean();
		
		for(Integer i : ids)
		{
			cb.setTypeid(i);
			types.add(cb.typeById());
		}
		
	return types; 	
	}
	
	
	//user module
	
	public int addUser(String username,String email,String choice) throws SQLException
	{
		UserBean ub = new UserBean();
		ub.setUsername(username);
		ub.setEmail(email);
		ub.setChoice(choice);
		
		int res = ub.addUser();
		
	return res;	
	}

	int updateUserByUserId(int userid,String username,String email,String choice) throws SQLException
	{
		UserBean ub = new UserBean();
		ub.setUserid(userid);
		ub.setUsername(username);
		ub.setEmail(email);
		ub.setChoice(choice);
		
		int res = ub.updateUserById();
		
	return res;	
	}
	
	public ArrayList<UserBean> userByUserId(int userid) throws SQLException
	{
		UserBean ub = new UserBean();
		ub.setUserid(userid);
		ArrayList<UserBean> users = ub.UsersById();
	
	return users;	
	}
	
	//recipe content module
	
	public void addRecipeContent(String cont)
	{
		String loc = "C:\\Users\\Arnab\\eclipse-workspace\\CookBookProject\\WebContent\\myFolder\\tempRecipe.txt";
		FileDemo1 fd = new FileDemo1();
		fd.clearTextFromFile(loc);
		fd.writeToFile(cont, loc);
		
		ExpBean eb = new ExpBean();
		
		try 
		{
			eb.addContent(loc);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void updateRecipeContentById(int txtid,String cont)
	{
		String loc = "C:\\Users\\Arnab\\eclipse-workspace\\CookBookProject\\WebContent\\myFolder\\tempRecipe.txt";
		FileDemo1 fd = new FileDemo1();
		fd.clearTextFromFile(loc);
		fd.writeToFile(cont, loc);
		
		ExpBean eb = new ExpBean();
		eb.setTxtid(txtid);
		
		try 
		{
			eb.updateContent(loc);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public String getRecipeContentById(int txtid)
	{
		String loc = "C:\\Users\\Arnab\\eclipse-workspace\\CookBookProject\\WebContent\\myFolder\\tempRecipe.txt";
		FileDemo1 fd = new FileDemo1();
		fd.clearTextFromFile(loc);
		
		ExpBean eb = new ExpBean();
		eb.setTxtid(txtid);
		String str = "";
		
		
		try 
		{
			eb.retrieveContent(loc);
			str = fd.readFromFile(loc);
			return str;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	return str;	
	}
	
	//recipe content module ends
	
	//view module
	
	public int increaseViewByRecipeId(int recipeid) throws SQLException
	{
		RecipeMetaBean rm = new RecipeMetaBean();
		rm.setRecipeid(recipeid);
		RecipeMetaBean r = rm.RecipeMetaByRecipeId().get(0);
		int v = r.getViews();
		v = v + 1;
		r.setViews(v);
		int res = r.updateViews();
	return res;	
	}
	
	//view module ends
	
	public int addComment(int recipeid,int userid,String commentText)
	{
		CommentBean cb = new CommentBean();
		cb.setRecipeid(recipeid);
		cb.setUserid(userid);
		cb.setCommentText(commentText);
		int res = 0;
		try 
		{
			ArrayList<CommentBean> cmts = cb.CommentsByUserIdRecipeId();
			int commentid = 0;
			
			for(CommentBean c : cmts)
			{
				commentid = c.getCommentid();
			}	
			
			commentid = commentid + 1;
			
			cb.setCommentid(commentid);
			
			res = cb.addCommentRaw();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	 return res;	
	}
	
	//get followers of a user, given userid
	public ArrayList<UserBean> followersOfUser(int userid) throws SQLException
	{
		FollowBean fb = new FollowBean();
		fb.setFollowed(userid);
		ArrayList<FollowBean> fs = fb.FollowsByFollowed();
		ArrayList<UserBean> users = new ArrayList<>();
		ArrayList<UserBean> tempUsers;
		
		for(FollowBean f : fs)
		{
			int uid = f.getFollows();
			UserBean ub = new UserBean();
			ub.setUserid(uid);
			tempUsers = ub.UsersById();
			users.add(tempUsers.get(0));
		}
		
		return users;
	}
	
	public static boolean isNumInString(int num,String str)
	{
		String[] sArr = str.split(" ");
		boolean flag = false;
		for(String s : sArr)
		{
			int k = Integer.parseInt(s.trim());
			if(k == num)
			{
			   flag = true;
			   break;
			}	
		}
	return flag;	
	}
	
	
	public static ArrayList<RecipeMetaBean> choiceFilter(ArrayList<RecipeMetaBean> motherRecipes,int choice)
	{
		ArrayList<RecipeMetaBean> res = new ArrayList<>();
		for(RecipeMetaBean r : motherRecipes)
		{
		   String str = r.getChoice();
		   if(isNumInString(choice, str) == true)
		   {
			   res.add(r);
		   }	   
		}
		
	    return res;	
	}
	
	public static ArrayList<RecipeMetaBean> typeFilter(ArrayList<RecipeMetaBean> motherRecipes,int type)
	{
		ArrayList<RecipeMetaBean> res = new ArrayList<>();
		for(RecipeMetaBean r : motherRecipes)
		{
		   String str = r.getType();
		   if(isNumInString(type, str) == true)
		   {
			   res.add(r);
		   }	   
		}
		
	    return res;	
	}
	
	public static ArrayList<RecipeMetaBean> descripFilter(ArrayList<RecipeMetaBean> motherRecipes, String desc)
	{
	   String d = desc.trim();
	   ArrayList<RecipeMetaBean> res = new ArrayList<>();
	   for(RecipeMetaBean r : motherRecipes)
	   {
		   String rDesc = r.getDescrip().trim();
		   if(rDesc.equals(d))
		   {
			  res.add(r);
		   }	   
	   }	  
	return res;   
	}
	
	
	//similarity estimate portion
	//its better for the runtime if we get the mp at once 
	//and use it to several functions
	//otherwise cost of retrieving will be a problem
	
	public static int averageArr(ArrayList<Integer> arr)
	{
		double count = 0;
		int sum = 0;
		for(Integer r : arr)
		{
			sum = sum + r;
			count++;
		}
		
		double per =  (sum/count);
		return (int)Math.round(per);
	}
	
	public static int absoluteSimilarity(String keyIngred,String listIngred,HashMap<Integer, Integer> mp)
	{
		ArrayList<Integer> kin = ingredStringToArr(keyIngred);
		ArrayList<Integer> lin = ingredStringToArr(listIngred);
		int mk = maxWeight(mp, kin);
		int ml = maxWeight(mp, lin);
		
		if(mk != ml)
		{
			return 0;
		}
		else
		{
			int i;
			//ArrayList<Integer> sims = new ArrayList<>();
			double count = 0;
			int sum = 0;
			for(i=mk;2<=i;i--)
			{
				int k = similarityIngredsForWeight(kin, lin, mp, i);
				if(i == mk && k < 98) // 98 considered not 100 coz of rounding error possibility
				{
					return 0;
				}	

				sum = sum + k*i*i; // i is the weight at that stage
				count = count + i*i;
				
			}	
			
			double per =  (sum/count);
			return (int)Math.round(per);
		}
		
	}
	
	
	public static int generalSimilarity(String keyIngred,String listIngred,HashMap<Integer, Integer> mp)
	{
		ArrayList<Integer> kin = ingredStringToArr(keyIngred);
		ArrayList<Integer> lin = ingredStringToArr(listIngred);
		int mk = maxWeight(mp, kin);
		int ml = maxWeight(mp, lin);
		
		if(mk != ml)
		{
			System.out.println("top weight " + mk + "unavailable");
			return 0;
		}
		else
		{
			int i;
			//ArrayList<Integer> sims = new ArrayList<>();
			double count = 0;
			int sum = 0;
			for(i=mk;2<=i;i--)
			{
				int k = similarityIngredsForWeight(kin, lin, mp, i);
				
				/*if(i == mk && k < 98) // 98 considered not 100 coz of rounding error possibility
				{
				    //top weight full match is just omitted here
					return 0;
				}*/	
	
				if(ingredsByWeight(mp, lin, i).size() != 0 && ingredsByWeight(mp, kin, i).size() != 0)
				{
					sum = sum + k*i*i*i*i; // i is the weight at that stage
					count = count + i*i*i*i;
					System.out.println("sum +" + k*i*i*i*i);
					System.out.println("weight + " + i*i*i*i);
				}	
				
				
			}	
			
			System.out.println("weighted sum : " + sum);
			System.out.println("weight to be divided by : " + count);	
			
			if(count == 0)
			{
				return 0;
			}	
			
			
			double per =  (sum/count);
			return (int)Math.round(per);
		}
		
	}
	
	public static int generalSimilaritySubst(String keyIngred,String listIngred,HashMap<Integer, Integer> mp)
	{
		ArrayList<Integer> kin = ingredStringToArr(keyIngred);
		ArrayList<Integer> lin = ingredStringToArr(listIngred);
		int mk = maxWeight(mp, kin);
		int ml = maxWeight(mp, lin);
		
		if(mk != ml)
		{
			System.out.println("top weight " + mk + "unavailable");
			return 0;
		}
		else
		{
			int i;
			//ArrayList<Integer> sims = new ArrayList<>();
			double count = 0;
			int sum = 0;
			for(i=mk;2<=i;i--)
			{
				int k = similarityIngredsForWeight(kin, lin, mp, i);
				
				/*if(i == mk && k < 98) // 98 considered not 100 coz of rounding error possibility
				{
				    //top weight full match is just omitted here
					return 0;
				}*/	
	
				if(ingredsByWeight(mp, lin, i).size() != 0 || ingredsByWeight(mp, kin, i).size() != 0)
				{
					sum = sum + k*i*i*i; // i is the weight at that stage
					count = count + i*i*i;
					System.out.println("sum +" + k*i*i*i);
					System.out.println("weight + " + i*i*i);
				}	
				
				
			}	
			
			System.out.println("weighted sum : " + sum);
			System.out.println("weight to be divided by : " + count);	
			
			if(count == 0)
			{
				return 0;
			}	
			
			
			double per =  (sum/count);
			return (int)Math.round(per);
		}
		
	}
	
	public static ArrayList<Integer> ingredStringToArr(String ingreds)
	{
		String str = ingreds.trim();
		String arr[] = str.split(" ");
		ArrayList<Integer> brr = new ArrayList<>();
		for(String s : arr)
		{
			brr.add(Integer.parseInt(s.trim()));
		}	
	return brr;	
	}
	
	public static ArrayList<Integer> propStrToArr(String str1)
	{
		String str = str1.trim();
		String arr[] = str.split(" ");
		ArrayList<Integer> brr = new ArrayList<>();
		for(String s : arr)
		{
			brr.add(Integer.parseInt(s.trim()));
		}	
	return brr;	
	}
	
	public static int maxWeight(HashMap<Integer, Integer> mp, ArrayList<Integer> ingreds)
	{
		int max = 0;
		for(Integer i : ingreds)
		{
			int k = mp.get(i);
			if(max < k)
			{
				max = k;
			}	
		}
	return max;	
	}
	
	public static ArrayList<Integer> ingredsByWeight(HashMap<Integer, Integer> mp,ArrayList<Integer> arr,int wt)
	{
		ArrayList<Integer> res = new ArrayList<>();
		for(Integer i : arr)
		{
			if(mp.get(i) == wt)
			{
				res.add(i);
			}	
		}	
		
	return res;	
	}
	
	public static int arrayIntSimilarity(ArrayList<Integer> arrMother,ArrayList<Integer> arrChild)
	{
		double len = arrChild.size();
		double len1 = arrMother.size();
		
		if(len == 0 && len1 == 0)
		{
			return 100;
		}
		
		if(len == 0 && len1 != 0)
		{
			return 0;
		}
		
		if(len !=0 && len1 == 0)
		{
			return 0;
		}	
		
		int sim = 0;
		
		for(Integer i : arrChild)
		{
			for(Integer j : arrMother)
			{
				if(i == j)
				{
					//System.out.println("Matched : " + i);
					sim++;
				}	
			}	
		}	
		
		
		double per =  (sim/len)*100;
		return (int)Math.round(per);
	}
	
	public static int similarityIngredsForWeight(ArrayList<Integer> arr,ArrayList<Integer> brr,HashMap<Integer, Integer> mp,int wt)
	{
		ArrayList<Integer> arr1 = ingredsByWeight(mp, arr, wt);
		ArrayList<Integer> brr1 = ingredsByWeight(mp, brr, wt);
		
		int per1 = arrayIntSimilarity(arr1, brr1);
		int per2 = arrayIntSimilarity(brr1, arr1);
		double d = 2;
		
		double per = (per1 + per2)/d;
		System.out.println("Match for weight " + wt + " : " + (int)Math.round(per));
	return (int)Math.round(per);	
	}
	
	//have to output the percentages along with it
	public static ArrayList<SimilarRecipes> getGeneralSimilarRecipesOverThreshold(int recipeid,int threshold)
	{
		IngredBean ib = new IngredBean();
		ArrayList<SimilarRecipes> sims = new ArrayList<>();
		
		
		try 
		{
			HashMap<Integer, Integer> mp = ib.ingredWeightMap();
			RecipeMetaBean rm = new RecipeMetaBean();
			rm.setRecipeid(recipeid);
			RecipeMetaBean keyRecipe = rm.RecipeMetaByRecipeId().get(0);
			ArrayList<RecipeMetaBean> listRecipes = rm.allRecipeMeta();
			String keyIngred = keyRecipe.getIngred();
			String listIngred = "";
			int percent = 0;
			
			//similarrecipes : recipeid name per rating views writername
			
			for(RecipeMetaBean r : listRecipes)
			{
				listIngred = r.getIngred();
				percent = generalSimilaritySubst(keyIngred, listIngred, mp);
				System.out.println("--------------------------------------------");
				
				if(percent >= threshold)
				{
					int userid = r.getUserid();
					UserBean ub = new UserBean();
					ub.setUserid(userid);
					UserBean u = ub.UsersById().get(0);
					
					SimilarRecipes s = new SimilarRecipes();
					
					s.setRecipeid(r.getRecipeid());
					s.setName(r.getTitle());
					s.setPer(percent);
					s.setRating(r.getRating());
					s.setViews(r.getViews());
					s.setWritername(u.getUsername());
					
					sims.add(s);
					
					
				}	
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return sims;	
	}
	
	public static ArrayList<Object> getGeneralSimilarRecipesOverThresholdByIngred(String ingredStr,int threshold,ArrayList<RecipeMetaBean> motherRecipes)
	{
		IngredBean ib = new IngredBean();
		ArrayList<SimilarRecipes> sims = new ArrayList<>();
		ArrayList<RecipeMetaBean> finalRes = new ArrayList<>();
		ArrayList<Object> finalOut = new ArrayList<>();
		try 
		{
			HashMap<Integer, Integer> mp = ib.ingredWeightMap();
			RecipeMetaBean rm = new RecipeMetaBean();
			//rm.setRecipeid(recipeid);
			//RecipeMetaBean keyRecipe = rm.RecipeMetaByRecipeId().get(0);
			ArrayList<RecipeMetaBean> listRecipes = motherRecipes;
			String keyIngred = ingredStr;
			String listIngred = "";
			int percent = 0;
			
			//similarrecipes : recipeid name per rating views writername
			
			for(RecipeMetaBean r : listRecipes)
			{
				listIngred = r.getIngred();
				percent = generalSimilarity(keyIngred, listIngred, mp);
				System.out.println("--------------------------------------------");
				
				if(percent >= threshold)
				{
					int userid = r.getUserid();
					UserBean ub = new UserBean();
					ub.setUserid(userid);
					UserBean u = ub.UsersById().get(0);
					
					SimilarRecipes s = new SimilarRecipes();
					
					s.setRecipeid(r.getRecipeid());
					s.setName(r.getTitle());
					s.setPer(percent);
					s.setRating(r.getRating());
					s.setViews(r.getViews());
					s.setWritername(u.getUsername());
					
					sims.add(s);
					
					
				}	
				
			}
			
			finalOut.add(sims);
			
			Collections.sort(sims,SimilarRecipes.recipeSimilarityOrder);
			
			for(SimilarRecipes s : sims)
			{
				int rid = s.getRecipeid();
				RecipeMetaBean rd = new RecipeMetaBean();
				rd.setRecipeid(rid);
				RecipeMetaBean rc = rd.RecipeMetaByRecipeId().get(0);
				finalRes.add(rc);
			}
			
			finalOut.add(finalRes);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return finalOut;	
	}
	
	public static void main(String[] args) 
	{
        //generalSimilarity(String keyIngred,String listIngred,HashMap<Integer, Integer> mp)		
		//HashMap<Integer, Integer> mp = ib.ingredWeightMap();
		
		try 
		{
			IngredBean ib = new IngredBean();
			HashMap<Integer, Integer> mp = ib.ingredWeightMap();
			String keyIngred = "1 4";
			int rid = 6;
			RecipeMetaBean rm = new RecipeMetaBean();
			rm.setRecipeid(rid);
			RecipeMetaBean r = rm.RecipeMetaByRecipeId().get(0);
			System.out.println("Recipe Name : " + r.getTitle());
			String listIngred = r.getIngred();
			int sim = generalSimilarity(keyIngred, listIngred, mp);
			System.out.println("Similarity : " + sim);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
			
	}
//end of the class	
}
