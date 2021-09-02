<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Recipe Page</title>

<style>

#content
{
  position: absolute;
  height: 470px;
  width: 50%;
  background-color: #DDED82;
  left: 20px;
  top: 350px;
  padding: 10px 24px;
  text-align: center;
  border-style: ridge;
  border-width: 10px;
  font-size: 20px;
  font-family: "Times New Roman", Times, serif;
  overflow: scroll;
  border-radius: 20px;
}

#heading
{
  position: absolute;
  height: 50px;
  width: 50%;
  background-color: #5B4A47;
  color: white;
  left: 20px;
  top: 20px;
  padding: 10px 24px;
  text-align: center;
  border-style: ridge;
  border-width: 10px;
  font-size: 35px;
  font-style: italic;
  border-radius: 20px;
}


#userbtn
{
  position: absolute;
  height: 80px;
  left: 20px;
  top: 131px;  
  background-color: #4CAF50; /* Green */
  border: none;
  color: black;
  padding: 16px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 20px;
  font-style: italic;
  font-weight: bold;
  margin: 4px 2px;
  transition-duration: 0.4s;
  font-family: "Times New Roman", Times, serif;
  cursor: pointer;
  border-radius: 20px;
}

#type
{
  position: absolute;
  height: 40px;
  left: 20px;
  top: 216px;  
  background-color: #0C6565; /* Green */
  border: none;
  color: white;
  padding: 16px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 20px;
  font-style: italic;
  font-weight: bold;
  margin: 4px 2px;
  font-family: "Times New Roman", Times, serif;
  border-radius: 20px;
}

#ingred
{
  position: absolute;
  height: 40px;
  left: 20px;
  top: 290px;  
  background-color: #9DD8D7;
  border: none;
  color: black;
  padding: 16px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 20px;
  font-style: italic;
  font-weight: bold;
  margin: 4px 2px;
  font-family: "Times New Roman", Times, serif;
  border-radius: 20px;
}

#userbtn:hover 
{
  position: absolute;  
  background-color: #C70039;
  color: white;
  font-family: "Times New Roman", Times, serif;
  /*transform: rotateY(180deg);*/
  /*box-shadow: 10px 10px 5px grey;*/
  /*transition: width 2s;*/
  border-radius: 20px;
}
  
#rating
{
  position: absolute;
  left: 800px;
  top: 0%;
  height: 160px;
  width: 12%;
  background-color: #F12525;
  color: white;
  padding: 3px 10px;
  text-align: center;
  /*border-style: ridge;*/
  border-width: 10px;
  font-size: 150px;
  font-style: italic;
  border-radius: 25px;
  box-shadow: 10px 10px 5px grey;
  cursor: pointer;
}

#rating:hover
{
  background-color: #2F8ABF; 
}

