<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Account Page</title>

<style>

#profileInfo
{
   position: absolute;
   top: 10px;
   left: 10px;
   height: 250px;
   width: 350px;
   background-color: #AED6F1;
   border-radius: 5px;
   border-style: none;
}

#username,#usernameTxt
{
   /*height: 50px;*/
   width: 330px;
   margin-top: 10px;
   margin-left: 10px;
   font-size: 35px;
   font-family: "Times New Roman";
   background-color: #3498DB;
   text-align: center;
   border-radius: 5px;
   padding-top: 10px;
   padding-bottom: 10px;
   box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}

#usernameTxt
{
  height: 30px;
  background-color: #F4EEDE;
}

#useremail
{
   /*height: 50px;*/
   padding-top: 10px;
   padding-bottom: 10px;
   width: 330px;
   margin-top: 10px;
   margin-left: 10px;
   font-size: 20px;
   font-family: "Times New Roman";
   background-color: #8FF43F;
   text-align: center;
   border-radius: 5px;
   box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}

#userchoice,#editChoice
{
   padding-top: 10px;
   padding-bottom: 10px;
   width: 330px;
   margin-top: 10px;
   margin-left: 10px;
   font-size: 20px;
   font-family: "Times New Roman";
   background-color: #E3E7D5;
   text-align: center;
   border-radius: 5px;
   box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
   transition: 0.2s;
}

#userchoice:hover
{
    cursor: pointer;
    color: blue;
	text-decoration: underline;
}

#userBtns
{
   height: 50px;
   width: 340px;
   margin-top: 40px;
   margin-left: 5px;
}

#editInfo,#saveInfo,#cancelEdit
{
   height: 30px;
   width: 100px;
   margin-left: 5px;
   border-radius: 10px;
   background-color: #F4D03F;
   border-style: none;
   box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
   font-size: 15px;
   font-weight: bold;
   font-family: "Times New Roman";
}

#userChoiceListContainer
{
   position: absolute;
   top: 200px;
   left: 90px;
   height: 250px;
   width: 200px;
   background-color: #F3D890;
   border-radius: 5px;
   border-style: none;
   overflow: auto;
   box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}

#allChoiceListContainer
{
   position: absolute;
   top: 190px;
   left: 80px;
   height: 350px;
   width: 220px;
   background-color: #D3E8AF;
   border-radius: 5px;
   border-style: none;
   overflow: auto;
   box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
   padding-bottom: 10px;
}

.choicehead,.choiceshow,.chCon,#allchoicesearch
{
	width: 190px;
	margin-left: 5px;
	margin-top: 2px;
	border-style: solid;
	border-width: 1px;
	text-align: center;
	padding-top: 10px;
	padding-bottom: 10px;
	font-size: 15px;
	border-radius: 5px;
}

#allchoicesearch
{
   width: 186px;
   margin-bottom: 2px;
   box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}

#choiceTop
{
  position: sticky;
  top: 0;
  background-color: #D7DBDD;
  padding-bottom: 10px;
}

#okChoice,#cancelChoice
{
   height: 30px;
   width: 80px;
   margin-top: 5px;
   background-color: #3498DB;
   text-align: center;
   border-style: none;
   border-radius: 5px;
   margin-left: 15px;
   box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
   font-family: "Times New Roman";
   font-size: 16px;
   transition: 0.2s;
}

#okChoice:hover,#cancelChoice:hover
{
   background-color: #F2A14A;
   cursor: pointer;
}

.choicehead
{
   background-color: white;
   font-weight: bold;
   border-radius: 5px;
}

#allchoicehead
{
   text-align: center;
   font-weight: bold;
}

/*subscription style module*/

#profileSubscripts
{
   position: absolute;
   left: 10px;
   top: 270px;
   height: 300px;
   width: 350px;
   background-color: #D7DBDD;
   border-style: none;
   border-radius: 5px;
   overflow: auto;
}

.subs
{
	width: 330px;
	background-color: #ECCEAE;
	margin-top: 10px;
	margin-left: 10px;
    border-radius: 5px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    padding-bottom: 10px;
    transition: 0.2s;
}

.subs:hover
{
	background-color: #ECBB86;
}

.subsCount,.followCount
{
    margin-top: 10px;
	margin-left: 10px;
	font-weight: bold;
}

.unSubs
{
   margin-left: 150px;
   margin-top: -18px;
   font-weight: bold;
}

.unSubs:hover
{
	text-decoration: underline;
	color: blue;
	cursor: pointer;
}

.subsLink,.followName
{
   margin-left: 10px;
   font-size: 25px;
}

#subsHead,#followhead
{
   text-align: center;
   font-size: 15px;
   font-weight: bold;
   background-color: #ED891E;
   padding-top: 10px;
   padding-bottom: 10px;
   position: sticky;
   top: 0;
}

#followhead
{
	background-color: #9EC46A;
}

/*followrs module*/

#profileFollowers
{
   position: absolute;
   left: 10px;
   top: 580px;
   height: 350px;
   width: 350px;
   background-color: #CBF582;
   overflow: auto;
}

.follow
{
	width: 330px;
	background-color: #AED6F1;
	margin-top: 10px;
	margin-left: 10px;
    border-radius: 5px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    padding-bottom: 10px;
    transition: 0.2s;
}

.follow:hover
{
	background-color: #85C1E9;
}

/*navbar module*/

#addNewRecipe,#addNewAlbum,#customSearch,#logout,#notifications
{ 
   display: inline;
   height: 40px;
   text-align: center;
   background-color: #D0B8DB80;
   width: 200px;
   border-radius: 5px;
   margin-left: 5px;
   font-size: 15px;
   font-weight: bold;
   font-family: "Times New Roman";
   transition: 0.2s;
}

#addNewRecipe:hover,#addNewAlbum:hover,#customSearch:hover,#logout:hover,#notifications:hover
{
	background-color: #E2C5F0;
}

#addNewRecipe
{
	margin-left: 360px;
}

#notCount
{
   position: absolute;
   height: 30px;
   left: 1370px;
   top: 5px;
   background-color: white;
   padding-left: 15px;
   padding-right: 15px;
   padding-top: 15px;
   border-radius: 20px;
   font-size: 15px;
   box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}

body
{
	background-color: #3C134F;
}



/*review and rating count module*/

.out
{
   background-color: #D5D8DC;
   width: 200px;
   margin-top: 5px;
   border-radius: 10px 5px 5px 10px;
   height: 8px;
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
   margin-left: 350px;
   margin-top: 5px;
   box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}

