<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Custom Search</title>

<style>

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


    .writerName,.recipeDate,.recipeViews,.recipeLike,.recipeDetails,.recipeEdit,.recipeDelete,.recipeSim
    {
       margin-left: 20px;
       font-weight: bold;
    }
 
    .writerName
    {
    	margin-top: 10px;
    	margin-bottom: 10px;
    }
    
    .recipeDate,.recipeViews,.recipeLike,.recipeDetails,.recipeEdit,.recipeDelete,.recipeSim
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

/*search list module*/

#searchListContainer
{
   position: absolute;
   left: 380px;
   top: 15px;
   height: 100px;
   width: 1100px;
   background-color: #85C1E9;
}

#ingredListContainer
{
   position: absolute;
   top: 80px;
   left: 370px;
   background-color: #F9E79F;
   height: 400px;
   width: 200px;
   overflow: auto;
   box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}

#ingredSelect,#typeSelect,#choiceSelect,#descripSelect,#yearSelect,#sortSelect
{
   height: 40px;
   width: 180px;
   margin-top: 20px;
   font-size: 20px;
   font-family: "Times New Roman";
}

#descripSelect,#yearSelect,#sortSelect
{
   width: 128px;
}

#searchApply
{
  height: 40px;
  width: 150px;
  background-color: dodgerblue;
  color: white;
  /*display: inline;*/
  margin-left: 10px;
  border-radius: 5px;
  font-size: 20px;
  font-family: "Times New Roman";
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  border-style: none;
}

#searchApply:hover
{
  /*background-color:*/ 
  box-shadow: inset 0px 8px 16px 0px rgba(0,0,0,0.2);  
}

.inCon,#inTxt
{
  /*inOp*/
  border-style: solid;
  border-width: 1px;
  margin-top: 2px;
  padding: 5px 5px;
}

#inTxt
{
   position: sticky;
   top: 0;
   height: 32px;
   text-align: center;
   font-family: "Times New Roman";
   font-size: 15px;
   width: 170px;
   border-radius: 5px;
}

#inTxt:focus
{
  box-shadow: inset 0px 8px 16px 0px rgba(0,0,0,0.2);
}

.inCon:hover
{
  background-color: #F4D03F; 
}

#msg
{
   font-size: 13px;
   font-weight: bold;
   color: red;
}

</style>


</head>
<body onload = "initiate()">

<div id = 'searchListContainer'>Search Key Panel will be printed here also sort selectpen will be there</div>
<div id = 'recipeListContainer'>Recipe List will be printed here</div>
<div id = 'ingredListContainer'>ingred list will be loaded here</div>

<script>

var userid =<%= request.getParameter("userid") %>;
var query =<%= request.getParameter("query") %>;
window.alert("userid : " + userid + " and query : " + query);

//window.alert(outStr)



function initiate()
{
   loadSearchList();
   
   loadRecipeList();
}

function autoFillSearchList()
{
	var resArr = decriptQuery(query);
	var len = 0;
	var i;
	var j;
	var x = "";

	//in ch ty desc yr sort status
		
    var inQ = resArr[0];
	var chQ = resArr[1];
	var tyQ = resArr[2];
	var descQ = resArr[3]
	var yrQ = resArr[4];
	var srtQ = resArr[5];
	var stQ = resArr[6];
	
	if(stQ.trim() == "query")
	{
		//ingreds are marked
	/*	if(inQ.trim() != "0")
		{
		    console.log("inQ : " + inQ);
			x = document.getElementsByClassName("inOP");
			len = x.length;
			var y = inQ.split(" ");
			var lenY = y.length;
			console.log("Len y : " + lenY + " and len x : " + len);
			for(j=0;j<lenY;j++)
			{
				for(i=0;i<len;i++)
				{
					var p = x[i].parentElement.getElementsByClassName("inId")[0].innerText;
					console.log("p : " + p + " and y : " + y[j]);
					if(parseInt(p.trim()) == parseInt(y[j].trim()))
					{
						x[i].checked = true;
					}	
				}	
			}
		}
	//}*/	
		
		//choice
		if(chQ.trim() != "1")
		{
			x = document.getElementsByClassName("chOp");
			len = x.length;
			for(i=0;i<len;i++)
			{
				var t = x[i].value;
				if(parseInt(t.trim()) == parseInt(chQ.trim()))
				{
					x[i].selected = true;
					break;
				}	
			}
		}	
		
		//type
		if(tyQ.trim() != "0")
		{
			x = document.getElementsByClassName("tyOp");
			len = x.length;
			for(i=0;i<len;i++)
			{
				var t = x[i].value;
				if(parseInt(t.trim()) == parseInt(tyQ.trim()))
				{
					x[i].selected = true;
					break;
				}	
			}
		}	
		
		//desc
		x = document.getElementsByClassName("descOp");
		len = x.length;
		for(i=0;i<len;i++)
		{
			var t = x[i].value;
			if(t.trim() == descQ.trim())
			{
				x[i].selected = true;
				break;
			}	
		}
		
		//year
		x = document.getElementsByClassName("yrOp");
		len = x.length;
		for(i=0;i<len;i++)
		{
			var t = x[i].value;
			if(parseInt(t.trim()) == parseInt(yrQ.trim()))
			{
				x[i].selected = true;
				break;
			}	
		}
		
	   //sort
		x = document.getElementsByClassName("sortOp");
		len = x.length;
		for(i=0;i<len;i++)
		{
			var t = x[i].value;
			if(t.trim() == srtQ.trim())
			{
				x[i].selected = true;
				break;
			}	
		}
		
	//if query ends	
	}	
   	
}

