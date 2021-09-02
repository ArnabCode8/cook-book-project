<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>

<script>

    //storing all mails globally
    var allmails;
    var allchoices;
    var umail;
    var placeStr = "Enter Your Email Id Here";
    var k = 1;
    var lenPlace = placeStr.length;
    var myTimer;

	function initiate()
	{
		
		setDynamicPlaceHolder();
		
		var x = document.getElementById("addgmail");
		x.addEventListener("click",activeGmailButton);
		
		var y = document.getElementById("mail");
		y.addEventListener("keyup",activeMailText);
		
		var z = document.getElementById("guest");
		z.addEventListener("click",guestLogin);
	}
	
	function guestLogin()
	{
		window.alert("Logging In as Guest, Welcome to the Site");
	}
	
	function activeGmailButton(event)
	{
		var x = document.getElementById("mail").value;
		x = x + "@gmail.com";
		document.getElementById("mail").value = x;
		findMail(x);
	}
	
	function activeMailText(event)
	{
		var x = event.target;
		var mailTxt = x.value;
		
		if(mailTxt.length > 0)
		{
		   findMail(mailTxt);
		}
		else
		{
			window.alert("can't leave this empty");
			document.getElementById("rest").innerHTML = "";
			//setDynamicPlaceHolder();
			// this func was triggered twice, one was estinguished by stop, others not, hence interval error

		}	
	}

	function findMail(txt)
	{
		var i;
		if(txt.length > 0)
		{
			for(i = 0;i<allmails.length;i++)
			{
				if(txt == allmails[i].email)
				{
					var cont = "<h2>matched with : <span>" + allmails[i].username + " </span></h2>";
					cont = cont + "<button id = 'login'>Login</button>";
					umail = allmails[i].email;
					document.getElementById("rest").innerHTML = cont;
					document.getElementById("login").addEventListener("click",goLogin);
					break;
				}	
			}
			
			if(i == allmails.length)
			{
				if(validateEmail(txt) == false)
				{
					document.getElementById("rest").innerHTML = "<h2>Not A Valid Email-Id</h2>";
				}
				else
				{
					var cont = "<h2>Matched with None</h2>";
					cont = cont + "<button id = 'register'>Register</button>";
					document.getElementById("rest").innerHTML = cont;
					
					document.getElementById("register").addEventListener("click",goRegister);
				}
					
			}	
			
		}	
	}
	
	function choiceSelector()
	{
		var cont = "<tr><td colspan='2'><select id = 'selectChoice'>";
		var len = allchoices.length;
		var i;
		
		for(i=0;i<len;i++)
		{
			cont = cont + "<option>" + allchoices[i].name + "</option>";	
		}	
	
		cont = cont + "</select></td><td><button id = 'addSelect'>add</button></tr></tr>";
		
		return cont;
	}
	
	function goRegister(event)
	{
		stopDynamicPlaceHolder();
		
		//loads all choices by json to allchoices
		//allChoices();
		
		var txt = document.getElementById("mail").value;
		window.alert("Registering with the email : " + txt);
		var cont = "<table id = 'regContainer' border = '1'>";
		cont = cont + "<tr><td><h2  id = 'rmail'>" + txt + "</h2></td></tr>";
		cont = cont + "<tr><td colspan='3'><input type = 'text' id = 'name' placeholder = 'Enter Name'></td></tr>";
		cont = cont + "<tr id = 'choiceSelected'></tr>";
		cont = cont + choiceSelector();
		cont = cont + "<tr><td><button id = 'reg'>submit</button></td><td><button id = 'back'>back</button></td></tr>";
		cont = cont + "</table>";
		document.getElementById("firstCont").innerHTML = cont;
		document.getElementById("rest").innerHTML = "";
		
		//now activate register table functionality
		
		regContActive();
		
	}
	
	function regContActive()
	{
		//activating back button
		document.getElementById("back").addEventListener("click",function(){
			
			putFirstCont();
		});
		
		//activating addSelector
		document.getElementById("addSelect").addEventListener("click",function(){
			
			var txt = document.getElementById("selectChoice").value;
			addSelectTags(txt);
			activateSelectedTags();
		});
		
		
		document.getElementById("reg").addEventListener("click",function(){
			
			var mail = document.getElementById("rmail").innerText;
			var name = document.getElementById("name").value;
			var x = document.getElementById("choiceSelected").getElementsByClassName("choice");
			if(name == "")
			{
				window.alert("Fill the Name");
				document.getElementById("name").select();
			}
			else if(x.length == 0)
			{
				window.alert("Select Some Choice")
				document.getElementById("selectChoice").focus();
			}
			else
			{
				var str = "";
				var i;
				var len = x.length;
				for(i=0;i<len;i++)
				{
					if(i == 0)
					{
						str = str + txtToChoiceId(x[i].innerText)
					}
					else
					{
						str = str + " " + txtToChoiceId(x[i].innerText)
					}	
				}	
				
				var r = confirm("Registering with: mail:" + mail + " name: " + name + " choices: " + str + " ???");
				if(r == true)
				{
					registerFinally(mail,name,str);
				}
				else
				{
					window.alert("Registration Cancelled");
				}	
			}	
		});
		
	}
	
	function txtToChoiceId(txt)
	{
		var len = allchoices.length;
		var i;
		var str;
		for(i=0;i<len;i++)
		{
			if(allchoices[i].name == txt)
			{
				str = String(allchoices[i].choiceid);
				return str;
			}	
		}	
	}
	
	function registerFinally(mail,name,choices)
	{
		//to register servlet
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function(){
			
			if(this.readyState == 4 && this.status == 200)
			{
				var result = this.responseText;
				var jsonObj = JSON.parse(result);
				
				if(jsonObj == "Successful")
				{
					window.alert(name + " : Registration Successful");
					location.href = "index.jsp";
				}
				else
				{
					window.alert("Registration Failed");
				}	
			}	
		};
		
		var actionstr = "userregister?mail=" + mail + "&name=" + name + "&choices=" + choices;
		xhttp.open("GET",actionstr,true);
		xhttp.send();
		
	}
	
	
	function activateSelectedTags()
	{
		var choices = document.getElementsByClassName("choice");
		var len = choices.length;
		var i;
		
		for(i=0;i<len;i++)
		{
			choices[i].addEventListener("click",deleteSelectedTags);
		}	
		
		//var row = document.getElementById("choiceSelected");
	}
	
	function deleteSelectedTags(event)
	{
		var row = event.target.parentElement.parentElement;
		var txt = event.target.innerText;
		var choices = document.getElementsByClassName("choice");
		var len = choices.length;
		var i;
		
		for(i=0;i<len;i++)
		{
			if(choices[i].innerText == txt)
			{
				break;
			}	
		}
		
		var r = confirm("Delete " + txt + " ?")
		if(r == true)
		{
			row.deleteCell(i);
			activateSelectedTags();
			
			var x = document.getElementById("selectChoice");
			var option = document.createElement("option");
			option.text = txt;
			x.add(option);
		}
		
	}
	
	function makeSelectedTag(txt)
	{
		var cont = "<button class = 'choice'>" + txt + "</button>";
		return cont;
	}
	
	function isAllSelected()
	{
		
		//checking is all are included except ALL, then discard every options, and just keep ALL
		if(document.getElementById("selectChoice").length == 1 && document.getElementById("selectChoice").value == "All")
		{
			window.alert("All Substitute working");
			var d = document.getElementById("choiceSelected");
			var dd = document.getElementById("choiceSelected").getElementsByClassName("choice");
			var x = document.getElementById("selectChoice");
			var len = dd.length;
			var i;
			
			window.alert("Number of selected choices : " + len);
			
			for(i=0;i<len;i++)
			{
				var option = document.createElement("option");
				option.text = d.getElementsByClassName("choice")[0].innerText;
				x.add(option);
				
				d.deleteCell(0);
			}	
			
			//everything are moved back to select list and now have to remove all
			
			var cell = document.getElementById("choiceSelected").insertCell(0);
			cell.innerHTML = makeSelectedTag("All");
			
			
			len = x.length;
			for(i=0;i<len;i++)
			{
				if(x.options[i].value == "All")
				{
					break;
				}	
			}	
			
			x.remove(i);
		}	
		
		//better to keep it in a function, beacuse have to call it in a few places
	}
	
	function addSelectTags(txt)
	{
		var choices = document.getElementsByClassName("choice");
		var x = document.getElementById("selectChoice");
		
		if(choices.length == 0)
		{
			var cell = document.getElementById("choiceSelected").insertCell(choices.length);
			cell.innerHTML = makeSelectedTag(txt);
			x.remove(x.selectedIndex);
			
			isAllSelected();
		}
		else
		{
			var len = choices.length;
			var i;
			
			if(txt == "All")
			{
				if(choices[0].innerText == txt)
				{
					window.alert("All is Selected Already");
					return;
				}	
				
				var row = document.getElementById("choiceSelected");
				
				for(i=0;i<len;i++)
				{
					//add the deleted names to the list back again
					var option = document.createElement("option");
					option.text = row.getElementsByClassName("choice")[0].innerText;
					x.add(option);
					
					row.deleteCell(0);
					
				}
				
				var c = row.insertCell(0);
				c.innerHTML = makeSelectedTag(txt);
                x.remove(x.selectedIndex);
				
				return;
			}
			
			for(i=0;i<len;i++)
			{
				if(choices[i].innerText == "All")
				{
				   window.alert("All is Selected Already");
				   return;
				}	
				
				if(choices[i].innerText == txt)
				{
					window.alert("can't select same choice twice");
					break;
				}	
			}
			
			if(i == len)
			{
				var cell = document.getElementById("choiceSelected").insertCell(choices.length);
				cell.innerHTML = makeSelectedTag(txt);
				x.remove(x.selectedIndex);
				isAllSelected();
			}	
		}
		
		
		//here will be the tags activation function call
		//end of the function
	}
	
	function validateEmail(str)
	{
		var tlen = str.length;
		var j = str.indexOf(".com");
		var st = str.indexOf("@");
		var ed = str.lastIndexOf("@");
		
		if(tlen > 4 && j!= -1 && tlen - j == 4 && st > 0 && st == ed)
		{
			return true;
		}
		
	return false;	
	}
	
	function goLogin(event)
	{
		window.alert("Logging in with : " + umail);
	}
	
	function allMails()
	{
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function(){
			
			if(this.readyState == 4 && this.status == 200)
			{
				var result = this.responseText;
				var jsonObj = JSON.parse(result);
				if(jsonObj.length > 0)
				{
					allmails = jsonObj;
				}
			}	
			
		};
		
		var actionstr = "allusers";
		xhttp.open("GET",actionstr,true);
		xhttp.send();
	}
	
	function allChoices()
	{
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function(){
			
			if(this.readyState == 4 && this.status == 200)
			{
				var result = this.responseText;
				var jsonObj = JSON.parse(result);
				
				if(jsonObj.length > 0)
				{
					window.alert("All Choices are loaded");
					allchoices = jsonObj; //allchoices
					
					window.alert("Length : " + allchoices.length);
				}
				else
				{
					window.alert("No Choices in the database");
				}	
			}	
		};
		
		var actionstr = "allchoices";
		xhttp.open("GET",actionstr,true);
		xhttp.send();
	}
	
	
	function setDynamicPlaceHolder()
	{
		//window.alert("Starting placeholder");
		
		myTimer = setInterval(function(){ 
			document.getElementById("mail").placeholder = placeStr.substring(0,k);
			k = k + 1;
			
			if(k == lenPlace)
			{
				k = 1;
			}
		
		},1000);
	}
	
	function stopDynamicPlaceHolder()
	{
		//window.alert("Stopping placeholder");
		clearInterval(myTimer);
	}
	

	function putFirstCont()
	{
		var cont = "<input type = 'text' id = 'mail' placeholder = 'Enter Your Email Id Here'/>";
		cont = cont + "<button id = 'addgmail'>@gmail.com</button>";
		cont = cont + "<button id = 'guest'>Login As Guest</button>";
		
		document.getElementById("firstCont").innerHTML = cont;
		
		allMails(); //stores all mail id at once in the clinet side, so not to exhaust the ajax
		allChoices(); // stores all the choices 
		initiate(); //initiates all the functionalities
	}
	
	
</script>




</head>
<body>

<p id = "firstCont"></p>
<p id = "rest"></p>

<script>

    putFirstCont();

</script>



</body>
</html>