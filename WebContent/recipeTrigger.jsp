<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Recipe Trigger Page</title>
</head>
<body>

 <input type = "text" id = "recipeid" placeholder = "Enter Recipe Id Here"/>
 <input type = "text" id = "userid" placeholder = "Enter User Id Here"/>
 <button id = "btn" onclick = "goRecipe()">go</button>
 
 <script>
 	
 	function goRecipe()
 	{
 		var rid = document.getElementById("recipeid").value;
 		var uid = document.getElementById("userid").value;
 		rid = "'" + rid + "'";
 		uid = "'" + uid + "'";
 		var actionstr = "showRecipe.jsp?recipeid=" + rid + "&userid=" + uid;
 		location.href = actionstr;
 	}
 
 </script>

</body>
</html>