var ingreds = "";
var choices = "";
var types = "";

function loadSearchList()
{
   var xhttp = new XMLHttpRequest();
   xhttp.onreadystatechange = function(){
	 
	   if(this.readyState == 4 && this.status == 200)
	   {
		   var res = this.responseText;
		   var jsonObj = JSON.parse(res);
		   ingreds = jsonObj[0];
		   choices = jsonObj[1];
		   types = jsonObj[2];
		   
		   loadSearchListPanel(autoFillSearchList);
	   }	   
   };
   
   var actionStr = "loadCusSearch";
   xhttp.open("GET",actionStr,true);
   xhttp.send();
}

function loadSearchListPanel(f)
{
   //ingredlist : multi select : check box
   //choicelist : select
   //type : select
   //descrip : select
   //sortType : select
   
   var cont = "<div id = 'searchPanel'>";
   
   //ingred module
   cont = cont + "<button id = 'ingredSelect'>ingredients(0)</button>";
   
   cont = cont + choiceListPanel();
   
   cont = cont + typeListPanel();
   
   cont = cont + "<select id = 'descripSelect'>";
   cont = cont + "<option class = 'descOp' value = 'None'>None</option>";
   cont = cont + "<option class = 'descOp' value = 'Veg'>Veg</option>";
   cont = cont + "<option class = 'descOp' value = 'NonVeg'>NonVeg</option>";
   cont = cont + "</select>";
   
   cont = cont + yearListPanel();
   cont = cont + "<select id = 'sortSelect'>";
   cont = cont + "<option class = 'sortOp' value = 'date'>ByDate</option>";
   cont = cont + "<option class = 'sortOp' value = 'views'>ByViews</option>";
   cont = cont + "<option class = 'sortOp' value = 'rating'>ByRating</option>";
   cont = cont + "<option class = 'sortOp' value = 'diet'>ByDiet</option>";
   cont = cont + "<option class = 'sortOp' value = 'name'>ByName</option>";
   cont = cont + "<option class = 'sortOp' value = 'per'>ByPercent</option>";
   cont = cont + "</select>";
   
   cont = cont + "<button id = 'searchApply'>Apply</button>";
   cont = cont + "</div>";
   document.getElementById("searchListContainer").innerHTML = cont;
   
   document.getElementsByClassName("sortOp")[5].style.display = "none";
   
   loadIngredListPanel();
   //callback called
   f();
   
   //action
   document.getElementById("searchApply").addEventListener("click",function(){
	
	   var x = document.getElementsByClassName("inOp");
	   var len = x.length;
	   var i;
	   var ingredQuery = "";
	   for(i=0;i<len;i++)
	   {
		   if(x[i].checked)
		   {
			   ingredQuery = ingredQuery + x[i].parentElement.getElementsByClassName("inId")[0].innerText + " ";
		   }	   
	   }	   
	   
	   ingredQuery = ingredQuery.trim();
	   if(ingredQuery == "")
	   {
		  ingredQuery = "0";   
	   }
	   
	   //there should be a level of query validation
	   var choiceQuery = document.getElementById("choiceSelect").value;
	   var typeQuery = document.getElementById("typeSelect").value;
	   var descripQuery = document.getElementById("descripSelect").value;
	   var yearQuery = document.getElementById("yearSelect").value;
	   var sortQuery = document.getElementById("sortSelect").value;
	   var statusQuery = "query";
	   
	   query = generateQuery(ingredQuery,choiceQuery,typeQuery,descripQuery,yearQuery,sortQuery,statusQuery);
	   
	   var showMsg = "ingredQuery: " + ingredQuery + "\r\n";
	   showMsg = showMsg + "choiceQuery: " + choiceQuery + "\r\n";
	   showMsg = showMsg + "typeQuery: " + typeQuery + "\r\n";
	   showMsg = showMsg + "descripQuery: " + descripQuery + "\r\n";
	   showMsg = showMsg + "yearQuery: " + yearQuery + "\r\n";
	   showMsg = showMsg + "sortQuery: " + sortQuery + "\r\n";
	   
	   window.alert("Query : \r\n" + showMsg);
	   
	   loadRecipeList();
   });
   
   document.getElementById("ingredSelect").addEventListener("click",function(event){
	   
	   //document.getElementById("ingredListContainer")
	   var x = document.getElementsByClassName("inOp");
	   var len = x.length;
	   var i;
	   
	   if(document.getElementById("ingredListContainer").style.display == "block")
	   {
		   var count = 0;
		   for(i=0;i<len;i++)
		   {
			   if(x[i].checked)
			   {
				   count++;
			   }	   
		   }
		   
		   event.target.innerText = "ingredients(" + count + ")";
		   document.getElementById("ingredListContainer").style.display = "none";
	   }
	   else
	   {
		   document.getElementById("ingredListContainer").style.display = "block";
	   }	   
	   
	   
   });
   
   
}

