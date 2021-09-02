<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile Trigger</title>

<style>

	#userid
	{
		height: 50px;
		width: 300px;
		font-size: 20px;
		font-weight: bold;
		border-radius: 20px;
		text-align: center;
	}
	
	#userid:focus
	{
		box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);	
	}

</style>


</head>
<body>

<input type = "text" id = "userid" placeholder = "Enter userid here"/>
<br/><br/><br/><button onclick = "submitUser()">submit</button>

<script>

	function submitUser()
	{
		var uid = document.getElementById("userid").value;
		if(uid == "")
		{
			window.alert("cant leave this empty");
		}
		else
		{
			window.alert("userid : " + uid);
			var actionstr = "profile.jsp?userid='" + uid + "'";
			location.href = actionstr;
		}	
	}


</script>



</body>
</html>