#cmts
 { 
    position: absolute;
    left: 1080px;
    top: 20px; 
    background-color: #0C6463;
    width: 450px;
    height: 730px;
    overflow: scroll;
    border-style: solid;
    border-radius: 10px;
 }
 
 #entry
 {
    position: absolute;
    top: 770px;
    left: 1080px;
 }
 
 .cmt
 {
    background-color: #DAF7A6; 
    width: 400px;
    border-radius: 10px;
    font-family: "Times New Roman", Times, serif;
    font-size: 20px;
    font-style: italic;
    font-weight: bold;
 }
 
 .cmt:hover
 {
    background-color: #77C958; 
    box-shadow: 10px 10px 2px #1C5B04;   
 }
 
 .moreBtn
 {
    background-color: #DAF7A6;
    color: blue;
    border-radius: 20px;
 }
 
 .moreBtn:hover
 {
   color: black;
 }
 
 .editCmt
 {
	  background-color: #900C3F;
	  border: none;
	  color: white;
	  padding: 10px 20px;
	  text-align: center;
	  text-decoration: none;
	  display: inline-block;
	  font-size: 15px;
	  font-style: italic;
	  font-weight: bold;
	  margin: 4px 2px;
	  font-family: "Times New Roman", Times, serif;
	  border-radius: 20px;
	  transition-duration: 2s;
	  cursor: pointer;
 }
 
 .editCmt:hover
 {
     background-color: #E13318;
     transition-duration: 1s;
     width: 100px;
 }
 
 .editCmt:focus
 {
     background-color: #FFC300;
     color: black;
     transition-duration: 1s;
     width: 100px;
 }
 
 .cmtWriter
 {
    font-family: "Times New Roman", Times, serif;
    font-size: 15px;
    color: grey;
 }
 
 #entryTxt
 {
     height: 80px;
     width: 400px;
     border-radius: 10px;
     font-family: "Times New Roman", Times, serif;
    font-size: 20px;
    font-style: italic;
    font-weight: bold; 
 
 }
 
 #cmtSubmit,#saveEdit,#cancelEdit,#cancelRatingList,#submitRate,#cancelRate
 {
      background-color: #36A40D;
	  border: none;
	  color: black;
	  padding: 10px 20px;
	  text-align: center;
	  text-decoration: none;
	  display: inline-block;
	  font-size: 15px;
	  font-style: italic;
	  font-weight: bold;
	  margin: 4px 2px;
	  font-family: "Times New Roman", Times, serif;
	  border-radius: 20px;
	  transition-duration: 0.4s;
	  cursor: pointer;
 
 }
 
 #ratingBtn
 {
     position: absolute;
     background-color: #43B2F2;
     border-style: solid;
     color: black;
     padding: 10px 20px;
     display: inline-block;
     text-decoration: none;
     font-size: 15px;
     font-style: italic;
	 font-weight: bold;
	 margin: 4px 2px;
	 font-family: "Times New Roman", Times, serif;
	 border-radius: 20px;
     cursor: pointer;
     left: 800px;
     top: 320px;
     width: 250px;
 }
 
 #ratingBtn:hover
 {
    background-color: #F78A64;
 }
 
 #cmtSubmit:hover
 {
     background-color: #E13318;
     width: 200px;
     height: 60px;
     font-size: 25px;
 }
 
 #cancelRatingList:hover
 {
    background-color: #E13318;
     width: 100px;
     height: 50px;
     font-size: 25px;
 
 }
 
 #saveEdit:hover,#cancelEdit:hover,#submitRate:hover,#cancelRate:hover
 {
    background-color: #E13318;
 }
 
 #ratingListContainer,#ratingEditContainer
 {
    position: absolute;
    left: 800px;
    top: 320px;
    background-color: #F2A543 ;
    color: black;
    font-family: "Times New Roman", Times, serif;
    font-size: 20px;
    font-style: italic;
    font-weight: bold;
    height: 300px;
    width: 250px;
    overflow: scroll;
    border-radius: 15px;
 }
 
 .ratings
 {
    text-align: center;
    background-color: #FF5733;
    border-radius: 20px;
 }



</style>


</head>
<body onload = "initiate()">


<div id = "contentContainer">content will be printed here</div>
<div id = "similar">Similar Recipes will be printed here</div>

<div id = "cmts">comments will be loaded here</div>
<div id = "addCmt">type Console</div>



<script>

var recipeid =<%= request.getParameter("recipeid") %>;
var userid =<%= request.getParameter("userid") %>;
//recipeid = "'" + recipeid + "'";
var writeruserid = "";

function initiate()
{
   window.alert("RecipeId : " + recipeid + " and UserId : " + userid);	
   loadContent();
   fetchComment();
   //goRating();
}


var recipeMeta = "";
var recipeText = "";
var allChoices = "";
var allTypes = "";
var allIngreds = "";
var allRatings = "";
var similarRecipes = "";
var myLike = "";
var recipeAuthor = "";

