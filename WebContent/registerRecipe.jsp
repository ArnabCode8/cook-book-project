<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Recipe Page</title>
<style>

body
{
  background-color: #5D9051;
}


#selectedIngreds,#selectedChoices,#selectedTypes,#selectedDescrip,#selectedDiet
{
   position: absolute;
   background-color: #ECDCD7;
   color: black;
   font-size: 20px;
   border-style: solid;
   padding: 10px 15px;
   text-align: left;
   height: 30px;
   width: 750px;
   left: 500px;
   top: 20px;
   border-radius: 15px;
   overflow-x: auto;
   overflow-y: hidden;

}

#selectedChoices
{
  position: absolute;
  top: 75px;
  background-color: #CCBFBA;
  cursor: pointer;
}

#selectedIngreds
{
	cursor: pointer;
}

#selectedTypes
{ 
  position: absolute;
  top: 130px;
  cursor: pointer;
}

#selectedDescrip
{
  position: absolute;
  top: 185px;
  background-color: #CCBFBA;
  width: 900px;
}

#selectedDiet
{
  position: absolute;
  top: 240px;
  width: 900px;
}

#recipeText
{
  position: absolute;
  top: 350px;
  left: 500px;
  height: 600px;
  width: 930px;
  background-color: #F2E9E6;
  color: black;
  font-size: 20px;
  border-radius: 20px;
  overflow: scroll;
}

#recipeTitle
{
  position: absolute;
  text-align: center;
  top: 300px;
  left: 500px;
  height: 40px;
  width: 930px;
  background-color: #F2E9E6;
  color: black;
  font-size: 20px;
  border-radius: 20px;
  overflow: scroll;
}


#selectIngred,#selectChoice,#selectType,#selectDescrip,#selectDiet
{
   position: absolute;
   height: 54px;
   width: 150px;
   background-color: #E15D2E;
   color: black;
   border-style: solid;
   border-radius: 15px;
   padding: 10px 15px;
   left: 1200px;
   font-weight: bold;
   font-family: "Times New Roman", Times, serif;
   font-size: 15px;
   font-style: italic;
   transition: 0.3s;
}

#selectAllIngreds,#selectAllChoices
{
   background-color: #F9E79F;
   color: black;
   border-style: solid;
   border-radius: 15px;
   padding: 10px 15px;
   left: 1290px;
   font-weight: bold;
   font-family: "Times New Roman", Times, serif;
   font-size: 15px;
   font-style: italic;
   height: 40px;
   width: 280px;
}

#selectAllIngreds:hover,#selectAllChoices:hover
{
   background-color: #F8C471;
}


#ingredOk,#ingredMarked,#choiceOk,#choiceMarked,#typeOk
{
   margin-left: 5px;
   background-color: #F5B7B1;
   color: black;
   border-style: solid;
   border-radius: 15px;
   padding: 10px 15px;
   font-weight: bold;
   font-family: "Times New Roman", Times, serif;
   font-size: 15px;
   font-style: italic;
   height: 40px;
   width: 140px;
}

#ingredOk:hover,#ingredMarked:hover,#choiceOk:hover,#choiceMarked:hover,#typeOk:hover
{
   background-color: #D2B4DE;
   cursor: pointer;
}

#ingredList,#choiceList,#typeList
{
   position: absolute;
   top: 20px;
   height: 880px;
   width: 300px;
   left: 1450px;
   background-color: white;
   border-style: solid;
   border-radius: 15px;
}

#inList,#chList,#tylist
{
   height: 640px;
   overflow: scroll;
}

#inUp,#chUp,#itemUp
{
  background-color: #F7DC6F;
  border-radius: 20px;
}

#inUp:hover,#chUp:hover,#itemUp:hover
{
   background-color: #D68910;
}

#selectIngred:hover,#selectChoice:hover,#selectType:hover,#selectDescrip:hover,#selectDiet:hover
{
   left: 1240px;
   background-color: #2EB3E1;
   width: 200px;
}

#selectIngred
{
   top: 20px;
}

#selectChoice
{
   top: 75px;
}

#selectType
{
   top: 130px;
}

#selectDescrip
{
   top: 185px;
}

#selectDiet
{
   top: 240px;
}

.inCon,.chCon,.tyCon
{
  height: 50px;
  text-align: left;
  font-weight: bold;
  font-family: "Times New Roman", Times, serif;
  font-size: 20px;
  padding: 2px 20px;
  background-color: #E9F7EF;
  border-radius: 20px;
  transition: 0.3s;
}

.inCon:hover,.chCon:hover,.tyCon:hover
{
   font-size: 30px;
   background-color: #D4E6F1;
   height: 70px;
}

#ingredSearch,#choiceSearch
{
  height: 40px;
  width: 270px;
  text-align: left;
  font-family: "Times New Roman", Times, serif;
  font-size: 20px;
  border-radius: 15px;
  border-style: inset; 

}

.second
{
   color: black;
   font-weight: bold;
   background-color: #F7DC6F;
}

.diet
{
   height: 35px;
   width: 130px;
   margin-left :5px;
   font-size: 15px;
   border-radius: 10px;
   transition: 0.3s;
   font-weight: bold;
}

.diet:hover
{
   box-shadow: 2px 2px 8px 5px #888888;
}

.desc
{
   margin-left :5px;
   height: 35px;
   width: 220px;
   font-size: 15px;
   border-radius: 10px;
   transition: 0.3s;
}

.desc:hover
{
  font-size: 20px;
  box-shadow: 2px 2px 8px 5px #888888;
}

#dietText,#descText
{
   height: 50px;
   background-color: #79FE99;
   width: 300px;
   font-size: 28px;
   font-weight: bold;
   margin-left :10px;
   padding: 5px 10px;
   
}

#savedContainer
{
   background-color: white;
   color: black;
   height: 500px;
   width: 300px;
   position: absolute;
   left: 800px;
   top: 100px;
}

#items
{
   height: 450px;
   width: 300px;
   overflow: auto;
   background-color: #0B602F;
}


#chCut,#tyCut,#inCut
{
   margin-left: 278px;
   background-color: red;
   border-radius: 5px;
}

#itemListTitle
{
   text-align: center;
   font-weight: bold;
}


.itemCut
{ 
   color: white;
   height: 30px;
   width: 30px;
   margin-left: 25px;
   background-color: #1E8449;
   border-radius: 10px;
   transition: 0.3s;
}

.itemCut:hover
{
   font-size: 20px;
   font-weight: bold;
}

#chCut:hover,#tyCut:hover,#inCut:hover
{
   cursor: pointer;
}

