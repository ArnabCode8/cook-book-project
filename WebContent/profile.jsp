<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile Page</title>

<style>

#userInfoContainer
{
   width: 350px;
   height: 200px;
   background-color: #EB984E;
   border-style: ridge;
   border-radius: 5px;
   position: absolute;
   left: 10px;
   top: 10px;
}

#followBtn
{
	position: absolute;
	height: 50px;
	width: 356px;
	border-radius: 10px;
	border-style: ridge;
	left: 10px;
	top: 220px;
	padding: 10px 10px;
	font-size: 20px;
	background-color: #CB4335;
	color: white;
	font-family: "Times New Roman";
	transition: 0.2s;
}

#followBtn:hover
{
	background-color: #CACFD2;
	color: #34495E;
	cursor: pointer;
	font-size: 25px;
	font-weight: bold;
}

#followersListContainer
{
	position: absolute;
	left: 10px;
	top: 275px;
	width: 350px;
	height: 600px;
    background-color: #73C6B6;
    border-style: ridge;
    border-radius: 5px;
}

#recipesContainer
{
	position: absolute;
	left: 370px;
	top: 200px;
	height: 674px;
	width: 1100px;
	background-color: #F5B7B1;
	border-style: ridge;
	border-radius: 5px;
	overflow: auto;
	padding-top: 10px;
	padding-bottom: 10px;
}

#NoRecipe
{
	width: 1060px;
	height: 300px;
	font-size: 100px;
	font-family: "Times New Roman";
	background-color: #80B2DE;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    text-align: center;
    padding: 10px 10px;
    margin-left: 10px;
    border-radius: 10px;
    padding-top: 100px;
}


#nameSort,#dateSort,#viewsSort,#ratingSort,#dietSort,#albumBtn
{
   margin-top: 16px;
   margin-left: 6px;
   width: 176px;
   height: 60px;
   border-radius: 10px;
   font-size: 20px;
   font-family: "Times New Roman"; 
   text-align: center;
   transition: 0.2s;
}

#nameSort:hover,#dateSort:hover,#viewsSort:hover,#ratingSort:hover,#dietSort:hover,#albumBtn:hover
{
   text-decoration: underline;
   font-size: 22px;
   cursor: pointer;
}

#choiceBtn,#typeBtn,#descripBtn
{
   margin-left: 10px;
   margin-top: 12px;
   width: 250px;
   height: 50px;
   background-color: #B7D9C4;
   border-radius: 20px;
   font-size: 20px;
   font-family: "Times New Roman";
   transition: 0.2s;
}

#choiceBtn:hover,#typeBtn:hover,#descripBtn:hover
{
	background-color: #94B2A0;
}

#choiceBtn
{
	margin-left: 70px;
}

#showSubmit
{
   margin-left: 10px;
   margin-top: 12px;
   width: 150px;
   height: 50px;
   background-color: #EC7063;
   color: white;
   border-radius: 20px;
   font-size: 20px;
   font-family: "Times New Roman";
   transition: 0.2s;
}

#showSubmit:hover
{
   background-color: #E74C3C;
}



.chCon,.tyCon,.descCon
{
   word-wrap: break-word;
   padding-top: 15px;
   padding-bottom: 15px;
   padding-left: 20px;
   width: 221px;
   border-style: solid;
   border-width: 1px;
   font-size: 15px;
   border-color: #D7DBDD;
   transition: 0.3s;
}

.chCon:hover,.tyCon:hover,.descCon:hover
{
   background-color: #F8C471;
   font-weight: bold;
   font-size: 20px;
}

#choiceHide,#typeHide,#descripHide
{
    font-family: "Times New Roman";
    font-weight: bold;
	height: 30px;
	width: 55px;
	background-color: #AED6F1;
	color: black;
	border-style: none;
	text-align: center;
	border-radius: 0px 10px 10px 0px;
	transition: 0.2s;
	box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}

#choiceHide:hover,#typeHide:hover,#descripHide:hover
{
	width: 100px;
}


#choiceListContainer,#typeListContainer,#descripListContainer
{
    position: absolute;
	width: 245px;
	height: 450px;
	margin-left: 10px;
	margin-top: 70px;
	background-color: #F9E79F;
	box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	border-radius: 5px;
	display: none;
}

#choiceListContainer
{
    left: 435px;
}

#typeListContainer
{
	left: 695px;
}

#descripListContainer
{
   left: 955px;
   height: 250px;
}

#choiceList,#typeList
{
   height: 400px;
   overflow: auto;
}

#descripList
{
	height: 200px;
	overflow: auto;
}

#NoSort
{
   height: 60px;
   width: 1060px;
   font-size: 35px;
   font-family: "Times New Roman";
   background-color: #B9DE80;
   text-align: center;
   padding: 10px 10px;
   margin-left: 10px;
   border-radius: 10px;
   margin-top: 5px;
}

#NoSelect
{
   height: 50px;
   width: 1060px;
   font-size: 35px;
   font-family: "Times New Roman";
   background-color: #AEB6BF;
   box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
   text-align: center;
   padding: 10px 10px;
   margin-left: 10px;
   border-radius: 10px;
   margin-top: 5px;
}

#recipesSortGroup
{
   position: absolute;
   left: 370px;
   top: 100px;
   height: 90px;
   width: 1100px;
   background-color: #58B463;
   border-style: ridge;
   border-radius: 5px;
   
}

#recipesShowGroup
{
   position: absolute;
   left: 370px;
   top: 10px;
   height: 80px;
   width: 1100px;
   background-color: #E8F6F3;
   border-style: ridge;
   border-radius: 5px;
   
}

#similarUsers
{
   position: absolute;
   left: 1480px;
   top: 10px;
   height: 866px;
   width: 400px;
   background-color: #AEB6BF;
   border-style: ridge;
   border-radius: 5px;

}

#NoSimilarUser
{
   height: 400px;
   width: 370px;
   margin-top: 15px;
   margin-left: 15px;
   background-color: #45B39D;
   border-radius: 10px;
   padding-top: 40px;
   text-align: center;
   font-size: 40px;
   box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}

#similarUserTitle
{
   position: sticky;
   height: 40px;
   width: 370px;
   top: 0;
   margin-top: 10px;
   margin-left: 15px;
   background-color: #E3F0D680;
   font-weight: bold;
   font-family: "Times New Roman";
   border-radius: 20px;
   border-style: none;
   padding-top: 13px;
   text-align: center;
   font-size: 20px;
}

#simUsersList
{
	overflow: auto;
}

.simUser
{
   margin-left: 15px;
   margin-top: 10px;
   width: 355px;
   background-color: #DECB6C;
   box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
   border-radius: 10px;
   font-size: 25px;
   text-align: left;
   padding-bottom: 5px;
   padding-left: 15px;
   transition: 0.2s;
}

.simUser:hover
{
   background-color: #F5E182;
   cursor: pointer;
}

.wCount
{
  font-size: 15px;
  margin-top: 10px;
  font-weight: bold;
}