function loadContent()
{
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function(){
		
		var res = this.responseText;
		var jsonObj = JSON.parse(res);
		// 0 to 7
		
		//meta txt choice type ingred rating sims like
		
		recipeMeta = jsonObj[0];
		recipeText = jsonObj[1];
		allChoices = jsonObj[2];
		allTypes = jsonObj[3];
		allIngreds = jsonObj[4];
		allRatings = jsonObj[5];
		similarRecipes = jsonObj[6];
		myLike = jsonObj[7];
		recipeAuthor = jsonObj[8];
		
		loadContentPanel();
		//loadRatingPanel();
		//loadSimilarRecipePanel();
		
	};
	
	var actionStr = "loadRecipeDetails?userid=" + userid + "&recipeid=" + recipeid;
	xhttp.open("GET",actionStr,true);
	xhttp.send();
	
	//Tool.getRecipeContentById(txtid); loadRecipeDetails 
}

 
 
 //recipe module ends
 
 
 
 //allCmts
 
var allCmts = "";
var allUserss = "";

 
 function fetchComment()
 {
	 var xhttp = new XMLHttpRequest();
	 xhttp.onreadystatechange = function(){
		 
		 if(this.readyState == 4 && this.status == 200)
		 {
			 var result = this.responseText;
			 var jsonObj = JSON.parse(result);
			 allCmts = jsonObj[0];
			 allUsers = jsonObj[1];
             var len = allCmts.length;
             window.alert("All Comments Length : " + len);
             loadComment();
		 }	 
	 };
	 
	 var actionstr = "fetchcomment?recipeid=" + recipeid;
	 xhttp.open("GET",actionstr,true);
	 xhttp.send();
 }
 
 function loadComment()
 {

	 window.alert("LoadComment is Called");
	 var cont = "<div>Comments</div>";
	 
	 if(allCmts.length == 0)
	 {
		 cont = cont + "<div><h2>No Comments</h2></div>";
	 }
	 else
	 {
		 var i;
		 var len = allCmts.length;
		 for(i=0;i<len;i++)
		 {
			 cont = cont + "<div class = 'cmt'>";
			 cont = cont + "<p class = 'cmtId'>" + allCmts[i].commentid + "</p>";
			 cont = cont + "<p class = 'cmtText'>" + generateComment(allCmts[i].commentText) + "</p>";
             
			 if(allUsers[i].userid != userid)
             {
        		 cont = cont + "<p class = 'cmtWriter'><a href='profile.jsp?userid=" + allUsers[i].userid +"'>By " + allUsers[i].username + "</a>";
             }
             else
             {
            	 cont = cont + "<p class = 'cmtWriter'>By Me......................";
            	 cont = cont + "<button class = 'editCmt'>edit</button>";
             }	 
			  
			 //cont = cont + "<p>-------------------------------------------------</p>";
			 cont = cont + "</p></div>";
		 }
	 }	 
	 
	 var cont1 = "<div id = 'entry'><textarea id = 'entryTxt' row='3' col='150' placeholder= 'Type Your Comment Here'></textarea>";
	 cont1 = cont1 + "<div id='btnCont'><button id = 'cmtSubmit'>Add Comment</button></div></div>";
	 document.getElementById("cmts").innerHTML = cont;
	 document.getElementById("cmts").style.display = "block";
	 //element.scrollTop = element.scrollHeight;
	 var elt = document.getElementById("cmts");
	 elt.scrollTop = elt.scrollHeight;
	 
	 document.getElementById("addCmt").innerHTML = cont1;
	
	 
	 
	 
	 var y = document.getElementsByClassName("cmtId");
	 var leny = y.length;
	 if(leny > 0)
	 {
		 var i;
		 for(i=0;i<leny;i++)
		 {
			 y[i].style.display= "none";
		 }	 
	 }	 
	 
	 //all comments are loaded and comment ids are hidden now the btn action parts
	 
	 showMoreBtnActive();
	 
	 document.getElementById("cmtSubmit").addEventListener("click",submitComment);
	 var x = document.getElementsByClassName("editCmt");
	 var len = x.length;
	
	 if(len > 0)
	 {
		 var i;
		 for(i=0;i<len;i++)
	     {
			 x[i].addEventListener("click",editComment);
	     }		 
	 }	 
	 
 }
 
 function submitComment()
 {
	 var txt = document.getElementById("entryTxt").value;
	 if(txt == "")
	 {
		 window.alert("Cant leave this empty");
	 }
	 else
	 {
		 var xhttp = new XMLHttpRequest();
		 xhttp.onreadystatechange = function(){
			 
			 if(this.readyState == 4 && this.status == 200)
			 {
				var result = this.responseText;
				var jsonObj = JSON.parse(result);
				
				if(jsonObj == "successful")
				{
					window.alert("Submitted Successfully");
					fetchComment();
				}
				else
				{
					window.alert("Submission Failed");
				}	
				
			 }	 
			 
		 };
		 
		 var actionstr = "submitComment?recipeid=" + recipeid + "&userid=" + userid + "&txt=" + txt;
		 xhttp.open("GET",actionstr,true);
		 xhttp.send();
		 
	 }	 
 }
 
 //global for this function
 var cid;
 var tempComment = "";
 
 function editComment(event)
 {
	 var x = event.target.parentElement.parentElement;
	 var orig = x.getElementsByClassName("original")[0];
	 var mors = x.getElementsByClassName("more");
	 cid = x.getElementsByClassName("cmtId")[0].innerText;
	 
	 var txt = orig.innerText;
	 var len1 = mors.length;
	 var i;
	 
	 for(i=0;i<len1;i++)
	 {
		 txt = txt + mors[i].innerText;
	 }	 
	 
	 tempComment = txt;
	 //var txt = x.getElementsByClassName("cmtText")[0].innerText;
	 window.alert("Editing : " + txt);
	 document.getElementById("entryTxt").value = txt;
	 
	 var cont = "<button id = 'saveEdit'>Save</button>";
	 cont = cont + "<button id = 'cancelEdit'>Cancel</button>";
	 document.getElementById("btnCont").innerHTML = cont;
	 
	 
	 document.getElementById("cmts").style.display= "none";
	 document.getElementById("entry").style.top= "20px";
	 document.getElementById("entryTxt").style.height= "300px";
	 
	 document.getElementById("saveEdit").addEventListener("click",saveEditedComment);
	 document.getElementById("cancelEdit").addEventListener("click",function(){
		 window.alert("Cancelling");
		 loadComment();
	 });
 }
 
 //required commentid, userid, recipeid
 function saveEditedComment()
 {
	 var txt = document.getElementById("entryTxt").value;
	 if(txt == "")
	 {
		 window.alert("Cant leave Empty");
	 }
	 else if(txt == tempComment)
	 {
		 var r = confirm("You have not changed anything, Save this?");
		 if(r == true)
		 {
			 loadComment();
		 }
	 }	 
	 else
	 {
		 //update comment
		 var xhttp = new XMLHttpRequest();
		 xhttp.onreadystatechange = function(){
			 
			 if(this.readyState == 4 && this.status == 200)
			 {
				 var result = this.responseText;
				 var jsonObj = JSON.parse(result);
				 if(jsonObj == "successful")
				 {
					 window.alert("Successfully Edited");
					 fetchComment();
				 }
				 else
				 {
					 window.alert("Editing Failed, Going back");
					 loadComment();
				 }	 
				 
			 }	 
		 };
		 //actually fetch and load
		 var actionStr = "updateCmt?userid=" + userid + "&recipeid=" + recipeid + "&commentid=" + cid + "&txt=" + txt;
		 //window.alert(actionStr);
		 xhttp.open("GET",actionStr,true);
		 xhttp.send();
	 }	 
 }

 
 function disableCmt()
 {
	 document.getElementById("cmts").style.opacity = "0.5";
	 document.getElementById("cmts").style.overflow= "hidden";
 }
 

 //Comment show more part
  var limit = 30;

 function generateComment(txt)
 {
	 var len = txt.length;
	 var q = parseInt(len/limit);
	 var r = parseInt(len%limit);
	 
	 var cont = "<span class = 'original'>";
	 if(q == 0)
	 {
		 cont = cont + txt + "</span>";
	 }
	 else
	 {
		 //q > 0 
		 cont = cont + txt.substring(0,limit) + "</span>";
		 var st = 0;
		 var ed = limit;
		 
		 if(q > 1)
		 {
			 var i;
			 
			 for(i = 1;i<q-1;i++)
			 {
				 st = i*limit;
				 ed = (i+1)*limit;
				 cont = cont + "<span class = 'more'>" + txt.substring(st,ed) + "</span>"; 
			 }
			 
		 }
		 
		 if(r > 0)
		 {
			 var b = parseInt(limit/3);
			 if(r < b)
			 { 
				 if(q == 1)
				 {
					 cont = "<span class = 'original'>" + txt + "</span>";
				 }
				 else
				 {
					 cont = cont + "<span class = 'more'>" + txt.substring(ed) + "</span>";
					 cont = cont + "<span class = 'dot'>.....</span><button class = 'moreBtn'>show more</button>";
				 }	 
			 }
			 else
			 {
				 if(q == 1)
				 {
					 cont = cont + "<span class = 'more'>" + txt.substring(limit) + "</span>";
					 cont = cont + "<span class = 'dot'>.....</span><button class = 'moreBtn'>show more</button>";
				 }
				 else
				 {
					 st = st + limit;
					 ed = ed + limit;
					 cont = cont + "<span class = 'more'>" + txt.substring(st,ed) + "</span>";
					 cont = cont + "<span class = 'more'>" + txt.substring(ed) + "</span>";
					 cont = cont + "<span class = 'dot'>.....</span><button class = 'moreBtn'>show more</button>";
				 }	 
				 
			 }	 
			 
			 
		 }
		 else
		 {
			 //r == 0
			 
			 if(q == 1)
			 {
				 cont = cont;
			 }
			 else
			 {
				 st = st + limit;
				 ed = ed + limit;
				 cont = cont + "<span class = 'more'>" + txt.substring(st,ed) + "</span>";
				 cont = cont + "<span class = 'dot'>.....</span><button class = 'moreBtn'>show more</button>";
			 }	 
			 
		 }	 
		 	 
	 }
	 
	 return cont;
 }
 
 function showMoreBtnActive()
 {
	 //var txt = document.getElementById("inputText").value;
	 
	 //document.getElementById("container").innerHTML = generateComment(txt);
	 var x = document.getElementById("cmts").getElementsByClassName("more");
	 var d = document.getElementById("cmts").getElementsByClassName("dot");
	 var len = x.length;
	 var i;
	 
	 for(i=0;i<len;i++)
	 {
		 x[i].style.display = "none";
	 }
	 
	 var len1 = d.length;
	 for(i=0;i<len1;i++)
	 {
		 d[i].style.display = "inline";
	 }	 
	 
	 
	 var btns = document.getElementById("cmts").getElementsByClassName("moreBtn");
	 var len2 = btns.length;
	 var j;
	 for(j=0;j<len2;j++)
	 {
		 btns[j].addEventListener("click",function(event){
				
			 var x = event.target.parentElement.parentElement.getElementsByClassName("more");
			 var len = x.length;
			 var i;
			 var flag = false;
			 var remFlag = false;
			 for(i=0;i<len;i++)
			 {
				 if(x[i].style.display == "none")
				 {
					 x[i].style.display = "inline";
					 flag = true;
					 break;
				 }	 
			 }
			 
			 if(i == len-1)
			 {
				 var d = event.target.parentElement.parentElement.getElementsByClassName("dot")[0];
				 d.style.display = "none";
				 event.target.innerText = "show less";
			 }	 
			 
			 if(flag == false)
			 {
				 for(i=0;i<len;i++)
				 {
					 x[i].style.display = "none";
				 }
				 event.target.innerText = "show more";
				 var d = event.target.parentElement.parentElement.getElementsByClassName("dot")[0];
				 d.style.display = "inline";
			 }	 
				 
		 });
	 }	 
	 
 }
      
 

</script>


</body>
</html>