.itemName
{
   margin-left: 0px;
}

.item
{
   width: 250px;
   text-align: center;
   margin-left: 5px;
   margin-right: 5px;
   padding: 10px 10px;
   background-color: #DAF7A6;
   border-radius: 10px;
   font-size: 20px;
   transition: 0.2s;
}

.item:hover
{
	font-size: 25px;
}

#submitRecipe
{
	position: absolute;
	left: 20px;
	top: 830px;
	height: 70px;
	width: 450px;
	background-color: #154360;
	color: white;
	font-size: 20px;
	text-align: center;
	padding: 10px 10px;
	font-family: "Times New Roman";
	border-radius: 15px;
	transition: 0.2s;
}

#submitRecipe:hover
{
	background-color: #6DB1DE;
	color: black;
	font-size: 25px;
	font-weight: bold;
}


</style>


</head>
<body onload = "loadAll()">

<div>
<button id = "selectIngred">Ingredients</button>
<button id = "selectChoice">Choices</button>
<button id = "selectType">Types</button>
</div>


<div id = "selectedIngreds">Ingredients : Empty</div>
<div id = "selectedChoices">Choices : Empty</div>
<div id = "selectedTypes">Types : Empty</div>
<div id = "selectedDescrip"></div>
<div id = "selectedDiet"></div>
<input type = "text" id = "recipeTitle" placeholder="Enter Recipe Title Here"></input>
<textarea id = "recipeText" rows="5" cols="50">recipe text will be entered here</textarea>

<div id = "ingredList">ingred list will be printed here</div>
<div id = "choiceList">Choice list will be printed here</div>
<div id = "typeList">Type list will be printed here</div>

<div id = "savedContainer">saved container will be printed here</div>

<button id = "submitRecipe">SUBMIT</button>

<script>

var allIngreds = "";
var allChoices = "";
var allTypes = "";
var userid = "1";


function loadAll()
{
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function(){
		 
		   if(this.readyState == 4 && this.status == 200)
		   {
			   var result = this.responseText;
			   var jsonObj = JSON.parse(result);
			   
			   window.alert("Ingreds,Choices,Types are loaded");
			   allIngreds = jsonObj[0];
			   allChoices = jsonObj[1];
			   allTypes = jsonObj[2];
			   
			   prepareAllPanels();
			   	   
		   }	   
	   };
	   
	   var actionstr = "loadall";
	   xhttp.open("GET",actionstr,true);
	   xhttp.send();
}


function prepareAllPanels()
{
	
	document.getElementById("savedContainer").style.display = "none";
	prepareIngredPanel();
	prepareChoicePanel()
	prepareDietPanel();
	prepareDescripPanel();
	prepareTypePanel();
	
	
	document.getElementById("submitRecipe").addEventListener("click",function(){
		
		var ingredsTxt = document.getElementById("selectedIngreds").innerText;
		var choicesTxt = document.getElementById("selectedChoices").innerText;
		var typesTxt = document.getElementById("selectedTypes").innerText;
		var descripTxt = document.getElementById("descText").innerText;
		var dietTxt = document.getElementById("dietText").innerText;
		
		if(ingredsTxt == "Ingredients : Empty")
		{
			window.alert("You Left Ingredients Empty");
		}
		else if(choicesTxt == "Choices : Empty")
		{
			window.alert("You Left Choices Empty");
		}
		else if(typesTxt == "Types : Empty")
		{
			window.alert("You Left Types Empty");
		}
		else if(descripTxt == "Empty")
		{
			window.alert("You Left Desctiption Empty");
		}
		else if(dietTxt == "Empty")
		{
			window.alert("You Left Diet Empty");
		}	
		else
		{
			window.alert("ingreds: " + ingredsTxt + " choices: " + choicesTxt + " types: " + typesTxt + " descrip: " + descripTxt + " diet: " + dietTxt);
			
			
			var ingredArr = ingredsTxt.split(",");
			var choiceArr = choicesTxt.split(",");
			var typeArr = typesTxt.split(",");
			
			
			var ingredStr = "";
			var choiceStr = "";
			var typeStr = "";
			var dietStr = getUnitDiet(dietTxt);
			var descStr = descripTxt;
			var recipeTitleStr = document.getElementById("recipeTitle").value;
			var recipeStr = document.getElementById("recipeText").value;
			
			window.alert("Title: " + recipeTitleStr + " recipeText: " + recipeStr);
			
			if(recipeTitleStr == "")
			{
				window.alert("Give Your Recipe A Name");
			}
			else if(recipeStr == "")
			{
				window.alert("What is all for, if there is NO RECIPE");
			}
			else
			{
				var i;
				var len = ingredArr.length;
				
				for(i=0;i<len;i++)
				{
					ingredStr = ingredStr + getUnitIngred(ingredArr[i]) + " ";
				}
				
		        len = choiceArr.length;
				
				for(i=0;i<len;i++)
				{
					choiceStr = choiceStr + getUnitChoice(choiceArr[i]) + " ";
				}
				
		        len = typeArr.length;
				
				for(i=0;i<len;i++)
				{
					typeStr = typeStr + getUnitType(typeArr[i]) + " ";
				}
				
				ingredStr = ingredStr.trim();
				choiceStr = choiceStr.trim();
				typeStr = typeStr.trim();
				
				window.alert("ingreds: " + ingredStr + " choices: " + choiceStr + " types: " + typeStr + " descrip: " + descStr + " diet: " + dietStr);

				sendRecipe(ingredStr,choiceStr,typeStr,descStr,dietStr,recipeTitleStr,recipeStr);
			}	
			
		}	
		
				
	});
	
}

function sendRecipe(ingredStr,choiceStr,typeStr,descStr,dietStr,recipeTitleStr,recipeStr)
{
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function(){
		
		if(this.readyState == 4 && this.status == 200)
		{
			var result = this.responseText;
			var jsonObj = JSON.parse(result);
			if(jsonObj == "successful")
			{
				window.alert("Recipe Added Successfully");
				window.location.reload();
			}
			else
			{
				window.alert("Recipe Submission Failed");
			}	
		}	
	};
	
	var actionstr = "submitRecipe?userid=" + userid;
	actionstr = actionstr + "&ingred=" + ingredStr;
	actionstr = actionstr + "&choice=" + choiceStr;
	actionstr = actionstr + "&type=" + typeStr;
	actionstr = actionstr + "&descrip=" + descStr;
	actionstr = actionstr + "&diet=" + dietStr;
	actionstr = actionstr + "&title=" + recipeTitleStr;
	actionstr = actionstr + "&recipe=" + recipeStr;
	
	xhttp.open("GET",actionstr,true);
	xhttp.send();
}