.userSimilarity
{
   padding-top: 10px;
   padding-left: 10px;
   padding-right: 10px;
   border-style: none;
   margin-left: 200px;
   margin-top: -50px;
   width: 90px;
   height: 60px;
   border-radius: 40px;
   text-align: center;
   font-size: 45px;
   background-color: #85C1E9;
   box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}


.follower
{
   width: 300px;
   margin-left: 15px;
   background-color: #CDDEF2;
   font-family: "Times New Roman";
   font-size: 20px;
   text-align: center;
   border-radius: 10px;
   padding: 10px 10px;
   transition: 0.2s;
}

.follower:hover
{
	background-color: #84BAF6;
	font-size: 30px;
	font-style: bold;
	color: black;
	box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}

#followersTitle
{
	font-weight: bold;
	font-family: "Times New Roman";
	text-align: center;
	font-size: 20px;
}

#keyUserName
{
	font-family: "Times New Roman";
	font-size: 50px;
	font-weight: bold;
	padding: 10px 10px;
	background-color: #F6E184;
	width: 315px;
	margin-left: 8px;
	margin-top: 10px;
	border-radius: 10px;
	box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}

#keyUserEmail
{
	font-family: "Times New Roman";
	font-size: 20px;
	font-weight: bold;
	padding: 10px 10px;
	margin-left: 10px;
	background-color: #45B39D;
	box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	margin-top: 15px;
	width: 315px;
	border-radius: 10px;
}

#NoFollower
{
   width: 300px;
   margin-left: 15px;
   margin-top: 15px;
   background-color: #84BAF6;
   font-family: "Times New Roman";
   font-size: 20px;
   text-align: center;
   border-radius: 10px;
   padding: 10px 10px;
   color: black;
   box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
   

}

#recipeListTitle,#recipeProgress
{
	position: sticky;
	top: 0;
	margin-left: 420px;
	background-color: #ffffff00;
	border-radius: 20px;
	text-align: center;
	width: 250px;
	height: 30px;
	padding-top: 15px;
	box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	font-weight: bold;
}

#recipeProgress
{
   background-color: #A8DC75;
   margin-top: -35px;
   width: 0px;
}


#recipeTop,#recipeBottom
{
   margin-left: 510px;
   height: 25px;
   width: 80px;
   text-align: center;
   background-color: #A994B200;
   border-radius: 15px;
   transition: 0.2s;
}

#recipeTop:hover,#recipeBottom:hover
{
	font-weight: bold;
}



.frontPart,.outAlbum
{
   width: 1000px;
   background-color: #B0BBE9;
   box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
   border-radius: 10px;
   margin-left: 10px;
   font-size: 25px;
   font-family: "Times New Roman";
   height: 100px;
   padding-top: 10px;
}


.frontPart,.backPart
{
   margin-left: 40px;
}

.outAlbum
{
	background-color: #B7EEB0;
}

.recipeName,.albumTitle
{
	margin-left: 5px;
	margin-right: 5px;
	padding-bottom: 10px;
	padding-top: 10px;
	padding-left: 20px;
	background-color: #8FA2E8;
	border-radius: 10px;
	transition: 0.2s;
}

.albumTitle
{
   background-color: #99C394;
}

.recipeName:hover,.albumTitle:hover
{
	font-size: 30px;
	font-weight: bold;
	text-decoration: underline;
	cursor: pointer;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}

.recipeRating
{
    margin-top: -70px;
    margin-left: 510px; 
    height: 50px;
    width: 50px;
    text-align: center;
	display: block;
	font-size: 40px;
	background-color: #52B527;
	color: black;
	border-radius: 15px;
	
	padding: 15px 15px;
    transition: 0.2s;
	box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}

.recipeRating:hover
{
	font-size: 55px;
}

.recipeDate,.recipeViews,.contentCount
{
    margin-top: 10px;
    padding-left: 20px;
    padding-top: 10px;
    margin-left: 5px;
    padding-bottom: 10px;
	display: inline;
	font-size: 15px;
	color: #566573;
	font-weight: bold;
	text-align: center; 
}

.f
{
    margin-top: 5px;
	font-size: 15px;
	color: #566573;
	font-weight: bold;
	text-align: center; 

}

.recipeDetails,.recipeLike,.openAlbum,.albumLike
{
    margin-top: 10px;
    padding-left: 20px;
    padding-top: 10px;
    margin-left: 5px;
    padding-bottom: 10px;
	display: inline;
	font-size: 15px;
	color: blue;
	font-weight: bold;
	transition: 0.2s;

}

.recipeDetails:hover,.recipeLike:hover,.openAlbum:hover,.albumLike:hover
{
  text-decoration: underline;
  cursor: pointer;
  font-size: 20px;
  color: #89112E;
}

.backPart
{
   margin-left: 40px;
   margin-top: 10px;
   width: 1000px;
   background-color: #F1F7BE;
   box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
   border-radius: 10px;
   font-size: 18px;
   font-family: "Times New Roman";
   transition: 0.3s;
   padding-bottom: 10px;
   padding-top: 10px;
}

/*review and rating count module*/


.out
{
   background-color: #D5D8DC;
   width: 200px;
   margin-top: 5px;
   border-radius: 10px 5px 5px 10px;
   height: 10px;
}

.out1,.out2,.out3,.out4,.out5
{
    height: 8px;
	background-color: #45B39D;
	border-radius: 10px 10px 10px 10px;
}

.out1,.out2,.out3
{
  background-color: #219139;
}

.out4
{
  background-color: #EAD32A;
}

.out5
{
  background-color: #EA6A2A;
}

.txt1,.txt2,.txt3,.txt4,.txt5
{
  display: block;
  margin-left: 210px;
  margin-top: -15px;
}

.review
{
   border-radius: 10px;
   width: 120px;
   margin-left: 550px;
   margin-top: 5px;
   box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}

.bar
{
   margin-top: -210px;
   margin-left: 550px;
}
.cmtCount
{
   text-align: center;
   font-size: 40px;
   font-family: "Times New Roman";
   font-weight: bold;
   width: 120px;
   background-color: #AEB6BF;
   border-radius: 10px 10px 0px 0px;
}

.line2
{
  border-radius: 0px 0px 10px 10px;
  text-align: center;
  background-color: #D5D8DC;
  height: 40px;
  width: 120px;
  font-size: 20px;
  font-family: "Times New Roman";
}

.t
{
  font-weight: bold;
}

/*backPart rows style*/

.recipeNameFull,.recipeDiet,.recipeChoice,.recipeType,.recipeDescrip
{
	width: 450px;
	background-color: #F2CF4E;
	word-wrap: break-word;
	margin-top: 5px;
	margin-left: 5px;
	padding: 10px 10px;
	border-radius: 10px;
	font-size: 15px;
	transition: 0.2s;
}

.recipeNameFull:hover,.recipeDiet:hover,.recipeChoice:hover,.recipeType:hover,.recipeDescrip:hover
{
	font-size: 20px;
	font-weight: bold;
}