function generateQuery(ingredQuery,choiceQuery,typeQuery,descripQuery,yearQuery,sortQuery,statusQuery)
{
	
	var tempQuery = "'ingred:" + ingredQuery;
	tempQuery = tempQuery + "Rchoice:" + choiceQuery;
	tempQuery = tempQuery + "Rtype:" + typeQuery;
	tempQuery = tempQuery + "Rdescrip:" + descripQuery;
	tempQuery = tempQuery + "Ryear:" + yearQuery;
	tempQuery = tempQuery + "Rsort:" + sortQuery;
	tempQuery = tempQuery + "Rstatus:"+ statusQuery;

	//in ch ty desc yr sort status
	return tempQuery;	
}

function decriptQuery(tempQuery)
{
   var qArr = tempQuery.split("R");
   var retArr = [];
   var i;
   var len = qArr.length;
   for(i=0;i<len;i++)
   {
	   var t = qArr[i].trim().split(":")[1].trim();
	   retArr.push(t);
   }
   
return retArr;	
}

function typeListPanel()
{
   var len = choices.length;
   var i;
   var cont = "<select id = 'typeSelect'>";
   cont = cont + "<option value = '0'>All</option>";
   for(i=0;i<len;i++)
   {
	  cont = cont + "<option class = 'tyOp' value = '" + types[i].typeid + "'>" + types[i].name + "</option>"; 
   }
   
   cont = cont + "</select>";
   
   return cont;	
}

function choiceListPanel()
{
   var len = choices.length;
   var i;
   var cont = "<select id = 'choiceSelect'>";
   for(i=0;i<len;i++)
   {
	  cont = cont + "<option class = 'chOp' value = '" + choices[i].choiceid + "'>" + choices[i].name + "</option>"; 
   }
   
   cont = cont + "</select>";
   return cont;	
}

