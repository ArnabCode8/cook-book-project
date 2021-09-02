<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Account Trigger</title>
</head>
<body>

<input type = "text" id = "userTxt" placeholder = "Enter Your UserId Here">
<button id = "goAcc" onclick = "initiate()">Submit</button>


<script>

function initiate()
{
   	var txt = document.getElementById("userTxt").value;
   	window.alert("User Id : " + txt);
}

</script>

</body>
</html>