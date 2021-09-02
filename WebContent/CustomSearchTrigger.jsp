<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Custom Search Triggerer</title>
</head>
<body>

<input type = "text" id = "idTxt" placeholder = "Enter UserId">
<button id = "myBtn">click</button>

<script>

var x = document.getElementById("myBtn");
x.addEventListener("click",function(){
	
	var userid = document.getElementById("idTxt").value;
	userid = "'" + userid + "'";
	var ingredQuery = "4";
	var choiceQuery = "1";
	var typeQuery = "0";
	var descripQuery = "None";
	var yearQuery = "2020";
	var sortQuery = "views";
	var statusQuery = "query";
	
	var str = generateQuery(ingredQuery,choiceQuery,typeQuery,descripQuery,yearQuery,sortQuery,statusQuery);
	var actionStr = "CustomSearch.jsp?userid=" + userid + "&query=" + str;
	location.href = actionStr;
});

function generateQuery(ingredQuery,choiceQuery,typeQuery,descripQuery,yearQuery,sortQuery,statusQuery)
{
	
	var tempQuery = "'ingred:" + ingredQuery;
	tempQuery = tempQuery + "Rchoice:" + choiceQuery;
	tempQuery = tempQuery + "Rtype:" + typeQuery;
	tempQuery = tempQuery + "Rdescrip:" + descripQuery;
	tempQuery = tempQuery + "Ryear:" + yearQuery;
	tempQuery = tempQuery + "Rsort:" + sortQuery;
	tempQuery = tempQuery + "Rstatus:"+ statusQuery + "'";

	return tempQuery;	
}

</script>

</body>
</html>