function isMetaFull()
{
	var ingredsTxt = document.getElementById("selectedIngreds").innerText;
	var choicesTxt = document.getElementById("selectedChoices").innerText;
	var typesTxt = document.getElementById("selectedTypes").innerText;
	var descripTxt = document.getElementById("descText").innerText;
	var dietTxt = document.getElementById("dietText").innerText;
	
	if(ingredsTxt == "Ingredients : Empty")
	{
	   return false;
	}
	else if(choicesTxt == "Choices : Empty")
	{
		return false;
	}
	else if(typesTxt == "Types : Empty")
	{
		return false;
	}
	else if(descripTxt == "Empty")
	{
		return false;
	}
	else if(dietTxt == "Empty")
	{
		return false;
	}	
	else
	{
		return true;
	}	
}



//Submitting Recipe Module

function getUnitIngred(nameTxt)
{
    var len = allIngreds.length;
    var i;
    var k;
    
    for(i=0;i<len;i++)
    {
    	if(allIngreds[i].name == nameTxt)
    	{
    		k = allIngreds[i].ingredid;
    		return k;
    	}	
    }	
}

function getUnitChoice(nameTxt)
{
    var len = allChoices.length;
    var i;
    var k;
    
    for(i=0;i<len;i++)
    {
    	if(allChoices[i].name == nameTxt)
    	{
    		k = allChoices[i].choiceid;
    		return k;
    	}	
    }	
}

function getUnitType(nameTxt)
{
    var len = allTypes.length;
    var i;
    var k;
    
    for(i=0;i<len;i++)
    {
    	if(allTypes[i].name == nameTxt)
    	{
    		k = allTypes[i].typeid;
    		return k;
    	}	
    }	
}


//selectedDescrip

function prepareDescripPanel()
{
    var cont = "<button class = 'desc' value = 'Veg'>Veg Item</button>";
    cont = cont + "<button class = 'desc' value = 'NonVeg'>Non-Veg Item</button>";
    cont = cont + "<button class = 'desc' value = 'None'>None</button>";
    cont = cont + "<span id = 'descText'>Empty</span>";
    
    document.getElementById("selectedDescrip").innerHTML = cont;
    
    var x = document.getElementById("selectedDescrip").getElementsByClassName("desc");
    var i;
    for(i=0;i<3;i++)
    {
    	x[i].style.backgroundColor = "#4EDC97";
    	x[i].style.display = "inline";
    	
    	x[i].addEventListener("click",function(event){
    		
    		document.getElementById("descText").innerText = event.target.value;
    	});
    }	
}


//selectedDiet

var veryHealthyCol = "#3EF03E";
var healthyCol = "#2AAC2A";
var moderateCol = "#FFC300";
var richCol = "#FF5733";
var veryRichCol = "#E80C0C";	

function getDietColor(txt)
{
	var t = parseInt(txt);
	
	if(t == 1)
	{
		return veryHealthyCol;
	}
	else if(t == 2)
	{
		return healthyCol;
	}
	else if(t == 3)
	{
		return moderateCol;
	}
	else if(t == 4)
	{
		return richCol;
	}
	else if(t == 5)
	{
		return veryRichCol;
	}
}


function getUnitDiet(nameTxt)
{
	var k = 0;
	if(nameTxt == "Very-Healthy")
	{
		k = 1;
		return k;
	}
	else if(nameTxt == "Healthy")
	{
		k = 2;
		return k;
	}
	else if(nameTxt == "Moderate")
	{
		k = 3;
		return k;
	}
	else if(nameTxt == "Rich")
	{
		k = 4;
		return k;
	}
	else if(nameTxt == "Very-Rich")
	{
		k = 5;
		return k;
	}
}


function prepareDietPanel()
{
	var cont = "<button class = 'diet' value = '1'>Very-Healthy</button>";
	cont = cont + "<button class = 'diet' value = '2'>Healthy</button>";
	cont = cont + "<button class = 'diet' value = '3'>Moderate</button>";
	cont = cont + "<button class = 'diet' value = '4'>Rich</button>";
	cont = cont + "<button class = 'diet' value = '5'>Very-Rich</button>";
	cont = cont + "<span id = 'dietText'>Empty</span>";
	
	document.getElementById("selectedDiet").innerHTML = cont;
	var x = document.getElementById("selectedDiet").getElementsByClassName("diet");
	var len = x.length;
	var i;
	
	for(i=1;i<6;i++)
	{
		var j = i-1;
		x[j].style.backgroundColor = getDietColor(i);
		x[j].style.display = "inline";
		
        x[j].addEventListener("click",function(event){
    		
    		document.getElementById("dietText").innerText = event.target.innerText;
    	});
	}	
	
}

var flagIn = false;
var flagCh = false;
var flagTy = false;