</style>

</head>
<body onload = "loadAll()">

<div id = "userInfoContainer">user info will be loaded here</div>
<div id = "recipesShowGroup">Category buttons will be printed here</div>
<div id = "recipesContainer">All recipes will be printer here</div>
<div id = "recipesSortGroup">Sorting btns will be printed here</div>
<button id = "followBtn">Follow</button>
<div id = "followersListContainer">users that followes this user will be shown here</div>
<div id = "similarUsers">Similar Users</div>

<div id = 'choiceListContainer'>Choice List</div>
<div id = 'typeListContainer'>Type List</div>
<div id = 'descripListContainer'>Descrip List</div>

<script>

  var userid =<%= request.getParameter("userid") %>;
  var keyUser = "";
  var followers = "";
  
  function loadAll()
  {
	  //userinfo, follow
	  loadProfileInfo();
	  
	  //recipes, Albums, choice Panels
	  loadUserRecipes();
	  //loadUserAlBum();
  }
  
  
  //recipes model
  
  var allRecipes = "";
  var allChoices = ""; // corresponding choices of all recipes
  var allTypes = ""; // corresponding types of all recipes
  var allReviews = "";
  
  function getUnitReview(rid)
  {
	  var k = parseInt(rid);
	  var len = allReviews.length;
	  var i;
	  
	  for(i=0;i<len;i++)
	  {
		  if(allReviews[i].recipeid == k)
		  {
			  return allReviews[i];
		  }	  
	  }	  
  }
  
  var sortFlag = "name";
  
  var today = "";
  var yesterday = "";
  var nameSortedRecipes = "";
  var dateSortedRecipes = "";
  var viewsSortedRecipes = "";
  var ratingSortedRecipes = "";
  var dietSortedRecipes = "";
  var allAlbums = "";
  
  function loadUserRecipes()
  {
	  var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function(){
		
		  if(this.readyState == 4 && this.status == 200)
		  {
			  var result = this.responseText;
			  var jsonObj = JSON.parse(result);
			  
			  //window.alert("Size of jsonObj : " + jsonObj.length);
			  
			  nameSortedRecipes = jsonObj[0];
			  dateSortedRecipes = jsonObj[1];
			  viewsSortedRecipes = jsonObj[2];
			  ratingSortedRecipes = jsonObj[3];
			  dietSortedRecipes = jsonObj[4];
			  
			  allChoices = jsonObj[5];
			  allTypes = jsonObj[6];
			  allReviews = jsonObj[7];
			  
			  today = jsonObj[8];
			  yesterday = jsonObj[9];
			  allAlbums = jsonObj[10];
			 
			  //1st figure out the hashset, then think how to decorate the panel
			  loadRecipePanel(); 
		  }	  
	  };
	  
	  var actionStr = "loadUserRecipes?userid=" + userid;
	  xhttp.open("GET",actionStr,true);
	  xhttp.send();
  }
 
  
  //rating one color #E81818
  //rating two color #E88318
  //rating three color #E2E818
  //rating four color #A4D116
  //rating five color #52B527
  //recipeList
  //recipeRating
  
  function ratingColorDistribute()
  {
	  var x = document.getElementById("recipeList").getElementsByClassName("recipeRating");
	  var len = x.length;
	  var i;
	  
	  for(i=0;i<len;i++)
	  {
		 var txt = x[i].innerText;
		 var d = parseFloat(txt);
		 var clr = "";
		 
		 if(0 <= d && d<1)
	     {
			 clr = "#E81818";
	     }
		 else if(1 <= d && d<2)
	     {
			 clr = "#E88318";
	     }
		 else if(2 <= d && d<3)
	     {
			 clr = "#E2E818";
	     }
		 else if(3 <= d && d<4)
	     {
			 clr = "#A4D116";
	     }
		 else if(4 <= d && d<5)
	     {
			 clr = "#52B527";
	     }
		 else if(d == 5)
		 {
			 clr = "#21840F";
		 }	 
		 
		 
		 x[i].style.backgroundColor = clr;
	  }	  
	  
  }
  
  
  
  function dateFormatChange(txt)
  {
	  if(txt.trim() == today)
	  {
		  var str = "Today";
		  return str;
	  }
	   
	  if(txt.trim() == yesterday)
	  {
		  var str = "Yesterday";
		  return str;
	  }
	  
	  
	  var d = txt.trim();
	  var res = d.split("-");
	  var day = parseInt(res[2]);
	  var month = parseInt(res[1]);
	  var year = res[0].trim();
	  
	  var str = "";
	  
	  if(month == 1)
	  {
		str = "Jan";  
	  }
	  else if(month == 2)
	  {
		  str = "Feb";
	  }	  
	  else if(month == 3)
	  {
		  str = "Mar";
	  }	
	  else if(month == 4)
	  {
		  str = "Apr";
	  }	
	  else if(month == 5)
	  {
		  str = "May";
	  }	
	  else if(month == 6)
	  {
		  str = "June";
	  }	
	  else if(month == 7)
	  {
		  str = "July";
	  }	
	  else if(month == 8)
	  {
		  str = "Aug";
	  }	
	  else if(month == 9)
	  {
		  str = "Sept";
	  }	
	  else if(month == 10)
	  {
		  str = "Oct";
	  }	
	  else if(month == 11)
	  {
		  str = "Nov";
	  }	
	  else if(month == 12)
	  {
		  str = "Dec";
	  }	
	  
	  var fStr = day + "th " + str + "," + year;
	  return fStr;
  }
  
  function callNoRecipeContent()
  {
	  var cont1 = "<div id = 'NoRecipe'>No Recipes</div>";
	  var cont2 = "<div id = 'NoSelect'>Nothing To Select</div>";
	  var cont3 = "<div id = 'NoSort'>Nothing To Sort</div>";
	  var cont4 = "<div id = 'NoSimilarUser'>No Similar Writers</div>";
	  
	  //similarUsers
	  document.getElementById("recipesContainer").innerHTML = cont1;
	  document.getElementById("recipesShowGroup").innerHTML = cont2;
	  document.getElementById("recipesSortGroup").innerHTML = cont3;
	  document.getElementById("similarUsers").innerHTML = cont4;
  }
  
     function unClickAll()
	 {
		 document.getElementById("nameSort").style.backgroundColor = "#96CECA";
		 document.getElementById("dateSort").style.backgroundColor = "#96CECA";
		 document.getElementById("viewsSort").style.backgroundColor = "#96CECA";
		 document.getElementById("ratingSort").style.backgroundColor = "#96CECA";
		 document.getElementById("dietSort").style.backgroundColor = "#96CECA";
		 document.getElementById("albumBtn").style.backgroundColor = "#96CECA";
	 }
  
     
  function checkScrollProgress()
  {
	  var d = document.getElementById("recipesContainer").scrollTop;
	  var h = document.getElementById("recipesContainer").scrollHeight;
	  
	  var c = (d*1000)/h;
	  var k = Math.round(c);
	  
	  if(k>250)
	  {
		  k = 250;
	  }	  
	  
	  document.getElementById("recipeProgress").style.width = k + "px";
  }
     
     
  function loadRecipePanel()
  {
	  if(nameSortedRecipes.length == 0)
	  {
		  callNoRecipeContent();
	  }
	  else
	  {
		  window.alert("load Recipe Panel Called");
		  var cont = "<div id = 'recipeProgress'></div>";
		  cont = cont + "<div id = 'recipeListTitle'>";
		  if(sortFlag == "album")
		  {
			 cont = cont + "ALBUMS : " + allAlbums.length + "</div></div>"; //album count should be added
		  }
		  else
		  {
			 cont = cont + "Recipes Sorted By : " + sortFlag.toUpperCase() + "</div>";
		  }	  
		  
		  var len = nameSortedRecipes.length;
		  
		  if(len > 3)
		  {
			  cont = cont + "<br/><button id = 'recipeBottom'>Bottom</button>";
		  }	  
		  
		  
		  var i;
		  cont = cont + "<div id = 'recipeList'>";
		  
		  for(i=0;i<len;i++)
		  {
			  
			  if(sortFlag == "name")
			  {
				  cont = cont + generateUnitRecipePanel(nameSortedRecipes[i]);
			  }
			  else if(sortFlag == "date")
			  {
				  cont = cont + generateUnitRecipePanel(dateSortedRecipes[i]);
			  }
			  else if(sortFlag == "views")
			  {
				  cont = cont + generateUnitRecipePanel(viewsSortedRecipes[i]);
			  }
			  else if(sortFlag == "rating")
			  {
				  cont = cont + generateUnitRecipePanel(ratingSortedRecipes[i]);
			  }
			  else if(sortFlag == "diet")
			  {
				  cont = cont + generateUnitRecipePanel(dietSortedRecipes[i]);
			  }
			 
		  }
		  
		  cont = cont + "</div>";
		  
		  if(len > 3)
		  {
			  cont = cont + "<br/><button id = 'recipeTop'>Top</button>";
		  }	
		  
		  //recipes are loaded here
		  document.getElementById("recipesContainer").innerHTML = cont;
		  document.getElementById("recipesContainer").scrollTop = 0;
		  
		  
		  document.getElementById("recipesContainer").addEventListener("scroll",function(event){
			  
			  var d = document.getElementById("recipesContainer").scrollTop;
			  var h = document.getElementById("recipesContainer").scrollHeight;
			  
			  var c = (d*1000)/h;
			  var k = Math.round(c);
			  
			  if(k>250)
			  {
				  k = 250;
			  }	  
			  
			  document.getElementById("recipeProgress").style.width = k + "px";
			  
		  });
		  
		  
		  
		  // all block display if required
		  
		  if(len>3)
		  {	  
		  
		  document.getElementById("recipeTop").addEventListener("click",function(){
			  var elt = document.getElementById("recipesContainer");
			  elt.scrollTop = 0;
			  checkScrollProgress();
		  });
		  
		  document.getElementById("recipeBottom").addEventListener("click",function(){
			  var elt = document.getElementById("recipesContainer");
			  elt.scrollTop = elt.scrollHeight;
			  checkScrollProgress();
		  });
		  
		  }
		  
		  //showgroup and sortgroup panel module
		  //recipesShowGroup recipesSortGroup
		  
		  var cont1 = "<button id = 'nameSort'>ByName</button>";
		  cont1 = cont1 + "<button id = 'dateSort'>ByDate</button>";
		  cont1 = cont1 + "<button id = 'viewsSort'>ByViews</button>";
		  cont1 = cont1 + "<button id = 'ratingSort'>ByRating</button>";
		  cont1 = cont1 + "<button id = 'dietSort'>ByDiet</button>";
		  cont1 = cont1 + "<button id = 'albumBtn'>Albums</button>";
		  
		  document.getElementById("recipesSortGroup").innerHTML = cont1;
		  
		//unclick #96CECA
		//doclick #45B39D

		 var cont2 = "<button id = 'choiceBtn'>Choices</button>";
		 cont2 = cont2 + "<button id = 'typeBtn'>Types</button>";
		 cont2 = cont2 + "<button id = 'descripBtn'>Descript</button>";
		 cont2 = cont2 + "<button id = 'showSubmit'>filter</button>";
		 document.getElementById("recipesShowGroup").innerHTML = cont2;
		 
		 //choice type and descrip Panel
		 
		 loadChoicePanel();
		 loadTypePanel();
		 loadDescripPanel();
		 filterAction();
		 
		 
		 unClickAll();
		 
		 if(sortFlag == "name")
		 {
			 document.getElementById("nameSort").style.backgroundColor = "#45B39D";
		 }	 
		 else if(sortFlag == "date")
		 {
			 document.getElementById("dateSort").style.backgroundColor = "#45B39D";
		 } 
		 else if(sortFlag == "views")
		 {
			 document.getElementById("viewsSort").style.backgroundColor = "#45B39D";
		 } 
		 else if(sortFlag == "rating")
		 {
			 document.getElementById("ratingSort").style.backgroundColor = "#45B39D";
		 }
		 else if(sortFlag == "diet")
		 {
			 document.getElementById("dietSort").style.backgroundColor = "#45B39D";
		 }
		 else if(sortFlag == "album")
		 {
			 document.getElementById("albumBtn").style.backgroundColor = "#45B39D";
		 }
		 
		 //sort panel activation
		 
		 document.getElementById("nameSort").addEventListener("click",function(){
			
			 if(nameSortedRecipes.length == 1)
			 {
				 window.alert("Nothing To Sort");
			 }	 
			 else
			 {
				 sortFlag = "name";
				 loadRecipePanel();
			 }	 
			 
		 });
		 
		 document.getElementById("dateSort").addEventListener("click",function(){
			
			 if(nameSortedRecipes.length == 1)
			 {
				 window.alert("Nothing To Sort");
			 }	 
			 else
			 {
				 sortFlag = "date";
				 loadRecipePanel();
			 }
			 
		 });
		 
		 document.getElementById("viewsSort").addEventListener("click",function(){
			 
			 if(nameSortedRecipes.length == 1)
			 {
				 window.alert("Nothing To Sort");
			 }	 
			 else
			 {
				 sortFlag = "views";
				 loadRecipePanel();
			 }
			 
		 });
		 
		 document.getElementById("ratingSort").addEventListener("click",function(){
				
			 if(nameSortedRecipes.length == 1)
			 {
				 window.alert("Nothing To Sort");
			 }	 
			 else
			 {
				 sortFlag = "rating";
				 loadRecipePanel();
			 }
			 
		 });
		 
		 document.getElementById("dietSort").addEventListener("click",function(){
			 
			 if(nameSortedRecipes.length == 1)
			 {
				 window.alert("Nothing To Sort");
			 }	 
			 else
			 {
				 sortFlag = "diet";
				 loadRecipePanel();
			 }	
			 
		 });
		 
		 document.getElementById("albumBtn").addEventListener("click",function(){
				
			 sortFlag = "album";
			 loadAlbumPanel();
			 //document.getElementById("recipesContainer").innerHTML = cont;
		 });
		 
		  //button active parts
		  
		  //copy start
		  //recipeList
		  ratingColorDistribute();
		  
		  var x = document.getElementsByClassName("backPart");
		  for(i=0;i<len;i++)
		  {
			  x[i].style.display = "none";
		  }	  
		  
		  var y = document.getElementsByClassName("recipeDetails");
		  for(i=0;i<len;i++)
		  {
			  y[i].addEventListener("click",function(event){
				 
				  var txt = event.target.innerText;
				  var elt = event.target.parentElement.parentElement.getElementsByClassName("backPart")[0];
				  if(txt == "Details")
				  {
					  elt.style.display = "block";
					  event.target.innerText = "Less";
					  checkScrollProgress();
				  }
				  else
				  {
					  elt.style.display = "none";
					  event.target.innerText = "Details";
					  checkScrollProgress();
				  }	  
				  
				  
			  });
			  
		  }
		  
		  //copy ends
	  }	  
  }
  
  
  function getUnitRecipe(txt)
  {
	 var len = nameSortedRecipes.length;
	 var i;
	 var k = parseInt(txt.trim());
	 
	 for(i=0;i<len;i++)
	 {
		 var m = parseInt(nameSortedRecipes[i].recipeid);
		 if(m == k)
		 {
			 return nameSortedRecipes[i];
		 }	 
	 }	 
  }
  
  //albumPanel module
  //document.getElementById("recipesContainer").innerHTML = cont;
  //allAlbums
  //nameSortedRecipes[i]
  //generateUnitRecipePanel
  //recipeListTitle
  //recipeList
  
  function generateUnitAlbumPanel(res) //allAlbums[i] will be passed
  {
	  var content = res.content.trim();
	  var cArr = content.split(" ");
	  var len = cArr.length;
	  var i;
	  
	  var cont = "<div class = 'album'>";
	  
	  cont = cont + "<div clss = 'albumId'>" + res.albumid + "</div>";
	  
	  cont = cont + "<div class = 'outAlbum'>";
	  cont = cont + "<div class = 'albumTitle'>Album: " + res.name + "</div>";
	  cont = cont + "<div class = 'contentCount'>Recipes : " + len + "</div>";
	  cont = cont + "<div class = 'openAlbum'>Open</div>";
	  cont = cont + "<div class = 'albumLike'>Like</div>";
	  cont = cont + "</div>"; //outAlbum closes
	  
	  cont = cont + "<div class = 'inAlbum'>";
	  for(i=0;i<len;i++)
	  {
		  var recipe = getUnitRecipe(cArr[i].trim()); 
		  cont = cont + generateUnitRecipePanel(recipe); 
	  }	  
	  
	  cont = cont + "</div>"; //inAlbum closes
	  cont = cont + "</div>"; //album closes
	
	  return cont;  
  }  
  
  function loadAlbumPanel()
  {
	  var len = allAlbums.length;
	  var i;
	  if(len == 0)
	  {
		  window.alert("No Album Available");
	  }
	  else
	  {
		  window.alert("Album is Called");
		  unClickAll();
		  document.getElementById("albumBtn").style.backgroundColor = "#45B39D";
		  
		  //select Panel is deactivated
		  var cont2 = "<div id = 'NoSelect'>Nothing To Select</div>";
	      document.getElementById("recipesShowGroup").innerHTML = cont2;
		 
	      
	     var cont = "<div id = 'recipeProgress'></div>";
		 cont = cont + "<div id = 'recipeListTitle'>ALBUM : " + len + " albums</div>";
		 
		 cont = cont + "<div id = 'recipeList'>";
		 
		 for(i=0;i<len;i++)
		 {
			 cont = cont + generateUnitAlbumPanel(allAlbums[i]); 
		 }
		 
		 cont = cont + "</div>"; //recipeList ends
		 document.getElementById("recipesContainer").innerHTML = cont;
		 
		 document.getElementById("recipesContainer").scrollTop = 0;
		  
		  
		  document.getElementById("recipesContainer").addEventListener("scroll",function(event){
			  
			  var d = document.getElementById("recipesContainer").scrollTop;
			  var h = document.getElementById("recipesContainer").scrollHeight;
			  
			  var c = (d*1000)/h;
			  var k = Math.round(c);
			  
			  if(k>250)
			  {
				  k = 250;
			  }	
			  
			  document.getElementById("recipeProgress").style.width = k + "px";
			  
		  });
		 
		 
		 
		 
		 var x = document.getElementsByClassName("inAlbum");
		 var y = document.getElementsByClassName("openAlbum");
		 
		 for(i=0;i<len;i++)
		 {
			 x[i].style.display = "none";
			 
			 y[i].addEventListener("click",function(event){
				 
				 var txt = event.target.innerText;
				 var elt = event.target.parentElement.parentElement.getElementsByClassName("inAlbum")[0];
				 
				 //backPart
				 //recipeDetails
				 
				 if(txt == "Open")
				 {
					 elt.style.display = "block";
					 event.target.innerText = "Close";
					 checkScrollProgress();
				 }
				 else
				 {
					 elt.style.display = "none";
					 event.target.innerText = "Open";
					 
					 backs = event.target.parentElement.parentElement.getElementsByClassName("backPart");
					 dets = event.target.parentElement.parentElement.getElementsByClassName("recipeDetails");
					 
					 var len = backs.length;
					 var i;
					 
					 for(i=0;i<len;i++)
					 {
						 if(dets[i].innerText == "Less")
						 {
							 backs[i].style.display = "none";
							 dets[i].innerText = "Details";
						 }	 
					 }	 
					 
				 checkScrollProgress();	 
				 //else ends	 
				 }	 
				 
			 });
			 
		 }
		 
		//copy start
		//recipeList
		  ratingColorDistribute();
		  
		  var x1 = document.getElementsByClassName("backPart");
		  len = x1.length;
		  for(i=0;i<len;i++)
		  {
			  x1[i].style.display = "none";
		  }	  
		  
		  var y1 = document.getElementsByClassName("recipeDetails");
		  for(i=0;i<len;i++)
		  {
			  y1[i].addEventListener("click",function(event){
				 
				  var txt = event.target.innerText;
				  var elt = event.target.parentElement.parentElement.getElementsByClassName("backPart")[0];
				  if(txt == "Details")
				  {
					  elt.style.display = "block";
					  event.target.innerText = "Less";
					  checkScrollProgress();
				  }
				  else
				  {
					  elt.style.display = "none";
					  event.target.innerText = "Details";
					  checkScrollProgress();
				  }	  
				  
				  
			  });
			  
		  }
		  
		  //copy ends
		 
		 
	  }	  
	 
	//function ends  
  }
  
  
  //showSubmit module
  
  function getTypeFilterArr()
  {
	  var x = document.getElementsByClassName("type");
	  var len = x.length;
	  var i;
	  var str = [];
	  for(i=0;i<len;i++)
	  {
		  if(x[i].checked == true)
		  {
			  str.push(x[i].name);
		  }	  
	  }
	  
	  return str;
  }
  
  function getChoiceFilterArr()
  {
	  var x = document.getElementsByClassName("choice");
	  var len = x.length;
	  var i;
	  var str = [];
	  for(i=0;i<len;i++)
	  {
		  if(x[i].checked == true)
		  {
			  str.push(x[i].name);
		  }	  
	  }
	  
	  return str;
  }
  
  
  function getDescripFilterArr()
  {
	  var x = document.getElementsByClassName("descrip");
	  var len = x.length;
	  var i;
	  var str = [];
	  for(i=0;i<len;i++)
	  {
		  if(x[i].checked == true)
		  {
			  str.push(x[i].name);
		  }	  
	  }
	  
	  return str;
  }
  