.bar
{
   margin-top: -190px;
   margin-left: 350px;
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

/*review module vis*/

    .recipeCard
    {
       background-color: dodgerblue;
       width: 610px;
       border-radius: 10px;
    }

	.recipeFrontCard
	{
	   margin-top: 20px;
	   width: 610px;
	   height: 270px;
	   border-radius: 10px;
	   box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	   background-color: #FEAF9F;
	   height: 100px;
	   padding-bottom: 20px;
	}
	
	.recipeBackCard
	{
	   margin-top: 20px;
	   width: 600px;
	   height: 250px;
	   border-radius: 10px;
	   box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	   background-color: #85C1E9;
	   color: black;
	   padding-top: 10px;
	   padding-left: 10px;
	   
	}
	
	#feedHead
	{
	   padding-top: 10px;
	   padding-bottom: 10px;
	   text-align: center;
	   width: 1100px;
	   height: 30px;
	   font-weight: bold;
	   background-color: #F9E79F;
	   font-size: 20px;
	   position: sticky;
	   top: 0;
	   box-shadow: 0px 5px 8px #888888;
	   border-radius: 0px 0px 15px 15px;
	}

    .recipeName
    {
       font-size: 25px;
       font-weight: bold;
       padding-left: 20px;
       padding-bottom: 10px;
       padding-top: 10px;
    }


    .writerName,.recipeDate,.recipeViews,.recipeLike,.recipeDetails,.recipeEdit,.recipeDelete
    {
       margin-left: 20px;
       font-weight: bold;
    }
 
    .writerName
    {
    	margin-top: 10px;
    	margin-bottom: 10px;
    }
    
    .recipeDate,.recipeViews,.recipeLike,.recipeDetails,.recipeEdit,.recipeDelete
    {
       display: inline;
       transition: 0.2s;
    }
    
    .recipeDetails:hover,.recipeLike:hover
    {
      text-decoration: underline;
      color: blue;
      cursor: pointer;
    }

    .recipeRating
	{
		
	    margin-top: -90px;
	    margin-left: 510px; 
	    height: 50px;
	    width: 50px;
	    text-align: center;
		display: block;
		font-size: 40px;
		background-color: #52B527;
		color: black;
		border-radius: 40px;
		
		padding: 15px 15px;
	    transition: 0.2s;
		box-shadow: 0px 16px 32px 0px rgba(0,0,0,0.2);
	}

    .recipeLink,.recipeDiet,.recipeChoice,.recipeType,.recipeDescrip
    {
        word-wrap: break-word;
        width: 300px;
        padding: 10px 10px;
        margin-top: 10px;
        border-radius: 10px;
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    }
    
    .recipeDiet
    {
      margin-top: 25px;
    }
    
	#recipeFeedList
	{
	   padding-left: 250px;
	}
 
   #recipeListContainer
   {
   	  position: absolute;
   	  left: 380px;
   	  top: 120px;
      height: 790px;
      width: 1100px;
      background-color: #D7DBDD;
      overflow: auto;
      padding-bottom: 20px;
   }
   
   /*album module*/
   
   #myAlbumContainer
   {
      position: absolute;
      left: 1500px;
      top: 400px;
      height: 530px;
      width: 350px;
      background-color: white;
      padding-left: 15px;
      overflow: auto;
   }
  
  /*album edit panel module*/
  #recipeOptionSearch
  {
     /*box-shadow: 0px 8px 16px 0px #85C1E9;*/
     height: 35px;
     width: 280px;
     position: sticky;
     top: 0; 
     text-align: center;
     border-style: hidden;
  }
  
  #recipeOptionSearch:focus
  {
     box-shadow: inset 0px 8px 16px 0px #85C1E9;
  }
  
  #albumEditHead
  {
     text-align: center;
     padding-top: 5px;
     padding-bottom: 5px;
     background-color: #85C1E9;
     font-weight: bold;
  }
    
  #editAlbumName
  {
    height: 50px;
    width: 290px;
    margin-left: 10px;
    margin-bottom: 10px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    border-style: none;
    border-radius: 5px;
    font-size: 20px;
    font-family: "Times New Roman";
    text-align: center;
  }
  
  #editAlbumName:focus
  {
      box-shadow: inset 0px 8px 16px 0px rgba(0,0,0,0.2);
  }

  #editAlbumOK,#editAlbumCancel
  {
    height: 30px;
    width: 150px;
    border-radius: 10px;
    padding: 10px 10px;
    margin-left: 15px;
    margin-top: 10px;
    font-size: 15px;
    font-weight: bold;
    background-color: #85C1E9;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    border-style: none;
  }
 
  .recipeOption
  {
    background-color: #D7DBDD;
    width: 270px;
    margin-top: 8px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    padding: 10px 10px;
    border-radius: 10px;
    font-size: 15px;
    font-weight: bold;
  }
  
  .albumEditPanel
  {
     margin-left: 5px;
     margin-top: 10px;
     width: 320px; 
     padding-bottom: 10px;
     background-color: #F0B57980;
     box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  }
  
  #albumRecipeOptionList
  {
     height: 300px;
     overflow: auto;
     padding-left: 8px;
     padding-top: 10px;
     padding-bottom: 10px;
     background-color: #F0987980;
  }
  
  /*album panel module*/
   .album
   {
      background-color: #AED6F1;
      width: 320px;
      box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
      border-radius: 10px;
      margin-top: 20px;
   }
   
   .albumName
   {
         background-color: #3498DB80;
         padding-left: 10px;
	     font-size: 20px;
	     padding: 10px 10px;
	     box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	     margin-bottom: 10px;
   }
   
   .albumEdit,.albumOpen
   {
      text-decoration: underline;
      color: blue;
   }
   
   .shortRecipe
   {
     box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
     background-color: #F9E79F;
     margin-top: 10px;
     border-radius: 5px;
     padding-bottom: 10px;
     padding-top: 10px;
   }
   
   .shortRecipeRating,.albumRemove,.albumEdit,.albumOpen
   {
   	 margin-left: 10px;
   	 font-weight: bold;
   	 font-family: "Times New Roman";
   	 display: inline;
   }
  
   .albumRemove
   {
   	  margin-left: 30px;
   	  color: red;
   	  text-decoration: underline;
   }
   
   .albumRemove:hover,.albumEdit:hover,.albumOpen:hover
   {
      color: red;
      cursor: pointer;
   }
   
   .shortRecipeName
   {
     padding-left: 10px;
     font-size: 20px;
     padding: 10px 10px;
     background-color: #F1D76F;
     box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
     margin-bottom: 10px;
   }

</style>

</head>
<body onload = "initiate()">

<div id = "profileInfo">profile info will be loaded here</div>
<div id = "profileFollowers">profile followers will be printed here</div>
<div id = "profileSubscripts">profile Subscripts will be printed here</div>
<div id = "userChoiceListContainer">selected choices will be printed here</div>
<div id = "allChoiceListContainer">all choices will be printed here</div>
<div id = "myAlbumContainer">my albums will be loaded here</div>

<div id = "recipeListContainer">all recipes will be printed here</div>

<button id = "addNewRecipe">Add New Recipe</button>
<button id = "addNewAlbum">Create New Album</button>
<button id = "customSearch">Custom Search</button>
<button id = "logout">LogOut</button>
<button id = "notifications">Notifications</button>
<div id = "notCount">10000</div>

<button id = 'feedBtn'>Feed</button>
<button id = 'relBtn'>Relevent</button>
<button id = 'likesBtn'>Likes</button>
<button id = 'contentBtn'>Content</button>



<script>

var userid =<%= request.getParameter("userid") %>;
var userName = "";
function initiate()
{
	loadProfileInfo();
	
	loadUserFeedAndRelevent();
	
	loadContentAndAlbum(noFun,loadAlbumPanel);
	
}


//user himself
//all choices
//followers
//subscriptions

var user = "";
var allChoices = "";
var followers = "";
var subscripts = "";

function getUnitChoice(txt)
{
   var k = parseInt(txt.trim());
   var len = allChoices.length;
   var i;
   
   for(i=0;i<len;i++)
   {
	   var m = parseInt(allChoices[i].choiceid);
	   if(m == k)
	   {
		   return allChoices[i].name;
	   }	   
   }	   
}

function loadProfileInfo()
{
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function(){
		
		if(this.readyState == 4 && this.status == 200)
		{
			var res = this.responseText;
			var jsonObj = JSON.parse(res);
			user = jsonObj[0];
			allChoices = jsonObj[1];
			followers = jsonObj[2];
			subscripts = jsonObj[3];
			userName = user.username;
			
			loadProfilePanel();
			loadFollowPanel();
			loadSubscriptPanel();
		}	
	};
	
	var actionStr = "loadAccInfo?userid=" + userid;
	xhttp.open("GET",actionStr,true);
	xhttp.send();
}


//load follow module

function loadFollowPanel()
{
    var len = followers.length;
    var cont = "<div id = 'followhead'>My Followers : " + len + "</div>";
    if(len == 0)
    {
    	cont = cont + "<div id = 'noFollowers'>No Followers</div>";
    }
    else
    {
    	var i;
    	for(i=0;i<len;i++)
    	{
    		cont = cont + "<div class = 'follow'>";
    		cont = cont + "<a class = 'followName' href='profile.jsp?userid=" + followers[i].userid + "'>" + followers[i].name + "</a>";
    		cont = cont + "<div class = 'followCount'>Comments / Ratings : " + followers[i].cmtCount + " / " + followers[i].ratingCount + "</div>";
    		cont = cont + "</div>";
    	}	
    }
    
    document.getElementById("profileFollowers").innerHTML = cont;
}




//Load Subscript Module
//subscripts can be sorted by reviewCount, but that will be unnecessary

function loadSubscriptPanel()
{
   var len = subscripts.length;
   var cont = "<div id = 'subsHead'>My Subscriptions : " + len + "</div>";
   if(len == 0)
   {
	   cont = cont + "<div id = 'noSubs'>No Subscriptions</div>";
   }
   else
   {
	   var i;
	   for(i=0;i<len;i++)
	   {
		   cont = cont + "<div class = 'subs'>";
		   cont = cont + "<div class = 'subsUid'>" + subscripts[i].userid + "</div>";
		   cont = cont + "<a href='profile.jsp?userid=" + subscripts[i].userid + "' class = 'subsLink'>" + subscripts[i].name + "</a>";
		   console.log(subscripts[i].newCont);
		   if(parseInt(subscripts[i].newCont) != 0)
		   {	   
		      cont = cont + "<div class = 'subsCount'>New Recipes : " + subscripts[i].newCont + "</div>";  
		   }
		   else
		   {
			   cont = cont + "<div class = 'subsCount'>No New Recipes</div>";
		   }	   
		   
		   cont = cont + "<div class = 'unSubs'>Unfollow</div>";
		   cont = cont + "</div>";
	   }
	   
   }
   
   //profileSubscripts
   document.getElementById("profileSubscripts").innerHTML = cont;
   
   //unsubscripttions button actions will be here
	
   if(len > 0)
   {
	   var i;
	   var x = document.getElementsByClassName("unSubs");
	   var y = document.getElementsByClassName("subsUid");
	   
	   for(i=0;i<len;i++)
	   {
		   y[i].style.display = "none";
		   
		   x[i].addEventListener("click",function(event){
			  
			   var subsId = event.target.parentElement.getElementsByClassName("subsUid")[0].innerText;
			   window.alert("Unsubscribing userid : " + subsId);
			   
			   var xhttp = new XMLHttpRequest();
			   xhttp.onreadystatechange = function(){
				 
				   if(this.readyState == 4 && this.status == 200)
				   {
					  var res = this.responseText;
					  var jsonObj = JSON.parse(res);
					  
					  if(jsonObj == "successful")
				      {
						  window.alert("Successfully Unsubscribed");
						  loadProfileInfo();
				      }
					  else
					  {
						  window.alert("Unsubscription Failed");
					  }	  
				   }	   
				   
			   };
			   
			   var actionStr = "unsubscribe?userid=" + userid + "&subsid=" + subsId;
			   xhttp.open("GET",actionStr,true);
			   xhttp.send();
			   
			   
		   });
	   //for loop ends	   
	   }	   
	   
   }	   
   
}




//Load Profile Panel Module
function searchInChoice(chArr,id) //String array of ids
{
   var len = chArr.length;
   var i;
   var flag = false;
   var idStr = String(id);
   
   for(i=0;i<len;i++)
   {
	   var s = String(chArr[i]);
	   
	   if(s == idStr)
	   {
		   flag = true;
		   break;
	   }	   
   }
   
return flag;   
}


var editChoiceStr = "";

function loadProfilePanel()
{
	var choiceTxt = user.choice;
	var chArr = choiceTxt.split(" ");
	var len = chArr.length;
	var chTxt = "";
	
	if(len<2)
	{
		chTxt = getUnitChoice(chArr[0]); 
	}
	else
	{
		chTxt = getUnitChoice(chArr[0]) + " and " + (len-1) + " Others";
	}	
	
	var i;
	var cont1 = "<div class = 'choicehead'>My Choices</div>";
	for(i=0;i<len;i++)
	{
		cont1 = cont1 + "<div class = 'choiceshow'>" + getUnitChoice(chArr[i]) + "</div>"; 
	}	
	
	document.getElementById("userChoiceListContainer").innerHTML = cont1;
	document.getElementById("userChoiceListContainer").style.display = "none";
	
	
	//all choice list starts
	
	var clen = allChoices.length;
	var cont3 = "<div id = 'choiceTop'><div id = 'allchoicehead'>all choices</div>";
	cont3 = cont3 + "<input type = 'text' id = 'allchoicesearch' placeholder = 'type something'/>";
	cont3 = cont3 + "<button id = 'okChoice'>ok</button><button id = 'cancelChoice'>cancel</button></div>"
	for(i=0;i<clen;i++)
	{
		cont3 = cont3 + "<div class = 'chCon'><input type = 'checkbox' class = 'chin' name = '" + allChoices[i].choiceid +"'>";
		cont3 = cont3 + "<span class = 'ct'>" + allChoices[i].name + "</span></input></div>";
	}	
	
	document.getElementById("allChoiceListContainer").innerHTML = cont3;
	document.getElementById("allChoiceListContainer").style.display = "none";
	
	
	document.getElementById("allchoicesearch").addEventListener("keyup",function(event){
		
		var txt = event.target.value;
		var x = document.getElementsByClassName("chCon");
		var y = document.getElementsByClassName("ct");
		var len = x.length;
		var i;
		
		if(txt == "")
		{
			for(i=0;i<len;i++)
			{
				x[i].style.display = "block";
			}	
		}
		else
		{
			txt = txt.toLowerCase();
			for(i=0;i<len;i++)
			{
				var t = String(y[i].innerText).toLowerCase();
				if(t.indexOf(txt) != -1)
				{
					x[i].style.display = "block";
				}
				else
				{
					x[i].style.display = "none";
				}	
			}
		}	
		
		
		
			
	});
	
	
	document.getElementById("okChoice").addEventListener("click",function(){
		
		//editChoiceStr
		var x = document.getElementsByClassName("chin");
		var len = x.length;
		var i;
		var count = 0;
		for(i=0;i<len;i++)
		{
			if(x[i].checked)
			{
				count = count + 1;
				editChoiceStr = editChoiceStr + x[i].name + " ";	
			}	
		}
		
		editChoiceStr = editChoiceStr.trim();
		window.alert("Choice Selected : " + count);
		document.getElementById("allChoiceListContainer").style.display = "none";
	});
	
	
	document.getElementById("cancelChoice").addEventListener("click",function(){
		
		document.getElementById("allChoiceListContainer").style.display = "none";
	});
	
	
	var x = document.getElementsByClassName("chin");
	for(i=0;i<clen;i++)
	{
		var id = x[i].name;
		console.log("id : " + id);
		var flag = searchInChoice(chArr,id);
		console.log("flag : " + flag);
		console.log("----------------------------");
		if(flag == true)
		{
			x[i].checked = true;
		}	
		
		
		x[i].addEventListener("click",function(event){
			
			var y = document.getElementsByClassName("chin");
			var len = y.length;
			var count = 0;
			var i;
			var k = parseInt(event.target.name);
			
			if(k == 1)
			{
				for(i=0;i<len;i++)
				{
					y[i].checked = false;
				}	
				
				y[0].checked = true;
				return;
			}	
			
			
			if(y[0].checked)
			{
				y[0].checked = false;
				event.target.checked = true;
			}	
			else
			{
				for(i=0;i<len;i++)
				{
					if(y[i].checked)
					{
						count = count + 1;
					}	
				}	
				
				if(count == len - 1)
				{
					for(i=0;i<len;i++)
					{
						y[i].checked = false;
					}	
					
					y[0].checked = true;
					
				}
				
				if(count == 0)
				{
					y[0].checked = true;
				}	
			}	
			
			
			
		});
		
	//for loop ends	
	}	
	
	
	//all choices list ends
	
	
   var cont = "<div id = 'usernameHolder'><div id = 'username'>" + user.username + "</div></div>";
   cont = cont + "<div id = 'useremail'>" + user.email + "</div>";
   cont = cont + "<div id = 'userchoiceHolder'><div id = 'userchoice'>" + chTxt + "</div></div>";
   cont = cont + "<div id = 'userBtns'><button id = 'editInfo'>Edit</button></div>";
   document.getElementById("profileInfo").innerHTML = cont;
   
   
   //Btn Actions
   document.getElementById("userchoice").addEventListener("mouseover",function(){
	  
	   document.getElementById("userChoiceListContainer").style.display = "block";
   });
   
   document.getElementById("userchoice").addEventListener("mouseout",function(){
		  
	   document.getElementById("userChoiceListContainer").style.display = "none";
   });
   
   document.getElementById("editInfo").addEventListener("click",function(){
	  
	   document.getElementById("usernameHolder").innerHTML = "<input type = 'text' id = 'usernameTxt' value = '" + user.username + "'>";
	   
	   var cont = "<button id = 'saveInfo'>Save</button><button id = 'cancelEdit'>Cancel</button>";
	   document.getElementById("userBtns").innerHTML = cont;
	   
	   document.getElementById("userchoiceHolder").innerHTML = "<button id = 'editChoice'>Edit Choices</button>";
	   
	   document.getElementById("editChoice").addEventListener("click",function(){
		   
		   document.getElementById("allChoiceListContainer").style.display = "block";
	   });
	   
	   document.getElementById("cancelEdit").addEventListener("click",function(){
		
		   window.alert("Cancelling Edit");
		   loadProfileInfo();
		   
	   });
	   
	   
	   document.getElementById("saveInfo").addEventListener("click",function(){
			
		   //window.alert("Saving Edit");
		   
		   //validation part
		   var uname = document.getElementById("usernameTxt").value;
		   //window.alert("username received : " + uname);
		   
		   if(uname == "")
		   {
			   window.alert("Can't Leave Your Name Field Empty");
		   }
		   else
		   {
			   if(editChoiceStr == "")
			   {
				   if(uname == userName)
				   {
					   window.alert("No Changes have been made");
					   loadProfilePanel();
					   return;
				   }	   
				   
				   var r = confirm("Choices are same as previous, Proceed?");
				   if(r == true)
				   {
					   var str = "empty"; 
					   saveInfoToServ(uname,str);   
				   }	   
			   }
			   else
			   {
				   saveInfoToServ(uname,editChoiceStr);
			   }	   
		   }	   
		   
		   //loadProfileInfo();
		   //editChoiceStr
		   //usernameTxt
	   });
	   
	   
	   
   });
   
}


function saveInfoToServ(uname,chStr)
{
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function(){
		
		if(this.readyState == 4 && this.status == 200)
		{
			var res = this.responseText;
			var jsonObj = JSON.parse(res);
			if(jsonObj[0] == "successful")
			{
				window.alert("Changed Infos are saved Successfully");
			}
			else
			{
				window.alert("Failed To Save The Info");
			}
			
			loadProfileInfo();
			editChoiceStr = "";
		}	
	};
	
	//window.alert("username : " + uname + " and choiceStr : " + chStr);
	var actionStr = "saveToServ?username= " + uname + "&choices=" + chStr + "&userid=" + userid;
	xhttp.open("GET",actionStr,true);
	xhttp.send();
}

var feedRecipes = "";
var feedReviews = "";
var feedCts = "";

var relRecipes = "";
var relReviews = "";
var relCts = "";

var today = "";
var yesterday = "";

function loadUserFeedAndRelevent()
{
   var xhttp = new XMLHttpRequest();
   xhttp.onreadystatechange = function(){
	 
	   if(this.readyState == 4 && this.status == 200)
	   {
		   //feedrecipes
		   //feedchoiceTypeStrings
		   //feedreviewCount
		   
		   //and second triplets for relevents
		   
		   var res = this.responseText;
		   var jsonObj = JSON.parse(res);
		   
		   feedRecipes = jsonObj[0];
		   feedReviews = jsonObj[1];
		   feedCts = jsonObj[2];
		   
		   relRecipes = jsonObj[3];
		   relReviews = jsonObj[4];
		   relCts = jsonObj[5];
		   
		   //loadUserFeedPanel();
		   //loadUserRelPanel();
		   loadLikes(loadPanels);   
	   }	   
   };
   
   var actionStr = "userFeedRel?userid=" + userid;
   xhttp.open("GET",actionStr,true);
   xhttp.send();
}


var listFlag = "rel";
function loadUserFeedPanel()
{
   listFlag = "feed";
   var cont = "<div id = 'feedHead'>My Feed</div>";
   var len = feedRecipes.length;
   if(len == 0)
   {
	   cont = cont + "<div id = 'noFeed'>";
   }
   else
   {
	   var i;
	   cont = cont + "<div id = 'recipeFeedList'>";
	   
	   for(i=0;i<len;i++)
	   {
		   cont = cont + unitRecipePanel(feedRecipes[i],feedReviews[i],feedCts[i]);
	   }	   
	   
	   cont = cont + "</div>";
   }	   
	
   //recipeListContainer
   document.getElementById("recipeListContainer").innerHTML = cont;
   ratingColorDistribute();
   
   //feed Actions
   //recipeBackCard
   //recipeDetails parent recipeFrontCard parent recipeCard
   
   var x = document.getElementsByClassName("recipeBackCard");
   var y = document.getElementsByClassName("recipeDetails");
   len = x.length;
   for(i=0;i<len;i++)
   {
	   x[i].style.display = "none";
	   y[i].addEventListener("click",function(event){
		  
		   var t = event.target.parentElement.parentElement.getElementsByClassName("recipeBackCard")[0];
		   var txt = event.target.innerText;
		   if(txt == "Details")
		   {
			   t.style.display = "block";
			   event.target.innerText = "Less";
		   }
		   else
		   {
			   t.style.display = "none";
			   event.target.innerText = "Details";
		   }	   
		   	   
		   
	   });
	   
   }	   
   
   var z = document.getElementsByClassName("recipeLike");
   len = z.length;
   for(i=0;i<len;i++)
   {
	   z[i].addEventListener("click",function(event){
		  
		   rid = event.target.parentElement.parentElement.getElementsByClassName("recipeId")[0].innerText;
		   txt = event.target.innerText;
		   if(txt == "Like")
		   {
			   var xhttp = new XMLHttpRequest();
				xhttp.onreadystatechange = function(){
					
					if(this.readyState == 4 && this.status == 200)
					{
				       var res = this.responseText;
				       var jsonObj = JSON.parse(res);
				       if(jsonObj == "successful")
				       {
				    	   window.alert("Successfully liked");
				    	   loadLikes(loadUserFeedPanel);
				    		//loadUserFeedPanel();      
				    	   
				       }	   
					}	
				};
				
				actionStr = "likeServ?recipeid=" + rid + "&userid=" + userid + "&status=like";
				xhttp.open("GET",actionStr,true);
				xhttp.send();
		   }
		   else
		   {
			   var xhttp = new XMLHttpRequest();
				xhttp.onreadystatechange = function(){
					
					if(this.readyState == 4 && this.status == 200)
					{
				       var res = this.responseText;
				       var jsonObj = JSON.parse(res);
				       if(jsonObj == "successful")
				       {
				    	   window.alert("Successfully disliked");
				    		loadLikes(loadUserFeedPanel);
				    		//loadUserFeedPanel();
				       }	   
					}	
				};
				
				actionStr = "likeServ?recipeid=" + rid + "&userid=" + userid + "&status=dislike";
				xhttp.open("GET",actionStr,true);
				xhttp.send();
		   }	   
		   
	   });
   }	   

//loadFeedPanelEnds
}


function loadUserRelPanel()
{
	   listFlag = "rel";
	   var cont = "<div id = 'feedHead'>My Relevents</div>";
	   var len = relRecipes.length;
	   if(len == 0)
	   {
		   cont = cont + "<div id = 'noFeed'>";
	   }
	   else
	   {
		   var i;
		   cont = cont + "<div id = 'recipeFeedList'>";
		   
		   for(i=0;i<len;i++)
		   {
			   cont = cont + unitRecipePanel(relRecipes[i],relReviews[i],relCts[i]);
		   }	   
		   
		   cont = cont + "</div>";
	   }	   
		
	   //recipeListContainer
	   document.getElementById("recipeListContainer").innerHTML = cont;
	   ratingColorDistribute();
	   
	   //feed Actions
	   //recipeBackCard
	   //recipeDetails parent recipeFrontCard parent recipeCard
	   
	   var x = document.getElementsByClassName("recipeBackCard");
	   var y = document.getElementsByClassName("recipeDetails");
	   len = x.length;
	   for(i=0;i<len;i++)
	   {
		   x[i].style.display = "none";
		   y[i].addEventListener("click",function(event){
			  
			   var t = event.target.parentElement.parentElement.getElementsByClassName("recipeBackCard")[0];
			   var txt = event.target.innerText;
			   if(txt == "Details")
			   {
				   t.style.display = "block";
				   event.target.innerText = "Less";
			   }
			   else
			   {
				   t.style.display = "none";
				   event.target.innerText = "Details";
			   }	   
			   	   
			   
		   });
		   
	   }	   
	   
	   var z = document.getElementsByClassName("recipeLike");
	   len = z.length;
	   for(i=0;i<len;i++)
	   {
		   z[i].addEventListener("click",function(event){
			  
			   rid = event.target.parentElement.parentElement.getElementsByClassName("recipeId")[0].innerText;
			   txt = event.target.innerText;
			   if(txt == "Like")
			   {
				   var xhttp = new XMLHttpRequest();
					xhttp.onreadystatechange = function(){
						
						if(this.readyState == 4 && this.status == 200)
						{
					       var res = this.responseText;
					       var jsonObj = JSON.parse(res);
					       if(jsonObj == "successful")
					       {
					    	   window.alert("Successfully liked");
					    	   loadLikes(loadUserRelPanel);
					    		   //loadUserFeedPanel();   	   
					    	   
					       }	   
						}	
					};
					
					actionStr = "likeServ?recipeid=" + rid + "&userid=" + userid + "&status=like";
					xhttp.open("GET",actionStr,true);
					xhttp.send();
			   }
			   else
			   {
				   var xhttp = new XMLHttpRequest();
					xhttp.onreadystatechange = function(){
						
						if(this.readyState == 4 && this.status == 200)
						{
					       var res = this.responseText;
					       var jsonObj = JSON.parse(res);
					       if(jsonObj == "successful")
					       {
					    	   window.alert("Successfully disliked");
					    	   
					    	   loadLikes(loadUserRelPanel);
					    		   //loadUserFeedPanel();   
					    	   
					       }	   
						}	
					};
					
					actionStr = "likeServ?recipeid=" + rid + "&userid=" + userid + "&status=dislike";
					xhttp.open("GET",actionStr,true);
					xhttp.send();
			   }	   
			   
		   });
	   }	   

	//loadReleventPanelEnds
}

var likeRecipes = "";
var likeReviews = "";
var likeCts = "";

function loadUserLikes()
{
   var xhttp = new XMLHttpRequest();
   xhttp.onreadystatechange = function(){
	 
	   if(this.readyState == 4 && this.status == 200)
	   {
		   var res = this.responseText;
		   var jsonObj = JSON.parse(res);
		   
		   likeRecipes = jsonObj[0];
		   likeReviews = jsonObj[1];
		   likeCts = jsonObj[2];
		   
		   loadUserLikesPanel();
	   }	   
   };
   
   var actionStr = "loadUserLikesRecipes?userid=" + userid;
   xhttp.open("GET",actionStr,true);
   xhttp.send();
}

function loadPanels()
{
	   if(listFlag == "feed")
	   {
		   loadUserFeedPanel();
	   }
	   else if(listFlag == "rel")
	   {
		   loadUserRelPanel();
	   }
	   else if(listFlag == "likes")
	   {
		   loadUserLikes();
	   }	
	
}


function loadUserLikesPanel()
{
	   listFlag = "likes";
	   var cont = "<div id = 'feedHead'>My Likes</div>";
	   var len = likeRecipes.length;
	   if(len == 0)
	   {
		   cont = cont + "<div id = 'noFeed'>";
	   }
	   else
	   {
		   var i;
		   cont = cont + "<div id = 'recipeFeedList'>";
		   
		   for(i=0;i<len;i++)
		   {
			   cont = cont + unitRecipePanel(likeRecipes[i],likeReviews[i],likeCts[i]);
		   }	   
		   
		   cont = cont + "</div>";
	   }	   
		
	   //recipeListContainer
	   document.getElementById("recipeListContainer").innerHTML = cont;
	   ratingColorDistribute();
	   
	   //feed Actions
	   //recipeBackCard
	   //recipeDetails parent recipeFrontCard parent recipeCard
	   
	   var x = document.getElementsByClassName("recipeBackCard");
	   var y = document.getElementsByClassName("recipeDetails");
	   len = x.length;
	   for(i=0;i<len;i++)
	   {
		   x[i].style.display = "none";
		   y[i].addEventListener("click",function(event){
			  
			   var t = event.target.parentElement.parentElement.getElementsByClassName("recipeBackCard")[0];
			   var txt = event.target.innerText;
			   if(txt == "Details")
			   {
				   t.style.display = "block";
				   event.target.innerText = "Less";
			   }
			   else
			   {
				   t.style.display = "none";
				   event.target.innerText = "Details";
			   }	   
			   	   
			   
		   });
		   
	   }	   
	   
	   var z = document.getElementsByClassName("recipeLike");
	   len = z.length;
	   for(i=0;i<len;i++)
	   {
		   z[i].addEventListener("click",function(event){
			  
			   event.target.parentElement.parentElement.style.display = "none";
			   rid = event.target.parentElement.parentElement.getElementsByClassName("recipeId")[0].innerText;
			   txt = event.target.innerText;
			   if(txt == "Like")
			   {
				   var xhttp = new XMLHttpRequest();
					xhttp.onreadystatechange = function(){
						
						if(this.readyState == 4 && this.status == 200)
						{
					       var res = this.responseText;
					       var jsonObj = JSON.parse(res);
					       if(jsonObj == "successful")
					       {
					    	   window.alert("Successfully liked");
					           loadLikes(noFun);
					    		   //loadUserFeedPanel();   
					    	   
					       }	   
						}	
					};
					
					actionStr = "likeServ?recipeid=" + rid + "&userid=" + userid + "&status=like";
					xhttp.open("GET",actionStr,true);
					xhttp.send();
			   }
			   else
			   {
				   var xhttp = new XMLHttpRequest();
					xhttp.onreadystatechange = function(){
						
						if(this.readyState == 4 && this.status == 200)
						{
					       var res = this.responseText;
					       var jsonObj = JSON.parse(res);
					       if(jsonObj == "successful")
					       {
					    	   window.alert("Successfully disliked");
					    	
					    	   loadLikes(noFun);
					    	 //loadUserFeedPanel();   
					    	   
					       }	   
						}	
					};
					
					actionStr = "likeServ?recipeid=" + rid + "&userid=" + userid + "&status=dislike";
					xhttp.open("GET",actionStr,true);
					xhttp.send();
			   }	   
			   
		   });
	   }	   

	   //loadLikesPanelEnds
}

function inLikes(rid)
{
   var k = parseInt(rid);
   console.log("recipeid : " + k);
   var len = myLikes.length;
   
   if(len == 0)
   {
	  return false;
   }	   
   
   var i;
   var flag = false;
   for(i=0;i<len;i++)
   {
	   if(parseInt(myLikes[i].recipeid) == k)
	   {
		   flag = true;
		   break;
	   }	   
   }	   
   
console.log("result : " + flag);   
return flag;
}

//my content and album module

var myRecipes = "";
var myReviews = "";
var myCts = "";
var myAlbums = "";

function loadContentAndAlbum(fun1,fun2)
{
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function(){
		
		if(this.readyState == 4 && this.status == 200)
		{
			var res = this.responseText;
			var jsonObj = JSON.parse(res);
			
			myRecipes = jsonObj[0];
			myReviews = jsonObj[1];
			myCts = jsonObj[2];
			myAlbums = jsonObj[3];
			
			//call back is applied
			fun1();
			fun2();
		}	
	};
	
	var actionStr = "myContentAlbum?userid=" + userid;
	xhttp.open("GET",actionStr,true);
	xhttp.send();
}

function loadContentPanel()
{
	listFlag = "likes";
	   var cont = "<div id = 'feedHead'>My Content</div>";
	   var len = myRecipes.length;
	   if(len == 0)
	   {
		   cont = cont + "<div id = 'noFeed'>";
	   }
	   else
	   {
		   var i;
		   cont = cont + "<div id = 'recipeFeedList'>";
		   
		   for(i=0;i<len;i++)
		   {
			   cont = cont + unitRecipePanel(myRecipes[i],myReviews[i],myCts[i]);
		   }	   
		   
		   cont = cont + "</div>";
	   }	   
		
	   //recipeListContainer
	   document.getElementById("recipeListContainer").innerHTML = cont;
	   ratingColorDistribute();
	   
	   //feed action is still remained
}


function unitShortRecipePanel(recipe)
{
	var cont = "<div class = 'shortRecipe'>";
	cont = cont + "<div class = 'shortRecipeId'>" + recipe.recipeid + "</div>";
	cont = cont + "<div class = 'shortRecipeName'>" + recipe.title + "</div>";
	cont = cont + "<div class = 'shortRecipeRating'>Rating: " + recipe.rating + "</div>";
	cont = cont + "<div class = 'albumRemove'>remove</div>";
	cont = cont + "</div>";
	
return cont;	
}

function unitAlbumPanel(album)
{
	var cont = "<div class = 'album'>";
	cont = cont + "<div class = 'albumId'>" + album.albumid + "</div>";
	cont = cont + "<div class = 'albumName'>" + album.name + "</div>";
	cont = cont + "<div class = 'albumEdit'>Edit</div>";
	cont = cont + "<div class = 'albumOpen'>Open</div>";
	
	var ct = album.content;
	var recipeArr = ct.split(" ");
	var len = recipeArr.length;
	var i;
	
	for(i=0;i<len;i++)
	{
		cont = cont + unitShortRecipePanel(findUnitRecipe(recipeArr[i],myRecipes));
	}
	cont = cont + "</div>";
	
return cont; 	
}



function findUnitRecipe(rid,recipes)
{
	var len = recipes.length;
	var i;
	for(i=0;i<len;i++)
	{
		if(parseInt(recipes[i].recipeid) == parseInt(rid))
		{
			return recipes[i];
		}	
	}	
}

//loadContentAndAlbum(noFun,loadAlbumPanel)
function loadAlbumPanel()
{
	var cont = "<div id = 'albumHead'>My Album</div>";
	var len = myAlbums.length;
	if(len == 0)
	{
		cont = cont + "<div id = 'noAlbum'>No Album</div>";
	}
	else
	{
		var i;
		cont = cont + "<div id = 'albumList'>";
		for(i=0;i<len;i++)
		{
			cont = cont + unitAlbumPanel(myAlbums[i]); 
		}
		cont = cont + "</div>"; //album list closes
	}
	
	document.getElementById("myAlbumContainer").innerHTML = cont;
	//will print on some container
	
	var x = document.getElementsByClassName("shortRecipe");
	var z = document.getElementsByClassName("albumRemove");
	var len1 = x.length;
	var j;
	
	for(j=0;j<len1;j++)
	{
		x[j].style.display = "none";
		
		//remove action
		z[j].addEventListener("click",function(event){
			
			var len = event.target.parentElement.parentElement.getElementsByClassName("shortRecipe").length;
			var rid = event.target.parentElement.getElementsByClassName("shortRecipeId")[0].innerText;
			var aid = event.target.parentElement.parentElement.getElementsByClassName("albumId")[0].innerText;
			//window.alert("recipeid : " + rid + " of albumid : " + aid + " is being removed\r\n recipe count : " + len);
			var flag = false;
			if(parseInt(len) == 1)
			{
				var r = confirm("This is the last recipe of this album,\r\nIf you remove this, album will be deleted as well, proceed???");
				if(r == true)
				{
					flag = true;
				}	
			}
			else
			{
				flag = true;
			}	
			
			if(flag == true)
			{
				//loadContentAndAlbum(noFun,loadAlbumPanel)
				var xhttp = new XMLHttpRequest();
				xhttp.onreadystatechange = function(){
					
					if(this.readyState == 4 && this.status == 200)
					{
						var res = this.responseText;
						var jsonObj = JSON.parse(res);
						if(jsonObj == "successful")
						{
							window.alert("Removed Successfully");
							loadContentAndAlbum(noFun,loadAlbumPanel);
						}
						else
						{
							window.alert("Operation Failed");
						}	
					}	
				};
				
				var actionStr = "removeRecipeFromAlbum?recipeid=" + rid + "&albumid=" + aid + "&count=" + len + "&userid=" + userid;
				xhttp.open("GET",actionStr,true);
				xhttp.send();
				
			//flag if ends	
			}	
			
			
		});
		
	//loop ends	
	}	
	
	var y = document.getElementsByClassName("albumOpen");
	var w = document.getElementsByClassName("albumEdit");
	var len2 = y.length;
	for(j=0;j<len2;j++)
	{
		
		//open close action module
		y[j].addEventListener("click",function(event){
			
			var txt = event.target.innerText;
			var elt = event.target.parentElement;
			if(txt == "Open")
			{
				var x = elt.getElementsByClassName("shortRecipe");
				var k = x.length;
				var i;
				for(i=0;i<k;i++)
				{
					x[i].style.display = "block";
				}
				
				event.target.innerText = "Close";
				
			}	
			else
			{
				var x = elt.getElementsByClassName("shortRecipe");
				var k = x.length;
				var i;
				for(i=0;i<k;i++)
				{
					x[i].style.display = "none";
				}
				
				event.target.innerText = "Open";
			}	
			
		});
		//open close action module ends
		
		//edit module begins
		w[j].addEventListener("click",function(event){
			
			var act = "";
			var aid = event.target.parentElement.getElementsByClassName("albumId")[0].innerText;
			var aname = event.target.parentElement.getElementsByClassName("albumName")[0].innerText;
			var len = myAlbums.length;
			var i;
			for(i=0;i<len;i++)
			{
				if(parseInt(myAlbums[i].albumid) == parseInt(aid))
				{
					act = myAlbums[i].content;
					break;
				}	
			}	
				
			window.alert("Album edit is clicked\r\n albumid : " + aid + " and name : " + aname);
			editAlbumPanel(aid,aname,act,myRecipes);
		});
		
		
	}	
	
}

function editAlbumPanel(aid, aname, act, recipes) //album and myRecipes will be passed
{
	var len = recipes.length;
	var i;
   	//albumid name content
   	var cont = "<div class = 'albumEditPanel'>";
   	
   	if(aid != "empty")
   	{
   		cont = cont + "<div id = 'albumEditHead'>Edit Album</div>";
   	}
   	else
   	{
   		cont = cont + "<div id = 'albumEditHead'>Create Album</div>";
   	}	
   	
   	cont = cont + "<div id = 'editAlbumID'>" + aid + "</div>";
   	cont = cont + "<input type = 'text' id = 'editAlbumName' value = '" + aname + "' placeholder = 'Type Album Name'>";
   	cont = cont + "<div id = 'albumRecipeOptionList'>";
   	cont = cont + "<input type = 'text' id = 'recipeOptionSearch' placeholder = 'search recipe'/>";
   	for(i=0;i<len;i++)
   	{
   		cont = cont + "<div class = 'recipeOption'>";
   		cont = cont + "<div class = 'editRecipeId'>" + recipes[i].recipeid + "</div>";
   		cont = cont + "<input type = 'checkbox' class = 'editRecipeCheck' name = '" + recipes[i].title + "'>" + recipes[i].title + "</input>";
   	    cont = cont + "</div>"; //recipe option ends
   	}
   	
   	cont = cont + "</div>"; //list closes, not panel
   	cont = cont + "<button id = 'editAlbumOK'>Save</button><button id = 'editAlbumCancel'>Cancel</button></div>";
   	
   	document.getElementById("myAlbumContainer").innerHTML = cont;
   	
   	document.getElementById("recipeOptionSearch").addEventListener("keyup",function(event){
   		
   		var txt = event.target.value;
   		txt = txt.toLowerCase();
   		var x = document.getElementsByClassName("editRecipeCheck");
   		var len = x.length;
   		var i;
   		
   		if(txt == "")
   		{
   			for(i=0;i<len;i++)
   			{
   				x[i].parentElement.style.display = "block";
   			}	
   			
   		}
   		else
   		{
   			for(i=0;i<len;i++)
   			{
   			   var mtxt = x[i].name.toLowerCase();
   			   if(mtxt.indexOf(txt) != -1)
   			   {
   				   x[i].parentElement.style.display = "block";
   			   }
   			   else
   			   {
   				   x[i].parentElement.style.display = "none";
   			   }	   
   			   
   			}	
   			
   		}	
   		
   	});
   	
   	
   	//var x = document.getElementsByClassName("editRecipeCheck");
   	if(parseInt(aid) != 0)
   	{
   		var y = document.getElementsByClassName("editRecipeId");
   	   	len = y.length;
   	   	var alArr = act.split(" ");
   	   	var alLen = alArr.length;
   	   	var j;
   	   	for(i=0;i<len;i++)
   	   	{
   	   		for(j=0;j<alLen;j++)
   	   		{
   	   			if(parseInt(y[i].innerText) == parseInt(alArr[j]))
   	   			{
   	   				y[i].parentElement.getElementsByClassName("editRecipeCheck")[0].checked = true;
   	   				break;
   	   			}	
   	   		}	
   	   	}
   	}
   	
   	document.getElementById("editAlbumOK").addEventListener("click",function(){
   		
   		//albumContentCompare(contStr1, contStr2)
   		//1st make the selected Str
   		//editRecipeId
   		var x = document.getElementsByClassName("editRecipeCheck");
   		var len = x.length;
   		var i;
   		var str = "";
   		for(i=0;i<len;i++)
   		{
   		   if(x[i].checked)
   		   {
   			   var t = x[i].parentElement.getElementsByClassName("editRecipeId")[0].innerText;
   			   str = str + t + " ";
   		   }	   
   		}
   		
   		len = str.length;
   		str = str.substring(0,len-1);
   		//myAlbums
   		
   		var aname = document.getElementById("editAlbumName").value;
   		var aid = document.getElementById("editAlbumID").innerText;
   		
   		len = myAlbums.length;
   		for(i=0;i<len;i++)
   		{
   			var txt = myAlbums[i].content;
   			if(albumContentCompare(str, txt) == true && parseInt(aid) == parseInt(myAlbums[i].albumid) && myAlbums[i].name == aname)
   			{
   				window.alert("No Change Is Made");
   				return;
   			}	
   		}
   		
   		for(i=0;i<len;i++)
   		{
   			var txt = myAlbums[i].content;
   			if(albumContentCompare(str, txt) == true && parseInt(aid) != parseInt(myAlbums[i].albumid))
   			{
   				window.alert("Album Of Same Content Already Exists");
   				return;
   			}	
   		}	
   		
   		if(aname == "")
   		{
   			window.alert("Type Some Album Name");
   			return;
   		}
   		else
   		{
   			for(i=0;i<len;i++)
   			{
   				if(myAlbums[i].name == aname && parseInt(aid) != parseInt(myAlbums[i].albumid))
   				{
   					window.alert("Album Of Same Name Already Exists");
   					return;
   				}	
   			}	
   		}	
   		
   		var xhttp = new XMLHttpRequest();
   		xhttp.onreadystatechange = function(){
   			
   			if(this.readyState == 4 && this.status == 200)
   			{
   		      var res = this.responseText;
   		      var jsonObj = JSON.parse(res);
   		      if(jsonObj == "successful")
   		      {
   		    	window.alert("Edited Successfully");
   		   		loadContentAndAlbum(noFun,loadAlbumPanel);
   		      }
   		      else
   		      {
   		    	  window.alert("Operation failed");
   		      } 	  
   			}	
   		};
   		
   		//var aid = document.getElementById("editAlbumID").innerText;
   		var actionStr = "editUserAlbum?userid=" + userid + "&albumid=" + aid + "&content=" + str + "&albumname=" + aname;
   		xhttp.open("GET",actionStr,true);
   		xhttp.send();
   		
   	});
   	
   	document.getElementById("editAlbumCancel").addEventListener("click",function(){
   		
   		loadAlbumPanel();
   	});
   	
   	var z = document.getElementsByClassName("editRecipeCheck");
   	var zLen = z.length;
   	var j;
   	//editRecipeId from parentElement
   	for(j=0;j<zLen;j++)
   	{
   		z[j].addEventListener("click",function(event){
   			
   			var txt = event.target.parentElement.getElementsByClassName("editRecipeId")[0].innerText;
   			if(event.target.checked == false)
   			{
     			//uncheck validation
     			var x = document.getElementsByClassName("editRecipeCheck");
     			var i;
     			var len = x.length;
     			var flag = false;
     			for(i=0;i<len;i++)
     			{
     				if(x[i].checked == true)
     				{
     					flag = true;
     					break;
     				}	
     			}
     			
     			if(flag == false)
     			{
     				window.alert("Cant Leave a Album Empty");
     				event.target.checked = true;
     			}	
   			}	
   			
   		});
   	}	
}

function albumContentCompare(contStr1, contStr2)
{
	var tempStr1 = contStr1.trim();
	var tempStr2 = contStr2.trim();
	
	var arr1 = tempStr1.split(" ");
	var arr2 = tempStr2.split(" ");
	
	if(arr1.length != arr2.length)
	{
		return false;
	}
	
	var count = 0;
	var i,j;
	var len = arr1.length;
	//since each array consists of all distinct elts
	for(i=0;i<len;i++)
	{
		for(j=0;j<len;j++)
		{
			if(parseInt(arr1[i]) == parseInt(arr2[j]))
			{
				count = count + 1;
			}	
		}	
	}
	
	if(count == len)
	{
		return true;
	}	
	
return false;	
}

function noFun()
{
	console.log("nofunc called");
}

var myLikes = "";
function loadLikes(fun)
{
	//window.alert("load likes called");
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function(){
		
		if(this.readyState == 4 && this.status == 200)
		{
			var res = this.responseText;
			var jsonObj = JSON.parse(res);
			myLikes = jsonObj;
			//window.alert("likes count: " + myLikes.length);
			fun();
		}	
	};
	
	var actionStr = "loadUserLikes?userid=" + userid;
	xhttp.open("GET",actionStr,true);
	xhttp.send();
}

function adjustName(txt)
{
   if(txt.length > 50)
   {
	   txt = txt.substring(0,40) + "...";
   }	   
	
return txt;   
}

function ratingColorDistribute()
{
	  var x = document.getElementById("recipeFeedList").getElementsByClassName("recipeRating");
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

function unitRecipePanel(recipe,review,ct)
{
	var oneC = parseInt(review.oneCount);
	var twoC = parseInt(review.twoCount);
	var threeC = parseInt(review.threeCount);
	var fourC = parseInt(review.fourCount);
	var fiveC = parseInt(review.fiveCount);
	
	//recipeCard recipeInnerCard recipeFrontCard recipeBackCard
	
   var cont = "<div class = 'recipeCard'>";
   
   cont = cont + "<div class = 'recipeFrontCard'>";
   cont = cont + "<div class = 'recipeId'>" + recipe.recipeid + "</div>";
   cont = cont + "<a class = 'recipeName' href='showRecipe.jsp?recipeid=" + recipe.recipeid + "&userid=" + userid + "'>" + adjustName(recipe.title) + "</a>";
   
   if(parseInt(userid) == parseInt(recipe.userid))
   {
	  cont = cont + "<div class = 'writerName'>By Me</div>";
   }
   else
   {
	   cont = cont + "<br/><a class = 'writerName' href='profile.jsp?userid=" + recipe.userid + "'>By: " + ct.username + "</a><br/><br/>";
   }	   
   
   cont = cont + "<div class = 'recipeDate'>" + dateFormatChange(recipe.date) + "</div>";
   cont = cont + "<div class = 'recipeViews'>Views : " + recipe.views + "</div>";
   
   if(parseInt(userid) != parseInt(recipe.userid))
   {
	   if(inLikes(recipe.recipeid))
	   {
		   cont = cont + "<div class = 'recipeLike'>Liked</div>";
	   }
	   else
	   {
		   cont = cont + "<div class = 'recipeLike'>Like</div>";
	   }	   
   }	   
   
   cont = cont + "<div class = 'recipeDetails'>Details</div>";
   
   if(parseInt(userid) == parseInt(recipe.userid))
   {
	   cont = cont + "<div class = 'recipeEdit'>Edit</div>";
	   cont = cont + "<div class = 'recipeDelete'>Delete</div>";
   }	   
   
   cont = cont + "<div class = 'recipeRating'>" + recipe.rating + "</div>";
   cont = cont + "</div>"; // front card ends
   
   cont = cont + "<div class = 'recipeBackCard'>";
   //title diet choice type descrip
   cont = cont + "<a class = 'recipeLink' href='showRecipe.jsp?recipeid=" + recipe.recipeid + "&userid=" + userid + "'>" + recipe.title + "</a>";
   cont = cont + "<div class = 'recipeDiet'>" + getUnitDiet(recipe.diet) + "</div>";
   cont = cont + "<div class = 'recipeChoice'>" + ct.choiceStr + "</div>";
   cont = cont + "<div class = 'recipeType'>" + ct.typeStr + "</div>";
   cont = cont + "<div class = 'recipeDescrip'>" + recipe.descrip + "</div>";
   cont = cont + generateRatingCountBar(oneC,twoC,threeC,fourC,fiveC);
   cont = cont + generateReview(review.cmtCount);
   
   cont = cont + "</div>"; // back card ends
   
   cont = cont + "</div>"; //card closes
	
return cont;   
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
 


</script>


</body>
</html>