function prepareTypePanel()
{
   var cont = "<button id = 'tyCut'>x</button><br/>";
   var len = allTypes.length;
   var i;
   var green = "#82E0AA"; 
   var grey = "#ECDCD7";
   
   for(i=0;i<len;i++)
   {
	   cont = cont + "<br/><div class = 'tyCon'><input type = 'checkbox' class = 'type' value = " + allTypes[i].typeid;
	   cont = cont + " name = '"+ allTypes[i].name +"'>";
	   cont = cont + allTypes[i].name + "</input></div>";
   }	   
   cont = cont + "</div><br/><button id = 'typeOk'>Ok</button>"; 
   cont = cont + "<br/><br/><div>Must Click <span style='color:blue'>Ok</span> To Save Your Selections.";
   
   document.getElementById("typeList").innerHTML = cont;	
   document.getElementById("typeList").style.display = "none";
   
   
 //itemCon Activation
   var r = document.getElementsByClassName("tyCon");
   var l = r.length;
   
   for(i=0;i<l;i++)
   {
   	r[i].addEventListener("click",function(event){
   		
   		var x = event.target.getElementsByClassName("type")[0];
   		if(x.checked == true)
   		{
   			x.checked = false;
   		}
   		else
   		{
   			x.checked = true;
   		}	
   		
   		
   	});
   }
   
   
   
   document.getElementById("tyCut").addEventListener("click",function(){
	  
	   neutralLabels();
	   
	   document.getElementById("typeList").style.display = "none";
   });
   
   //savedContainer
   document.getElementById("selectedTypes").addEventListener("click",function(event){
	  
	   var txt = event.target.innerText;
	   if(txt == "Types : Empty")
	   {
		   flagIn = false;
		   flagCh = false;
		   flagTy = false;
		   document.getElementById("savedContainer").style.display = "none";
		   window.alert("Nothing Selected : display off");
	   }
	   else
	   {
		   
		   if(flagTy == true)
		   {
			   flagIn = false;
			   flagCh = false;
			   flagTy = false;
			   document.getElementById("savedContainer").style.display = "none";
			   window.alert("display off");
		   }
		   else
		   {
			   flagIn = false;
			   flagCh = false;
			   flagTy = true;
			   
			   var res = txt.split(",");
			   var len = res.length;
			   var i;
			   cont = "<div id = 'itemListTitle'>Selected Types</div><div id = 'items'>";
			   for(i=0;i<len;i++)
			   {
				  
				  cont = cont + "<br/><div class = 'item'><span class = 'itemName'>" + res[i];
				  cont = cont + "</span><button class = 'itemCut'>x</button></div>";
			   }
			   cont = cont + "</div>"; //items will be scrolled, not anything else
			   cont = cont + "<button id = 'itemUp'>Up</button>";	
			   window.alert("display on");
			   document.getElementById("savedContainer").innerHTML = cont;
			   document.getElementById("savedContainer").style.display = "block";
			   document.getElementById('itemUp').style.display = "none";
			   
			   document.getElementById("items").addEventListener("scroll",function(event){
				  
				   var h = event.target.scrollTop;
				   if(parseInt(h) > 0)
				   {
					   document.getElementById('itemUp').style.display = "block";  
				   }
				   else
				   {
					   document.getElementById('itemUp').style.display = "none";
				   }	   
				   
			   });
			   
			   
			   
			   //cont = cont + "<button id = 'itemUp'>Up</button>";
			   document.getElementById("itemUp").addEventListener("click",function(){
				  
				   var elt = document.getElementById("items");
				   elt.scrollTop = 0;
			   });
			   
			   
			   itemCutActivate();
			   //itemCutActivate
		   }	   
		   
		   
	   }	   
	   
   });
   
  
   document.getElementById("typeOk").addEventListener("click",function(){
	  
	   var x = document.getElementsByClassName("type");
	   var len = x.length;
	   var i;
	   var str = "";
	   var flag = false;
	   
	   for(i=0;i<len;i++)
	   {
		   if(x[i].checked)
		   { 
			   flag = true;
			   str = str + x[i].name + ",";
		   }   
	   }	   
	   
	   if(flag == false)
	   {
		   window.alert("Nothing Selected");
		   document.getElementById("selectedTypes").innerHTML = "Types : Empty";
		   document.getElementById("selectedTypes").style.backgroundColor = grey;
	   }
	   else
	   {
		   len = str.length;
		   document.getElementById("selectedTypes").innerHTML = str.substring(0,len-1);
		   document.getElementById("selectedTypes").style.backgroundColor = green;
	   }	
	   
	 //savedContainer Display block
   	var vis = document.getElementById("savedContainer").style.display;
   	if(vis == "block")
   	{
   		var txt = document.getElementById("itemListTitle").innerText;
   		if(txt == "Selected Types")
   		{
   			document.getElementById("selectedTypes").click();
       		document.getElementById("selectedTypes").click();
   		}	
   	}
	   
	   
	   document.getElementById("typeList").style.display = "none";
	   
   });
   
   document.getElementById("selectType").addEventListener("click",function(){
	  
	   neutralLabels();
	   
	   document.getElementById("ingredList").style.display = "none";
	   document.getElementById("choiceList").style.display = "none";
	   document.getElementById("typeList").style.display = "block";
	   document.getElementById("selectedTypes").style.backgroundColor = grey;
   });
   
	
	
}


function uncheckFrom(listName,txt)
{
	if(listName == "ingred")
	{
		var x = document.getElementsByClassName("ingred");
		var len = x.length;
		var i;
		
		for(i=0;i<len;i++)
		{
			if(x[i].name == txt)
			{
				x[i].checked = false;
				break;
			}	
		}	
		
		
	}
	else if(listName == "choice")
	{
		var x = document.getElementsByClassName("choice");
		var len = x.length;
		var i;
		
		for(i=0;i<len;i++)
		{
			if(x[i].name == txt)
			{
				x[i].checked = false;
				break;
			}	
		}
	}
	else if(listName == "type")
	{
		var x = document.getElementsByClassName("type");
		var len = x.length;
		var i;
		
		for(i=0;i<len;i++)
		{
			if(x[i].name == txt)
			{
				x[i].checked = false;
				break;
			}	
		}
		
	}	
}


//selectedIngreds
//selectedChoices
//selectedTypes
//Ingredients : Empty
//Choices : Empty
//Types : Empty

function removeFromSelected(listName,txt)
{
	var grey = "#ECDCD7";
	
	if(listName == "ingred")
	{
		var str = document.getElementById("selectedIngreds").innerText;
		var res = str.split(",");
		var len = res.length;
		var resStr = "";
		
		if(len == 1)
		{
			resStr = "Ingredients : Empty";
			document.getElementById("selectedIngreds").style.backgroundColor = grey;
		}
		else
		{
		   var i;
		   for(i=0;i<len;i++)
		   {
			   if(res[i] != txt)
			   {
				  resStr = resStr + res[i] + ",";   
			   }	   
		   }
		   
		   var l = resStr.length;
		   resStr = resStr.substring(0,l-1);
		}	
		
		document.getElementById("selectedIngreds").innerText = resStr;
	}
	else if(listName == "choice")
	{
		var str = document.getElementById("selectedChoices").innerText;
		var res = str.split(",");
		var len = res.length;
		var resStr = "";
		
		if(len == 1)
		{
			resStr = "Choices : Empty";
			document.getElementById("selectedChoices").style.backgroundColor = grey;
		}
		else
		{
		   var i;
		   for(i=0;i<len;i++)
		   {
			   if(res[i] != txt)
			   {
				  resStr = resStr + res[i] + ",";   
			   }	   
		   }
		   
		   var l = resStr.length;
		   resStr = resStr.substring(0,l-1);
		}	
		
		document.getElementById("selectedChoices").innerText = resStr;
	}
	else if(listName == "type")
	{
		var str = document.getElementById("selectedTypes").innerText;
		var res = str.split(",");
		var len = res.length;
		var resStr = "";
		
		if(len == 1)
		{
			resStr = "Types : Empty";
			document.getElementById("selectedTypes").style.backgroundColor = grey;
		}
		else
		{
		   var i;
		   for(i=0;i<len;i++)
		   {
			   if(res[i] != txt)
			   {
				  resStr = resStr + res[i] + ",";   
			   }	   
		   }
		   
		   var l = resStr.length;
		   resStr = resStr.substring(0,l-1);
		}	
		
		document.getElementById("selectedTypes").innerText = resStr;
	}
	
//function ends	
}