function loadIngredListPanel()
{
  var len = ingreds.length;
  var i;
  var cont = "<div id = 'inList'>";
  cont = cont + "<p id = 'msg'>*Type 'select' to view selected</p>";
  cont = cont + "<input type = 'text' id = 'inTxt' placeholder = 'Type Here'/>";
  for(i=0;i<len;i++)
  {
	  cont = cont + "<div class = 'inCon'>";
	  cont = cont + "<div class = 'inId'>" + ingreds[i].ingredid + "</div>";
	  cont = cont + "<input type = 'checkbox' class = 'inOp' name = '" + ingreds[i].name + "'>" + ingreds[i].name + "</input>";
	  cont = cont + "</div>"; //inCon closes
  }	  
  
  cont = cont + "</div>"; //inList closes
  document.getElementById("ingredListContainer").innerHTML = cont;
  document.getElementById("ingredListContainer").style.display = "none";
  
    var resArr = decriptQuery(query);
	//in ch ty desc yr sort status
		
    var inQ = resArr[0];
	var stQ = resArr[6];
	
	if(stQ.trim() == "query")
	{
		//ingreds are marked
		if(inQ.trim() != "0")
		{
		    console.log("inQ : " + inQ);
			var x = document.getElementsByClassName("inOp");
			var j;
			len = x.length;
			var y = inQ.split(" ");
			var lenY = y.length;
			
			document.getElementById("ingredSelect").innerText = "ingredients(" + lenY + ")";
			
			console.log("Len y : " + lenY + " and len x : " + len);
			for(j=0;j<lenY;j++)
			{
				for(i=0;i<len;i++)
				{
					var p = x[i].parentElement.getElementsByClassName("inId")[0].innerText;
					console.log("p : " + p + " and y : " + y[j]);
					if(parseInt(p.trim()) == parseInt(y[j].trim()))
					{
						x[i].checked = true;
					}	
				}	
			}
		}
	}	

  //document.getElementsByClassName("sortOp")[5].style.display = "none";
  //actions
  var y = document.getElementsByClassName("inOp");
  var lenY = y.length;
  for(i=0;i<lenY;i++) 
  {
	  y[i].addEventListener("click",function(event){
		  
		  var x = document.getElementsByClassName("inOp");
		  var len = x.length;
		  var i;
		  var flag = false;
		  for(i=0;i<len;i++)
		  {
			  if(x[i].checked)
			  {
				  flag = true;
				  break;
			  }	  
		  }
		  
		  if(flag == true)
		  {
			  document.getElementsByClassName("sortOp")[5].style.display = "block";
		  }
		  else
		  {
			  document.getElementsByClassName("sortOp")[5].style.display = "none";
		  }	  
		  
	  });
  }	  
  
  
  document.getElementById("inTxt").addEventListener("keyup",function(event){
	 
	  var txt = event.target.value;
	  txt = txt.toLowerCase();
	  var x = document.getElementsByClassName("inOp");
	  var len = x.length;
	  var i;
	  
	  if(txt == "")
	  {
		  for(i=0;i<len;i++)
		  {
			  x[i].parentElement.style.display = "block";
		  }	  
	  }
	  else if(txt == "select")
      {
		  var flag = false;
		  for(i=0;i<len;i++)
		  {
			  if(x[i].checked)
			  {
				  flag = true;
				  x[i].parentElement.style.display = "block";
			  }
			  else
			  {
				  x[i].parentElement.style.display = "none";
			  }	  
		  }
		  
		  if(flag == false)
		  {
			  window.alert("Nothing Selected");
		  }	  
      }
	  else
	  {
		  for(i=0;i<len;i++)
		  {
			  var t = x[i].name.toLowerCase();
			  if(t.indexOf(txt) != -1)
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
  
}

//inList typeSelect choiceSelect descripSelect yearSelect
function yearListPanel()
{
   var d = new Date();
   var endYr = parseInt(d.getFullYear());
   var stYr = parseInt(2020);
   var i;
   var cont = "<select id = 'yearSelect'>";
   for(i=endYr;stYr<=i;i--)
   {
	   cont = cont + "<option class = 'yrOp' value = '" + i + "'>" + i + "</option>";
   }
   cont = cont + "</select>";
   return cont;
}

var myLikes = ""; 
var cusRecipes = "";
var cusReviews = "";
var cusCts = "";
var today = "";
var yesterday = "";
var myPers = "";

function loadRecipeList()
{
   var xhttp = new XMLHttpRequest();
   xhttp.onreadystatechange = function(){
	 
	   if(this.readyState == 4 && this.status == 200)
	   {
		   var res = this.responseText;
		   var jsonObj = JSON.parse(res);
		   cusRecipes = jsonObj[0];
		   cusReviews = jsonObj[1];
		   cusCts = jsonObj[2];
		   myLikes = jsonObj[3];
		   
		   if(decriptQuery(query)[6] == "query" && decriptQuery(query)[0] != "0")
		   {
			   myPers = jsonObj[4];
		   }	   
		   
		   loadRecipeListPanel();
	   }	   
   };
   
   var actionStr = "loadCusContent?userid=" + userid + "&query=" + query;
   xhttp.open("GET",actionStr,true);
   xhttp.send();
}

function findSimilarRecipe(rid)
{
   var len = myPers.length;
   var i;
   for(i=0;i<len;i++)
   {
	   if(parseInt(myPers[i].recipeid) == parseInt(rid))
	   {
		   return myPers[i];
	   }	   
   }	   
}
 
function loadRecipeListPanel()
{
	   //listFlag = "rel";
	   var heading = decriptQuery(query)[6];		   
	   var cont = "<div id = 'feedHead'>" + heading + "</div>";
	   var len = cusRecipes.length;
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
			   cont = cont + unitRecipePanel(cusRecipes[i],cusReviews[i],cusCts[i]);
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
					    	   event.target.innerText = "Liked";
					    	   //loadLikes(loadUserRelPanel);
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
					    	   event.target.innerText = "Like";
					    	   //loadLikes(loadUserRelPanel);
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
 
 function noFun()
 {
 	console.log("nofunc called");
 }

 //userlike should be loaded with the content load
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
   
   if(decriptQuery(query)[6] == "query" && decriptQuery(query)[0] != "0")
   {
	   //findSimilarRecipe(rid)
	   cont = cont + "<div class = 'recipeSim'>Similarity: " + findSimilarRecipe(recipe.recipeid).per + "%</div>"; 
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