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

.modal {
    position:fixed;
    top: 50%;
    left: 50%;
    margin-top: -9em; /*set to a negative number 1/2 of your height*/
    margin-left: -15em;
	
    height:250px;
    width:35%;
   
}
p.thicker {
  font-weight: 900;
}

  
  
</style>

<script>
var fromId='${fromId}';
var toId='${toId}';
window.setInterval("DisplayMessage()", 2500);
window.setInterval("DisplayLastSeen()", 2500);
function DisplayLastSeen()
{
	var xmlhttp;
	var urls="DisplayLastSeen?"+"&fromId="+fromId+"&toId="+toId;
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
			document.getElementById("LastSeen").innerHTML=xmlhttp.responseText;     
	  }
	  }
	xmlhttp.open("POST",urls,true);
	xmlhttp.send();
	
}
function DisplayMessage()
{
var xmlhttp;
var urls="Inbox?"+"&fromId="+fromId+"&toId="+toId;
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
		document.getElementById("auto").innerHTML=xmlhttp.responseText;     
  }
  }
xmlhttp.open("POST",urls,true);
xmlhttp.send();
}
function updateMessage()
{
var xmlhttp;
var message=document.getElementById("message").value;
var urls="InsertMessage?message="+message+"&fromId="+fromId+"&toId="+toId;
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
           document.getElementById("message").value=" ";        
    }
  }
xmlhttp.open("POST",urls,true);
xmlhttp.send();
}
function active()
{
	var xmlhttp;
	var urls="UpdateLastSeen?"+"&fromId="+fromId+"&toId="+toId+"&status=typing...";
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
function Inactive()
{
	var xmlhttp;
	var urls="UpdateLastSeen?"+"&fromId="+fromId+"&toId="+toId+"&status=Online";
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
</script>

</head>
<body  background="5.jpg">
<div class="topnav">
  <a href="welcome.jsp">Home</a>
  <a href="SearchUser">Search</a>
  <a class="active" href="DisplayFriends">Chat</a>
  <a href="Logout">Logout</a>
</div>

<div id="name">
<h3>${toId}</h3>
<span id="LastSeen"></span>
<br>
<span>-----------------------</span>
</div>
<div id="auto">
</div>
<textarea rows="4" id="message" cols="50" onfocusin="active()" onfocusout="Inactive()">
</textarea>
<br>
<input type="button" value="send" onClick='updateMessage()'>






</body>
</html>