function loadSavedContainer()
{
	var heading = document.getElementById("savedContainer").getElementById("itemListTitle").innerText;
	// no need for that double clicking on the selected panels by javascript will do the trick

}



//uncheckFrom
//removeFromSelected
//loadSavedContainer
function itemCutActivate()
{
	var x = document.getElementById("savedContainer").getElementsByClassName("itemCut");
	var len = x.length;
	var i;
	
	for(i=0;i<len;i++)
	{
		x[i].addEventListener("click",function(event){
			
			window.alert("item cut clicked");
			
			var txt = event.target.parentElement.getElementsByClassName("itemName")[0].innerText;
			var heading = document.getElementById("itemListTitle").innerText;
			
			if(heading == "Selected Ingredients")
			{
				uncheckFrom("ingred",txt);
				removeFromSelected("ingred",txt);
				document.getElementById("selectedIngreds").click();
				document.getElementById("selectedIngreds").click();
			}
			else if(heading == "Selected Choices")
			{
				uncheckFrom("choice",txt);
				removeFromSelected("choice",txt);
				document.getElementById("selectedChoices").click();
				document.getElementById("selectedChoices").click();
			}
			else if(heading == "Selected Types")
			{
				uncheckFrom("type",txt);
				removeFromSelected("type",txt);
				document.getElementById("selectedTypes").click();
				document.getElementById("selectedTypes").click();
			}	
			
			
		});
		
		
	}	
	
}



function neutralLabels()
{
	var green = "#82E0AA"; 
	var grey = "#ECDCD7";
	
    var str = ",";
    var ingredTxt = document.getElementById("selectedIngreds").innerText;
    var choiceTxt = document.getElementById("selectedChoices").innerText;
    var typeTxt = document.getElementById("selectedTypes").innerText;
    
    if(ingredTxt == "Ingredients : Empty")
    {
    	document.getElementById("selectedIngreds").style.backgroundColor = grey;	
    }
    else
    {
    	document.getElementById("selectedIngreds").style.backgroundColor = green;
    }
    
    if(choiceTxt == "Choices : Empty")
    {
    	document.getElementById("selectedChoices").style.backgroundColor = grey;	
    }
    else
    {
    	document.getElementById("selectedChoices").style.backgroundColor = green;
    }
    
    if(typeTxt == "Types : Empty")
    {
    	document.getElementById("selectedTypes").style.backgroundColor = grey;	
    }
    else
    {
    	document.getElementById("selectedTypes").style.backgroundColor = green;
    }
}


var selectAllIngredFlag = false;

