<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

.topnav {
  overflow: hidden;
  background-color:#00005A;
}

.topnav a {
  float: left;
  color:#f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
background-image: url("5.jpg");
  color:black;
}

.topnav a.active {
 background-image: url("5.jpg");
   background-color: #ddd;
  color:black;
}
p.thicker {
  font-weight: 900;
}
.accept
{
padding: 0;
background: none;
font-size: 15px;
border:none
}
.div1
{
width: 500px;
height: 200px;
border: 1px blue;
}
div.notification
{
font-style: italic;
color: red;
font-size: 25px;
}
h4.notification
{
font-style: italic;
color: darkblue;
font-size: 20px;
}
}
</style>
<script>
window.setInterval("DisplayNotification()", 2500);
function DisplayNotification()
{
var xmlhttp;
var urls="DisplayRequest";
if (window.XMLHttpRequest)
  {
  xmlhttp=new XMLHttpRequest();
  }
else
  {
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
  xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4)
  {
		document.getElementById("notification").innerHTML=xmlhttp.responseText;     
        
  }
  }
xmlhttp.open("POST",urls,true);
xmlhttp.send();
}

function acceptRequest(object)
{
	var xmlhttp;
	var urls="AcceptRequest?&toId="+object.value;
	if (window.XMLHttpRequest)
	  {
	  xmlhttp=new XMLHttpRequest();
	  }
	else
	  {
	  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	  }
	  xmlhttp.onreadystatechange=function()
	  {
	  if (xmlhttp.readyState==4)
	  {
			 
	        
	  }
	  }
	xmlhttp.open("POST",urls,true);
	xmlhttp.send();
}
function rejectRequest(object)
{
	var xmlhttp;
	var urls="WithdrawRequest?&toId="+object.value;
	if (window.XMLHttpRequest)
	  {
	  xmlhttp=new XMLHttpRequest();
	  }
	else
	  {
	  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	  }
	  xmlhttp.onreadystatechange=function()
	  {
	  if (xmlhttp.readyState==4)
	  {
			 
	        
	  }
	  }
	xmlhttp.open("GET",urls,true);
	xmlhttp.send();
}
function changeColour(object)
{
	object.style.color="green";
}
</script>
</head>

<body  background="5.jpg">
<div class="topnav">
  <a class="active" href="welcome.jsp">Home</a>
  <a  href="SearchUser">Search</a>
  <a href="DisplayFriends">Chat</a>
  <a href="Logout">Logout</a>
</div>
<br>
<div style="padding-left:16px">
<font size="5" color="darkblue">
Hai  ${uname } !!!
</font>
</div>
<br>
<h4 align="center" class="notification">Notification</h4>
<br>
<div align="center" >
<div class="notification" id="notification" class="div1">
</div>
</div>
</body>
</html>