//showSubmit
  
  function searchStrInArr(str,strArr)
  {
	var len1 = strArr.length;
	var i;
	var tempArr = str.split(",");
	var len2 = tempArr.length;
	var flag = false;
	
	for(i=0;i<len1;i++)
	{
		for(j=0;j<len2;j++)
		{	
			var temp1 = strArr[i].toString();
			var temp2 = tempArr[j];
			
			if(temp1 == temp2)
			{
				flag = true;
				return flag;
			}	
		}	
	}	
	
	return flag;
  }
  
  
  function filterAction()
  {
	  document.getElementById("showSubmit").addEventListener("click",function(){
		 
		  var choiceArr = getChoiceFilterArr();
		  var typeArr = getTypeFilterArr();
		  var descripArr = getDescripFilterArr();
		  
		  /*
		  console.log(choiceArr.join(","));
		  console.log(typeArr.join(","));
		  console.log(descripArr.join(","));
		  console.log("*********************************************************");
		  */
		  
		  if(choiceArr.length == 0)
		  {
			  window.alert("Can't Leave All Choices Unchecked");
			  document.getElementById("choiceListContainer").style.display = "block";
			  document.getElementById("typeListContainer").style.display = "none";
			  document.getElementById("descripListContainer").style.display = "none";
		  }	  
		  else if(typeArr.length == 0)
		  {
			  window.alert("Can't Leave All Types Unchecked");
			  document.getElementById("choiceListContainer").style.display = "none";
			  document.getElementById("typeListContainer").style.display = "block";
			  document.getElementById("descripListContainer").style.display = "none";
		  }
		  else if(descripArr.length == 0)
		  {
			  window.alert("Can't Leave All Descriptions Unchecked");
			  document.getElementById("choiceListContainer").style.display = "none";
			  document.getElementById("typeListContainer").style.display = "none";
			  document.getElementById("descripListContainer").style.display = "block";
		  }
		  else
		  {
			  document.getElementById("choiceListContainer").style.display = "none";
			  document.getElementById("typeListContainer").style.display = "none";
			  document.getElementById("descripListContainer").style.display = "none";
			  
			  var x = document.getElementsByClassName("recipe");
			  var len = x.length;
			  var i;
			  var showCount = 0;
			  for(i=0;i<len;i++)
			  {
				  if(x[i].getElementsByClassName("recipeDetails")[0].innerText == "Less");
				  {
					  x[i].getElementsByClassName("recipeDetails")[0].innerText = "Details";
					  x[i].getElementsByClassName("backPart")[0].style.display = "none";
				  }
				  
				  
				  var choiceStr = String(x[i].getElementsByClassName("recipeChoice")[0].innerText.substring(11)).trim();
				  var typeStr = String(x[i].getElementsByClassName("recipeType")[0].innerText.substring(10)).trim();
				  var descripStr = String(x[i].getElementsByClassName("recipeDescrip")[0].innerText.substring(6)).trim();
				  
				  /*
				  console.log("Choce Str : " + choiceStr);
				  console.log("Type Str : " + typeStr);
				  console.log("Descrip Str : " + descripStr);
				  */
				  
				  var flag1 = searchStrInArr(choiceStr,choiceArr);
				  var flag2 = searchStrInArr(typeStr,typeArr);
				  var flag3 = searchStrInArr(descripStr,descripArr);
				 
				  /*
				  console.log("CF : " + flag1 + " TF : " + flag2 + "DF : " + flag3);
				  console.log("--------------------------------------------------");
				  */
				  
				  if(flag1 && flag2 && flag3)
				  {
					  x[i].style.display = "block";
					  showCount = showCount + 1;
				  }
				  else
				  {
					  x[i].style.display = "none";
				  }	  
			  }	  
			  
			  if(3 < len)
			  {
				  if(showCount <= 3)
				  {
					  //vanish top bottom btn
					  document.getElementById("recipeBottom").style.display = "none";
					  document.getElementById("recipeTop").style.display = "none";
				  }
				  else
				  {
					  document.getElementById("recipeBottom").style.display = "block";
					  document.getElementById("recipeTop").style.display = "block";
				  }	
			  }	  
			
			  checkScrollProgress();
			  //else ends
		  }	  
		  
		  
	  });
	  
  }
  
  //searchStrInArr(str,strArr)
  
  function loadChoicePanel()
  {
	 var len = allChoices.length;
	 var i;
	 var cont = "<div id = 'choiceList'>";
	 for(i=0;i<len;i++)
	 {
		 cont = cont + "<div class = 'chCon'>";
		 cont = cont + "<input type = 'checkbox' class = 'choice' name='" + allChoices[i].name + "'>" + allChoices[i].name + "</input>";
		 cont = cont + "</div>";
	 }	 
	 
	 cont = cont + "</div>"; //choiceList closes
	 cont = cont + "<button id = 'choiceHide'>hide</button>";
	 document.getElementById("choiceListContainer").innerHTML = cont;
	 
	 //Activation
	 
	 document.getElementById("choiceHide").addEventListener("click",function(){
		
		 document.getElementById("choiceListContainer").style.display = "none";
		 
	 });
	 
	 document.getElementById("choiceBtn").addEventListener("click",function(){
		 
		 document.getElementById("choiceListContainer").style.display = "block";
		 
	 });
	 
	 var x = document.getElementsByClassName("choice");
	 var y = document.getElementsByClassName("chCon");
		
		for(i=0;i<len;i++)
	    {
	   	 x[i].checked = true;
	   	 
	   	 y[i].addEventListener("click",function(event){
	   		 
	   		 var z = event.target;
	   		 var p = z.getElementsByClassName("choice")[0];
	   		 
	   		 if(p.checked == true)
	   		 {
	   			 p.checked = false;
	   		 }
	   		 else
	   		 {
	   			 p.checked = true;
	   		 }	 
	   		 
	   	 });
	    }
	 
  }
  
  function loadTypePanel()
  {
	 var len = allTypes.length;
	 var i;
	 var cont = "<div id = 'typeList'>";
	 for(i=0;i<len;i++)
	 {
		 cont = cont + "<div class = 'tyCon'>";
		 cont = cont + "<input type = 'checkbox' class = 'type' name='" + allTypes[i].name + "'>" + allTypes[i].name + "</input>";
		 cont = cont + "</div>";
	 }	 
	 
	 cont = cont + "</div>"; //typeList closes
	 cont = cont + "<button id = 'typeHide'>hide</button>";
	 document.getElementById("typeListContainer").innerHTML = cont;
	 
	 //Activation
	 document.getElementById("typeHide").addEventListener("click",function(){
		
		 document.getElementById("typeListContainer").style.display = "none";
		 
	 });
	 
     document.getElementById("typeBtn").addEventListener("click",function(){
		 
		 document.getElementById("typeListContainer").style.display = "block";
		 
	 });
     
     
     var x = document.getElementsByClassName("type");
     var y = document.getElementsByClassName("tyCon");
     
     for(i=0;i<len;i++)
     {
    	 x[i].checked = true;
    	 
    	 y[i].addEventListener("click",function(event){
    		 
    		 var z = event.target;
    		 var p = z.getElementsByClassName("type")[0];
    		 
    		 if(p.checked == true)
    		 {
    			 p.checked = false;
    		 }
    		 else
    		 {
    			 p.checked = true;
    		 }	 
    		 
    	 });
     }	 
	 
     //type panel ends
  }
  
  function loadDescripPanel()
  {
	  var cont = "<div id = 'descripList'>";

	cont = cont + "<div class = 'descCon'>";
	cont = cont + "<input type = 'checkbox' class = 'descrip' name='Veg'>Veg</input>";
	cont = cont + "</div>";	 
		 
	cont = cont + "<div class = 'descCon'>";
	cont = cont + "<input type = 'checkbox' class = 'descrip' name='NonVeg'>NonVeg</input>";
	cont = cont + "</div>";	 
	
	cont = cont + "<div class = 'descCon'>";
	cont = cont + "<input type = 'checkbox' class = 'descrip' name='None'>None</input>";
	cont = cont + "</div>";
	
	cont = cont + "</div>"; //descripList closes
	cont = cont + "<button id = 'descripHide'>hide</button>";
	document.getElementById("descripListContainer").innerHTML = cont;
	
	//activations
	
	document.getElementById("descripHide").addEventListener("click",function(){
		
		document.getElementById("descripListContainer").style.display = "none";
	});
	
	document.getElementById("descripBtn").addEventListener("click",function(){
		 
		 document.getElementById("descripListContainer").style.display = "block";
		 
	 });
	
	var len = 3;
	var i;
	
	var x = document.getElementsByClassName("descrip");
    var y = document.getElementsByClassName("descCon");
	
	for(i=0;i<len;i++)
    {
   	 x[i].checked = true;
   	 
   	 y[i].addEventListener("click",function(event){
   		 
   		 var z = event.target;
   		 var p = z.getElementsByClassName("descrip")[0];
   		 
   		 if(p.checked == true)
   		 {
   			 p.checked = false;
   		 }
   		 else
   		 {
   			 p.checked = true;
   		 }	 
   		 
   	 });
    }
	
  }
  
  
  function nameAdjust(txt)
  {
	  if(txt.length > 20)
	  {
		  txt = txt.substring(0,20) + "...";
	  }	
	  
	return txt;  
  }
  
  //Review Panels  
  function maxFive(a1,a2,a3,a4,a5)
  {
     var b = a1;
     if(a2 > b)
     {
  	   b = a2;
     }
     
     if(a3 > b)
     {
  	   b = a3;
     }
     
     if(a4 > b)
     {
  	   b = a4;
     }
     
     if(a5 > b)
     {
  	   b = a5;
     }
     
     if(b == 0)
     {
  	   b = 1;
     }	   
     
   return b;  
  }

  function generateRatingCountBar(txt1,txt2,txt3,txt4,txt5)
  {
  	var b = maxFive(txt1,txt2,txt3,txt4,txt5);
  	var p1 = 2*Math.round((txt1/b)*100);
  	var p2 = 2*Math.round((txt2/b)*100);
  	var p3 = 2*Math.round((txt3/b)*100);	
  	var p4 = 2*Math.round((txt4/b)*100);
  	var p5 = 2*Math.round((txt5/b)*100);
  	
  	var cont = "<div class = 'bar'><span class = 't'>Ratings: </span>";
  	   cont = cont + "<div class = 'out'><div class = 'out1' style='width: " + p1 + "px;'></div></div><div class = 'txt1'>" + txt1 + "</div>";
  	   cont = cont + "<div class = 'out'><div class = 'out2' style='width: " + p2 + "px;'></div></div><div class = 'txt2'>" + txt2 + "</div>";
  	   cont = cont + "<div class = 'out'><div class = 'out3' style='width: " + p3 + "px;'></div></div><div class = 'txt3'>" + txt3 + "</div>";
  	   cont = cont + "<div class = 'out'><div class = 'out4' style='width: " + p4 + "px;'></div></div><div class = 'txt4'>" + txt4 + "</div>";
  	   cont = cont + "<div class = 'out'><div class = 'out5' style='width: " + p5 + "px;'></div></div><div class = 'txt5'>" + txt5 + "</div>";
  	   cont = cont + "</div>";
  	   
  	return cont;   
  }

  function generateReview(txt)
  {
  	var cont = "<div class = 'review'><div class = 'cmtCount'>" + txt + "</div>";
  	cont = cont + "<div class = 'line2'>Reviews</div></div>";
  	
  	return cont;
  }


  function generateUnitRecipePanel(res)
  {
	  var k = res.recipeid;
	  var rev = getUnitReview(k); 
	  
	  var txt = rev.cmtCount;
	  var txt1 = parseInt(rev.oneCount);
	  var txt2 = parseInt(rev.twoCount);
	  var txt3 = parseInt(rev.threeCount);
	  var txt4 = parseInt(rev.fourCount);
	  var txt5 = parseInt(rev.fiveCount);
	  
	  
	  var cont = "<div class = 'recipe'>"; //recipe starts
	  cont = cont + "<div class = 'recipeId'>" + res.recipeid + "</div>";
	  
	  cont = cont + "<div class = 'frontPart'>"; //frontPart starts
	  cont = cont + "<div class = 'recipeName'>Recipe Title: " + nameAdjust(res.title) + "</div>";
	  cont = cont + "<div class = 'recipeDate'>" + dateFormatChange(res.date) + "</div>";
	  cont = cont + "<div class = 'recipeViews'>Views: " + res.views + "</div>";
	  cont = cont + "<div class = 'recipeDetails'>Details</div>";
	  cont = cont + "<div class = 'recipeLike'>Like</div>";
	  cont = cont + "<div class = 'recipeRating'>" + res.rating + "</div>";
	  cont = cont + "</div>"; //frontPart Ends
	  
	  
	  var choiceStr = generateChoiceStr(res.choice);
	  var typeStr = generateTypeStr(res.type);
	  var descripStr = res.descrip;
	  
	  cont = cont + "<div class = 'backPart'>"; //backPart starts
	  cont = cont + "<div class = 'recipeNameFull'>" + res.title + "</div>";
	  cont = cont + "<div class = 'recipeDiet'>Diet: " + getUnitDiet(res.diet) + "</div>";
	  cont = cont + "<div class = 'recipeChoice' name = '" + choiceStr + "'>Recipe Of: " + choiceStr + "</div>";
	  cont = cont + "<div class = 'recipeType' name = '" + typeStr + "'>Generally:" + typeStr + "</div>";
	  cont = cont + "<div class = 'recipeDescrip' name = '" + descripStr + "'>Item: " + descripStr + "</div>";
	  cont = cont + generateRatingCountBar(txt1,txt2,txt3,txt4,txt5);
	  cont = cont + generateReview(txt);
	  cont = cont + "</div>"; //backPart Ends
	  
	  cont = cont + "</div>"; //recipe ends
	  
	  return cont;
  }
  
  function getUnitDiet(k)
  {
	  var x = parseInt(k);
	  var str = "";
	  
	  if(x == 5)
      {
		  str = "Very-Rich";
      }
	  else if(x == 4)
	  {
		  str = "Rich";
	  }
	  else if(x == 3)
	  {
		  str = "Moderate";
	  }
	  else if(x == 2)
	  {
		  str = "Healthy";
	  }
	  else if(x == 1)
	  {
		  str = "Very-Healthy";
	  }	  
	  
  return str;  
  }
  
  function generateChoiceStr(str)
  {
	  var txt = str.trim();
	  var res = str.split(" ");
	  var len = res.length;
	  var i;
	  var outTxt = "";
	  
	  for(i=0;i<len;i++)
	  {
		  var k = parseInt(res[i].trim());
		  outTxt = outTxt + getUnitChoice(k) + ",";
	  }	  
	  
	  len = outTxt.length;
	  outTxt = outTxt.substring(0,len - 1);
	  return outTxt;
  }
  
  function getUnitChoice(k)
  {
	  var len = allChoices.length;
	  var i;
	  for(i=0;i<len;i++)
	  {
		  if(allChoices[i].choiceid == k)
		  {
			  return allChoices[i].name;
		  }	  
	  }	  
  }
  
  function generateTypeStr(str)
  {
	  var txt = str.trim();
	  var res = str.split(" ");
	  var len = res.length;
	  var i;
	  var outTxt = "";
	  
	  for(i=0;i<len;i++)
	  {
		  var k = parseInt(res[i].trim());
		  outTxt = outTxt + getUnitType(k) + ",";
	  }	  
	  
	  len = outTxt.length;
	  outTxt = outTxt.substring(0,len - 1);
	  return outTxt;
  }
  
  function getUnitType(k)
  {
	  var len = allTypes.length;
	  var i;
	  for(i=0;i<len;i++)
	  {
		  if(allTypes[i].typeid == k)
		  {
			  return allTypes[i].name;
		  }	  
	  }	  
  }
  
  
  //profile info module
  var similarUsers = "";
  
  function loadProfileInfo()
  {
	  var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function(){
		  
		  if(this.readyState == 4 && this.status == 200)
		  {
			  var result = this.responseText;
			  var jsonObj = JSON.parse(result);
			  
			  keyUser = jsonObj[0];
			  followers = jsonObj[1];
			  similarUsers = jsonObj[2];
			  
			  loadProfileInfoPanel();
			  loadFollowPanel();
			  loadSimilarUserPanel();
			  
		  }	  
	  };
	  
	  var actionstr = "loadprofileinfo?userid=" + userid;
	  xhttp.open("GET",actionstr,true);
	  xhttp.send();
  }
  
  function loadSimilarUserPanel()
  {
	 if(similarUsers.length == 0)
	 { 
		 var cont4 = "<div id = 'NoSimilarUser'>No Similar Writers</div>";
		 document.getElementById("similarUsers").innerHTML = cont4;
	 }
	 else
	 {
		var len = similarUsers.length;
		var i;
		var cont = "<div id = 'similarUserTitle'> Similar Users : " + len + "</div>";
		cont = cont + "<div id = 'simUsersList'>";
		for(i=0;i<len;i++)
		{
			
			var s = String(similarUsers[i].name);
			if(s.length > 20)
			{
				s = s.substring(0,20) + "...";
			}	
			
			cont = cont + "<div class = 'simUser'>";
			cont = cont + "<a href = 'profile.jsp?userid=" + similarUsers[i].userid + "'>" + s + "</a><br/>";
			cont = cont + "<span class = 'wCount'>Written Recipes : " + similarUsers[i].count + "</span>";
			cont = cont + "<div class = 'userSimilarity'>" + similarUsers[i].per + "%</div>";
			cont = cont + "</div>"; //simUser ends
			
		}
		
		cont = cont + "</div>";
		document.getElementById("similarUsers").innerHTML = cont;
	 }	 
  }
  
  function loadProfileInfoPanel()
  {
	  var cont = "<div id = 'keyUserName'>" + keyUser.username + "</div>";
	  cont = cont + "<div id = 'keyUserEmail'>" + keyUser.email + "</div>";
	  document.getElementById("userInfoContainer").innerHTML = cont;
  }
  
  function loadFollowPanel()
  {
	  var len = followers.length;
	  var cont = "<div id = 'followersTitle'>";
	  if(len == 0)
	  {
		  cont = cont + "List Of Followers</div>";
		  cont = cont + "<div id = 'NoFollower'><h2>No Followers<h2></div>";
	  }
	  else
	  {
		  cont = cont + "Total Followers : " + len + "</div>";
		  var i;
		  var r = 0;
		  var h = 0;
		  
		  for(i=0;i<len;i++)
		  {
			  cont = cont + "<br/><div class = 'follower'><a href='profile.jsp?userid=" + followers[i].userid + "'>" + followers[i].name + "</a>";
			  //cont = cont + "<div class = 'f'>reviews: " + followers[i].cmtCount + "</div>";
			  //cont = cont +  "<div class = 'f'>ratings: " + followers[i].ratingCount + "</div>";
			  
			  var str = "";
			  h = parseInt(followers[i].cmtCount) + parseInt(followers[i].ratingCount);
			  if(i == 0)
			  {
				 r = h;
				 if(r != 0)
				 {
					 str = "Top Follower";
				 }	 
			  }
			  else
			  {
				  if(r == h)
				  {
					  str = "Top Follower";
				  }	  
			  }	  
			  
			  if(str == "Top Follower")
			  {
				  cont = cont + "<div class = 'f'>*" + str + "</div>";
			  }	  
			  
			  cont = cont + "</div>";
		  }	 
		  
		  
	  }	  
	  
	  document.getElementById("followersListContainer").innerHTML = cont;
  }
  
  

</script>

</body>
</html>