function prepareIngredPanel()
{
    //ingred panel
    var cont = "<button id = 'inCut'>x</button><br/><div><input type = 'text' id = 'ingredSearch' placeholder = 'Search Ingredients'></div>";
    var len = allIngreds.length;
    var i;
    cont = cont + "<br/><div><button id = 'selectAllIngreds'>Select All</button></div>";
    cont = cont + "<br/><div id = 'inList'>";
    for(i=0;i<len;i++)
    {
    	cont = cont + "<br class = 'gap'><div class = 'inCon'>";
    	cont = cont + "<input type='checkbox' class = 'ingred' name = '"+ allIngreds[i].name + "' value = " + allIngreds[i].ingredid + ">";
    	cont = cont + "<span class = 'first'>" + allIngreds[i].name + "</span>";
    	cont = cont + "<span class = 'second'></span><span class = 'third'></span></input>";
    	cont = cont + "</div>";
    }	
    cont = cont + "</div><br/><button id = 'ingredOk'>Ok</button><button id = 'ingredMarked'>marked</button>";
    cont = cont + "<br/><br/><div>Must Click <span style='color:blue'>Ok</span> To Save Your Selections.";
    cont = cont + "<button id='inUp'>up</button></div>";
    
    document.getElementById("ingredList").innerHTML = cont;
    document.getElementById("ingredList").style.display = "none";
    document.getElementById("inUp").style.display = "none";
    
    
    //itemCon Activation
    var r = document.getElementsByClassName("inCon");
    var l = r.length;
    
    for(i=0;i<l;i++)
    {
    	r[i].addEventListener("click",function(event){
    		
    		var x = event.target.getElementsByClassName("ingred")[0];
    		if(x.checked == true)
    		{
    			x.checked = false;
    		}
    		else
    		{
    			x.checked = true;
    		}	
    		
    		
    	});
    }	
    
    
  //savedContainer
    document.getElementById("selectedIngreds").addEventListener("click",function(event){
 	  
 	   var txt = event.target.innerText;
 	   if(txt == "Ingredients : Empty")
 	   {
 		   flagIn = false;
		   flagCh = false;
		   flagTy = false;
		   document.getElementById("savedContainer").style.display = "none";
 		   window.alert("Nothing Selected : display off");
 	   }
 	   else
 	   {
 		   
 		   if(flagIn == true)
 		   {
 			   flagIn = false;
 			   flagCh = false;
 			   flagTy = false;
 			   document.getElementById("savedContainer").style.display = "none";
 			   window.alert("display off");
 		   }
 		   else
 		   {
 			   flagIn = true;
 			   flagCh = false;
 			   flagTy = false;
 			   
 			   var res = txt.split(",");
 			   var len = res.length;
 			   var i;
 			   cont = "<div id = 'itemListTitle'>Selected Ingredients</div><div id = 'items'>";
 			   for(i=0;i<len;i++)
 			   {
 				  
 				  cont = cont + "<br/><div class = 'item'><span class = 'itemName'>" + res[i];
 				  cont = cont + "</span><button class = 'itemCut'>x</button></div>";
 			   }
 			   cont = cont + "</div>";
 			  cont = cont + "<button id = 'itemUp'>Up</button>";
 				
 			   window.alert("display on");
 			   document.getElementById("savedContainer").innerHTML = cont;
 			   document.getElementById("savedContainer").style.display = "block";
 			  document.getElementById('itemUp').style.display = "none";
			   
			   document.getElementById("items").addEventListener("scroll",function(event){
				  
				   var h = event.target.scrollTop;
				   if(parseInt(h) > 0)
				   {
					   document.getElementById('itemUp').style.display = "block";  
				   }
				   else
				   {
					   document.getElementById('itemUp').style.display = "none";
				   }	   
				   
			   });
 			   
 			  //cont = cont + "<button id = 'itemUp'>Up</button>";
			   document.getElementById("itemUp").addEventListener("click",function(){
				  
				   var elt = document.getElementById("items");
				   elt.scrollTop = 0;
			   });
 			   
 			  itemCutActivate();
 		   }	   
 		   
 		   
 	   }	   
 	   
    });
    
    
    document.getElementById("inCut").addEventListener("click",function(){
  	  
 	   neutralLabels();
 	   
 	   document.getElementById("ingredList").style.display = "none";
    });
    
    document.getElementById("inList").addEventListener("scroll",function(event){
    	
    	var x = parseInt(event.target.scrollTop);
    	if(x > 0)
    	{
    		document.getElementById("inUp").style.display = "inline";
    	}
    	else
    	{
    		document.getElementById("inUp").style.display = "none";
    	}	
    		
    });
    
    document.getElementById("inUp").addEventListener("click",function(){
    	
    	document.getElementById("inList").scrollTop = 0;
    	
    });
    
    
    
    document.getElementById("selectIngred").addEventListener("click",function(){
    	
    	neutralLabels();
    	
    	document.getElementById("typeList").style.display = "none";
    	document.getElementById("choiceList").style.display = "none";
    	document.getElementById("ingredList").style.display = "block";
    	document.getElementById("selectedIngreds").style.backgroundColor = "#ECDCD7"; //grey
    	
    });
    
    document.getElementById("selectAllIngreds").addEventListener("click",function(){
    	
    	var x = document.getElementsByClassName("ingred");
    	var g = document.getElementById("inList").getElementsByClassName("gap");
    	var len = x.length;
    	var i;
    	
    	for(i=0;i<len;i++)
    	{
    		x[i].parentElement.style.display = "block";
    		g[i].style.diplay = "block";
    		
    		//false means some are not selected, so select all then turn the flag true
    		// but in either of cases, view all
    		
    		if(selectAllIngredFlag == false)
    		{
    			x[i].checked = true;
    		}
    		else
    		{
    			x[i].checked = false;
    		}	
    		
    	}	
    	
    	if(selectAllIngredFlag == false)
    	{
    		selectAllIngredFlag = true;
    		document.getElementById("selectAllIngreds").innerText = "Deselect All";
    		document.getElementById("ingredMarked").innerText = "marked";
    	}
    	else
    	{
    		selectAllIngredFlag = false;
    		document.getElementById("selectAllIngreds").innerText = "Select All";
    		document.getElementById("ingredMarked").innerText = "marked";
    	}	
    	
    	
    });
    
    
    
    
	document.getElementById("ingredSearch").addEventListener("keyup",function(event){
	
		var g = document.getElementById("inList").getElementsByClassName("gap");
		var x = document.getElementsByClassName("ingred");
		var len = x.length;
		var i;
		var txt = event.target.value;
		if(txt == "")
		{
			for(i=0;i<len;i++)
			{
				var f = x[i].parentElement.getElementsByClassName("first")[0];
				var s = x[i].parentElement.getElementsByClassName("second")[0];
				var t = x[i].parentElement.getElementsByClassName("third")[0];
				
				var n = x[i].name;
				
				f.innerHTML = n;
				s.innerHTML = "";
				t.innerHTML = "";
				
				x[i].parentElement.style.display = "block";
				g[i].style.display = "block";
			}
			
			document.getElementById("ingredMarked").innerText = "marked";
			
		}
		else
		{
			for(i=0;i<len;i++)
			{
				var tmp1 = x[i].name.toLowerCase();
				var tmp2 = txt.toLowerCase();
				if(tmp1.indexOf(tmp2) != -1)
				{
					var k = tmp1.indexOf(tmp2);
					var l = tmp2.length;
					l = l + k;
					
					var f = x[i].parentElement.getElementsByClassName("first")[0];
					var s = x[i].parentElement.getElementsByClassName("second")[0];
					var t = x[i].parentElement.getElementsByClassName("third")[0];
					
					var n = x[i].name;
					f.innerHTML = n.substring(0,k);
					s.innerHTML = n.substring(k,l);
					t.innerHTML = n.substring(l);
					
					x[i].parentElement.style.display = "block";
					g[i].style.display = "block";
				}
				else
				{
					var f = x[i].parentElement.getElementsByClassName("first")[0];
					var s = x[i].parentElement.getElementsByClassName("second")[0];
					var t = x[i].parentElement.getElementsByClassName("third")[0];
					
					var n = x[i].name;
					f.innerHTML = n;
					s.innerHTML = "";
					t.innerHTML = "";
					
					x[i].parentElement.style.display = "none";
					g[i].style.display = "none";
				}	
			}
			
		}	
		
		
	});
	
    document.getElementById("ingredOk").addEventListener("click",function(){
    	
    	var x = document.getElementsByClassName("ingred");
    	var len = x.length;
    	var i;
    	var str = "";
    	var flag = false;
    	
    	for(i=0;i<len;i++)
    	{
    		if(x[i].checked)
    		{
    			flag = true;
    			str = str + x[i].name + ",";
    		}	
    			
    	}	
    	
    	if(flag == true)
    	{   
    		var green = "#82E0AA";
    		len = str.length;
    		str = str.substring(0,len-1);
    		window.alert(str);
        	document.getElementById("selectedIngreds").innerText = str;
        	document.getElementById("selectedIngreds").style.backgroundColor = green; //green
    	}
    	else
    	{
    		window.alert("Nothing Selected");
    		document.getElementById("selectedIngreds").innerText = "Ingredients : Empty";
    		document.getElementById("selectedIngreds").style.backgroundColor = "#ECDCD7"; //grey
    	}
    	
    	//savedContainer Display block
    	var vis = document.getElementById("savedContainer").style.display;
    	if(vis == "block")
    	{
    		var txt = document.getElementById("itemListTitle").innerText;
    		if(txt == "Selected Ingredients")
    		{
    			document.getElementById("selectedIngreds").click();
        		document.getElementById("selectedIngreds").click();
    		}	
    	}
    	
    	document.getElementById("ingredList").style.display = "none";
    	
    });
    
    document.getElementById("ingredMarked").addEventListener("click",function(event){
    	
    	var x = document.getElementsByClassName("ingred");
    	var g = document.getElementById("inList").getElementsByClassName("gap");
    	var len = x.length;
    	var i;
    	txt = event.target.innerText;
    	var markedFlag = false;
    	
    	//if some are marked, flag will be true
    	//and thus tag will be converted to all
    	
    	if(txt == "marked")
    	{
    		for(i=0;i<len;i++)
    		{
    			if(x[i].checked)
    			{
    				markedFlag = true;
    				x[i].parentElement.style.display = "block";
    				g[i].style.display = "block";
    			}
    			else
    			{
    				x[i].parentElement.style.display = "none";
    				g[i].style.display = "none";
    			}	
    		}
    		
    		if(markedFlag == true)
    		{
    			event.target.innerText = "all";
    		}
    		else
    		{
    			for(i=0;i<len;i++)
        		{
        			x[i].parentElement.style.display = "block";
        			g[i].style.display = "block";
        		}
    			window.alert("Nothing Marked");
    		}	
    	}	
    	else
    	{
    		for(i=0;i<len;i++)
    		{
    			x[i].parentElement.style.display = "block";
    			g[i].style.display = "block";
    		}
    		
    		event.target.innerText = "marked";
    	}	
    	
    	
    });
    
    //ingred panel ends
	
}


var selectAllChoiceFlag = false;

function prepareChoicePanel()
{
    //ingred panel
    var cont = "<button id = 'chCut'>x</button><br/><div><input type = 'text' id = 'choiceSearch' placeholder = 'Search Choices'></div>";
    var len = allChoices.length;
    var i;
    //cont = cont + "<br/><div><button id = 'selectAllChoices'>Select All</button></div>";
    cont = cont + "<br/><div id = 'chList'>";
    for(i=0;i<len;i++)
    {
    	cont = cont + "<br class = 'gap'><div class = 'chCon'>";
    	cont = cont + "<input type='checkbox' class = 'choice' name = '"+ allChoices[i].name + "' value = " + allChoices[i].choiceid + ">";
    	cont = cont + "<span class = 'first'>" + allChoices[i].name + "</span>";
    	cont = cont + "<span class = 'second'></span><span class = 'third'></span></input>";
    	cont = cont + "</div>";
    }	
    cont = cont + "</div><br/><button id = 'choiceOk'>Ok</button><button id = 'choiceMarked'>marked</button>";
    cont = cont + "<br/><br/><div>Must Click <span style='color:blue'>Ok</span> To Save Your Selections.";
    cont = cont + "<button id='chUp'>up</button></div>";
    
    document.getElementById("choiceList").innerHTML = cont;
    document.getElementById("choiceList").style.display = "none";
    document.getElementById("chUp").style.display = "none";
    
  //itemCon Activation
    var r = document.getElementsByClassName("chCon");
    var l = r.length;
    
    for(i=0;i<l;i++)
    {
    	r[i].addEventListener("click",function(event){
    		
    		var x = event.target.getElementsByClassName("choice")[0];
    		if(x.checked == true)
    		{
    			x.checked = false;
    		}
    		else
    		{
    			x.checked = true;
    		}	
    		
    		
    	});
    }
    
    
    
    
  //savedContainer
    document.getElementById("selectedChoices").addEventListener("click",function(event){
 	  
 	   var txt = event.target.innerText;
 	   if(txt == "Choices : Empty")
 	   {
 		   flagIn = false;
		   flagCh = false;
		   flagTy = false;
		   document.getElementById("savedContainer").style.display = "none";
 		   window.alert("Nothing Selected : display off");
 	   }
 	   else
 	   {
 		   
 		   if(flagCh == true)
 		   {
 			   flagIn = false;
 			   flagCh = false;
 			   flagTy = false;
 			   document.getElementById("savedContainer").style.display = "none";
 			   window.alert("display off");
 		   }
 		   else
 		   {
 			   flagIn = false;
 			   flagCh = true;
 			   flagTy = false;
 			   
 			   var res = txt.split(",");
 			   var len = res.length;
 			   var i;
 			   cont = "<div id = 'itemListTitle'>Selected Choices</div><div id = 'items'>";
 			   for(i=0;i<len;i++)
 			   {
 				  
 				  cont = cont + "<br/><div class = 'item'><span class = 'itemName'>" + res[i];
 				  cont = cont + "</span><button class = 'itemCut'>x</button></div>";
 			   }
 			   cont = cont + "</div>";
 			  cont = cont + "<button id = 'itemUp'>Up</button>";
 				
 			   window.alert("display on");
 			   document.getElementById("savedContainer").innerHTML = cont;
 			   document.getElementById("savedContainer").style.display = "block";
 			  document.getElementById('itemUp').style.display = "none";
			   
			   document.getElementById("items").addEventListener("scroll",function(event){
				  
				   var h = event.target.scrollTop;
				   if(parseInt(h) > 0)
				   {
					   document.getElementById('itemUp').style.display = "block";  
				   }
				   else
				   {
					   document.getElementById('itemUp').style.display = "none";
				   }	   
				   
			   });
 			   
 			//cont = cont + "<button id = 'itemUp'>Up</button>";
			   document.getElementById("itemUp").addEventListener("click",function(){
				  
				   var elt = document.getElementById("items");
				   elt.scrollTop = 0;
			   });
 			   
 			   itemCutActivate();
 		   }	   
 		   
 		   
 	   }	   
 	   
    });
    
    
    
    document.getElementById("chCut").addEventListener("click",function(){
  	  
 	   neutralLabels();
 	   
 	   document.getElementById("choiceList").style.display = "none";
    });
    
    document.getElementById("chList").addEventListener("scroll",function(event){
    	
    	if(parseInt(event.target.scrollTop) > 0)
    	{
    		document.getElementById("chUp").style.display = "inline";
    	}
    	else
    	{
    		document.getElementById("chUp").style.display = "none";
    	}	
    	
    });
    
    
    document.getElementById("chUp").addEventListener("click",function(){
    	
    	document.getElementById("chList").scrollTop = 0;
    });
    
    var z = document.getElementsByClassName("choice");
    var lenz = z.length;
   
    for(i=0;i<lenz;i++)
    {
    	z[i].addEventListener("click",function(event){
    		
    		if(event.target.name == "All")
    		{
    			var x = document.getElementsByClassName("choice");
    			var len = x.length;
    			var j;
    			
    			for(j=0;j<len;j++)
    			{
    				x[j].checked = false;
    			}
    			
    			event.target.checked = true;
    		}
    		else
    		{
    			var x = document.getElementsByClassName("choice");
    			var len = x.length;
    			var j;
    			var flag = false;
    			
    			x[0].checked = false;
    			
    			for(j=1;j<len;j++)
    			{
    				if(x[j].checked == false)
    				{
    					flag = true;
    					break;
    				}	
    			}
    			
    			if(flag == false)
    			{
    				for(j=1;j<len;j++)
    				{
    					x[j].checked = false;
    				}
    				
    				x[0].checked = true;
    			}	
    			
    			
    		}	
    		
    		//end of function
    		
    	});
    		
    }	
    
    
    document.getElementById("selectChoice").addEventListener("click",function(){
    	
    	neutralLabels();
    	
    	document.getElementById("typeList").style.display = "none";
    	document.getElementById("ingredList").style.display = "none";
    	document.getElementById("choiceList").style.display = "block";
    	var grey = "#ECDCD7";
    	document.getElementById("selectedChoices").style.backgroundColor = grey;
    	
    	/*var elt = document.getElementById("chList");
    	elt.scrollTop = elt.scrollHeight;*/
    });
    
    /*document.getElementById("selectAllChoices").addEventListener("click",function(){
    	
    	var x = document.getElementsByClassName("choice");
    	var len = x.length;
    	var i;
    	
    	for(i=0;i<len;i++)
    	{
    		x[i].parentElement.style.display = "block";
    		
    		if(selectAllChoiceFlag == false)
    		{
    			x[i].checked = true;
    		}
    		else
    		{
    			x[i].checked = false;
    		}	
    		
    	}	
    	
    	if(selectAllChoiceFlag == false)
    	{
    		selectAllChoiceFlag = true;
    		document.getElementById("selectAllChoices").innerText = "Deselect All";
    		document.getElementById("choiceMarked").innerText = "marked";
    	}
    	else
    	{
    		selectAllChoiceFlag = false;
    		document.getElementById("selectAllChoices").innerText = "Select All";
    		document.getElementById("choiceMarked").innerText = "marked";
    	}	
    	
    	
    });*/
    
    
    
    
	document.getElementById("choiceSearch").addEventListener("keyup",function(event){
	
		var x = document.getElementsByClassName("choice");
		var g = document.getElementById("chList").getElementsByClassName("gap");
		var len = x.length;
		var i;
		var txt = event.target.value;
		if(txt == "")
		{
			for(i=0;i<len;i++)
			{
				var f = x[i].parentElement.getElementsByClassName("first")[0];
				var s = x[i].parentElement.getElementsByClassName("second")[0];
				var t = x[i].parentElement.getElementsByClassName("third")[0];
				
				var n = x[i].name;
				
				f.innerHTML = n;
				s.innerHTML = "";
				t.innerHTML = "";
				
				x[i].parentElement.style.display = "block";
				g[i].style.display = "block";
			}
			
			document.getElementById("choiceMarked").innerText = "marked";
			
		}
		else
		{
			for(i=0;i<len;i++)
			{
				var tmp1 = x[i].name.toLowerCase();
				var tmp2 = txt.toLowerCase();
				if(tmp1.indexOf(tmp2) != -1)
				{
					var k = tmp1.indexOf(tmp2);
					var l = tmp2.length;
					l = l + k;
					
					var f = x[i].parentElement.getElementsByClassName("first")[0];
					var s = x[i].parentElement.getElementsByClassName("second")[0];
					var t = x[i].parentElement.getElementsByClassName("third")[0];
					
					var n = x[i].name;
					f.innerHTML = n.substring(0,k);
					s.innerHTML = n.substring(k,l);
					t.innerHTML = n.substring(l);
					
					x[i].parentElement.style.display = "block";
					g[i].style.display = "block";
				}
				else
				{
					var f = x[i].parentElement.getElementsByClassName("first")[0];
					var s = x[i].parentElement.getElementsByClassName("second")[0];
					var t = x[i].parentElement.getElementsByClassName("third")[0];
					
					var n = x[i].name;
					f.innerHTML = n;
					s.innerHTML = "";
					t.innerHTML = "";
					
					x[i].parentElement.style.display = "none";
					g[i].style.display = "none";
				}	
			}
			
		}	
		
		
	});
	
    document.getElementById("choiceOk").addEventListener("click",function(){
    	
    	var x = document.getElementsByClassName("choice");
    	var len = x.length;
    	var i;
    	var str = "";
    	var flag = false;
    	var green = "#82E0AA"; 
    	var grey = "#ECDCD7";
    	
    	
    	
    	for(i=0;i<len;i++)
    	{
    		if(x[i].checked)
    		{
    			flag = true;
    			str = str + x[i].name + ",";
    		}	
    			
    	}	
    	
    	if(flag == true)
    	{
    		len = str.length;
    		str = str.substring(0,len-1);
    		window.alert(str);
        	document.getElementById("selectedChoices").innerText = str;
        	document.getElementById("selectedChoices").style.backgroundColor = green;
    	}
    	else
    	{
    		window.alert("Nothing Selected");
    		document.getElementById("selectedChoices").innerText = "Choices : Empty";
    		document.getElementById("selectedChoices").style.backgroundColor = grey;
    	}	
    	
    	//savedContainer Display block
    	var vis = document.getElementById("savedContainer").style.display;
    	if(vis == "block")
    	{
    		var txt = document.getElementById("itemListTitle").innerText;
    		if(txt == "Selected Choices")
    		{
    			document.getElementById("selectedChoices").click();
        		document.getElementById("selectedChoices").click();
    		}	
    	}	
    	
    	
    	document.getElementById("choiceList").style.display = "none";
    	
    });
    
    document.getElementById("choiceMarked").addEventListener("click",function(event){
    	
    	var g = document.getElementById("chList").getElementsByClassName("gap");
    	var x = document.getElementsByClassName("choice");
    	var len = x.length;
    	var i;
    	txt = event.target.innerText;
    	var markedFlag = false;
    	
    	if(txt == "marked")
    	{
    		for(i=0;i<len;i++)
    		{
    			if(x[i].checked)
    			{
    				markedFlag = true;
    				x[i].parentElement.style.display = "block";
    				g[i].style.display = "block";
    			}
    			else
    			{
    				x[i].parentElement.style.display = "none";
    				g[i].style.display = "none";
    			}	
    		}
    		
    		if(markedFlag == true)
    		{
    			event.target.innerText = "all";
    		}
    		else
    		{
    			for(i=0;i<len;i++)
        		{
        			x[i].parentElement.style.display = "block";
        			g[i].style.display = "block";
        		}
    			window.alert("Nothing Marked");
    		}	
    	}	
    	else
    	{
    		for(i=0;i<len;i++)
    		{
    			x[i].parentElement.style.display = "block";
    			g[i].style.display = "block";
    		}
    		
    		event.target.innerText = "marked";
    	}	
    	
    	
    });
    
    //choice panel ends
	
}





</script>


</body>
</html>