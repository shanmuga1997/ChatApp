<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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


.head1{
  
    position:fixed;
    display: none;
    top: 50%;
    left: 45%;
    margin-top: -17em;
    margin-left: -20em;
    color: darkblue;
    width: 400px;
    height: 50px;
    padding: 5px;  
    
}
.modal1
{
    position:fixed;
    display: none;
    top: 62%;
    left: 45%;
    margin-top: -17em;
    margin-left: -20em;
    color: darkblue;
    width: 400px;
    height: 350px;
    padding: 5px;  
    overflow:scroll;
    overflow-x:hidden;
    overflow-y:scroll;

}
.msg1
{
    position:fixed;
    display: none;
    top: 110%;
    left: 45%;
    margin-top: -17em;
    margin-left: -20em;
    color: darkblue;
    width: 400px;
    height: 100px;
    padding: 5px;  


}
.head2
{
    display: none;
    position:fixed;
    top: 50%;
    left: 90%;
    /*set to a negative number 1/2 of your height*/
    margin-top: -17em;
    margin-left: -20em;
     color: darkblue;
     width: 400px;
     height: 50px;
     padding: 5px;  
}
.modal2
{
    position:fixed;
    display: none;
    top: 62%;
    left: 90%;
    margin-top: -17em;
    margin-left: -20em;
    color: darkblue;
    width: 400px;
    height: 350px;
    padding: 5px;  
    overflow:scroll;
    overflow-x:hidden;
    overflow-y:scroll;

}
.msg2
{
    position:fixed;
    display: none;
    top: 110%;
    left: 90%;
    margin-top: -17em;
    margin-left: -20em;
    color: darkblue;
    width: 400px;
    height: 100px;
    padding: 5px;  


}


p.thicker {
  font-weight: 900;
}

.close {
  color: darkblue;
  position: absolute;
  top: 6%;
  right: -7%;
  left: 70%;
  font-size: 28px;
  font-weight: bold;
  border: none;
  background: none;
}

.close:hover,
.close:focus {
  color: blue;
  text-decoration: none;
  cursor: pointer;
}

.send {
  width: 20%;
  background-color:darkblue;
  color: white;
  padding: 10px 5px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  border-radius: 12px;
}
td
{
color: green;
font-size: 18px;
}
.button
{
 background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 18px;
  margin: 4px 2px;
  -webkit-transition-duration: 0.4s; /* Safari */
  transition-duration: 0.4s;
  cursor: pointer;
  border-radius: 12px;
}
.toId{
   background-image: url("5.jpg"); 
  color: green; 
  border: 2px solid green;
}

.toId:hover {
 border: 2px solid darkblue;
  color: darkblue;
}



/* width */
::-webkit-scrollbar {
  width: 8px;
  height: 10px;
}

/* Track */
::-webkit-scrollbar-track {
 
}
 
/* Handle */
::-webkit-scrollbar-thumb {
  background: #888; 
  height: 5px;
}

/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
  background: #555; 
}
.inbox
{
border-radius: 12px;
}


</style>
<script>
var fromId='${uname}';
var toId=null;
var toId2=null;
var element;
window.setInterval("DisplayLastSeen(toId,'LastSeen')", 2500);
window.setInterval("DisplayMessage(toId,'modal1')", 2500);
window.setInterval("DisplayLastSeen(toId2,'LastSeen2')", 2500);
window.setInterval("DisplayMessage(toId2,'modal2')", 2500);
function process(e) {
    var code = (e.keyCode ? e.keyCode : e.which);
    if (code == 13) { //Enter keycode
    	if(document.getElementById("message").value==" ")
    	{
    	return;	
    	}
    
    	updateMessage(toId,"message","modal1");
    }
}
function process2(e) {
    var code = (e.keyCode ? e.keyCode : e.which);
    if (code == 13) { //Enter keycode
    	if(document.getElementById("message2").value==" ")
    	{
    	return;	
    	}
    	updateMessage(toId2,"message2","modal2");
    }
}
function changeBlue(object)
{
	    object.style.color="darkblue";
		object.style.border="2px solid darkblue";
	
}
function changeGreen(object)
{
	       var str=object.value;
	       object.style.color="green";
	       object.style.border="2px solid green";
		   
	 
}
function load(object)
{
  var str1=object.value;
  if(str1.localeCompare(toId)!=0 && str1.localeCompare(toId2)!=0)
  {
	  
	  
    if(toId==null)
    {
		toId=object.value;
		document.getElementById("name").innerHTML=toId;
		document.getElementById("head1").style.display = "block";
		document.getElementById("modal1").style.display = "block";
		document.getElementById("msg1").style.display = "block";	
		
	}
	else 
	{
		if(toId2!=null)
		{
			document.getElementById(toId2).style.color="green";
			toId2=null;
		}
		toId2=object.value;
		document.getElementById("name2").innerHTML=toId2;
		document.getElementById("head2").style.display = "block";	
		document.getElementById("modal2").style.display = "block";
		document.getElementById("msg2").style.display = "block";	
	
	}
	document.getElementById(object.value).style.color="darkblue";
	object.style.color="darkblue";
	object.style.border="2px solid darkblue";
	
  }
}
function exit()
{
	document.getElementById("head1").style.display = "none";
	document.getElementById("modal1").style.display = "none";
	document.getElementById("msg1").style.display = "none";
	document.getElementById(toId).style.color="green";
    toId=null;
}
function exit2()
{
	document.getElementById("head2").style.display = "none";
	document.getElementById("modal2").style.display = "none";
	document.getElementById("msg2").style.display = "none";
	document.getElementById(toId2).style.color="green";
	toId2=null;
	
}
function DisplayLastSeen(id,ptr)
{
	var xmlhttp;
	var urls="DisplayLastSeen?"+"&fromId="+fromId+"&toId="+id;
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
			document.getElementById(ptr).innerHTML=xmlhttp.responseText;     
	  }
	  }
	xmlhttp.open("POST",urls,true);
	xmlhttp.send();
	
}
function DisplayMessage(id,ptr)
{
var xmlhttp;
var urls="Inbox?"+"&fromId="+fromId+"&toId="+id;
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
		document.getElementById(ptr).innerHTML=xmlhttp.responseText;     
		element = document.getElementById(ptr);
	    element.scrollTop = element.scrollHeight;
		
  }
  }
xmlhttp.open("POST",urls,true);
xmlhttp.send();
}
function updateMessage(id,ptr1,ptr2)
{
var xmlhttp;
var message=document.getElementById(ptr1).value;
if(message==" ")
{
	return;
}

var urls="InsertMessage?message="+message+"&fromId="+fromId+"&toId="+id;
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
           document.getElementById(ptr1).value=" ";   
           element = document.getElementById(ptr2);
   	       element.scrollTop = element.scrollHeight;
   		
    }
  }
xmlhttp.open("POST",urls,true);
xmlhttp.send();
}
function active(id)
{
	var xmlhttp;
	var urls="UpdateLastSeen?"+"&fromId="+fromId+"&toId="+id+"&status=typing...";
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
function Inactive(id)
{
	var xmlhttp;
	var urls="UpdateLastSeen?"+"&fromId="+fromId+"&toId="+id+"&status=Online";
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
  <a href="DisplayTimeline">Home</a>
  <a href="SearchUser">Search</a>
  <a class="active" href="DisplayFriends">Chat</a>
  <a href="Timeline.jsp">Timeline</a>
  <a href="Logout">Logout</a>
</div>

<br><br><br>


<div class="users" style="padding-left:16px">

<form method="post" action="Display">
<table>
<c:forEach var="list" items="${list}">
	<tr align="center">
		<td id=${list.uname }>${list.uname}</td>
		<td><button type="button" value=${list.uname } onclick="load(this)" name=${list.uname } class="button toId"  onmouseover="changeBlue(this)" onmouseout="changeGreen(this)">chat</button></td>
	</tr>
</c:forEach>
</table>
</form>
</div>

<div id="head1" class="head1" >
<button class="close" onClick="exit()">&times;</button>
<h3 id="name"></h3>
<span id="LastSeen"></span>
<br>
<span>-----------------------------------------------</span>
</div>

<div id="modal1" class="modal1">
</div>

<div id="msg1" class="msg1">
<textarea class="inbox" rows="6" name="message" id="message" cols="28" onfocusin="active(toId)" onfocusout="Inactive(toId)" onkeypress="process(event,this)"  style="border:solid 1px darkblue;">
</textarea>
<br>
<input class="send" type="button" value="send" id="send1" onClick='updateMessage(toId,"message","modal1")'>
</div>


<div id="head2" class="head2" >
<button class="close" onClick="exit2()">&times;</button>
<h3 id="name2"></h3>
<span id="LastSeen2"></span>
<br>
<span>-----------------------------------------------</span>
</div>

<div id="modal2" class="modal2">
</div>


<div id="msg2" class="msg2">
<textarea class="inbox" rows="6" id="message2" cols="28" onfocusin="active(toId2)" onfocusout="Inactive(toId2)"  onkeypress="process2(event,this)" style="border:solid 1px darkblue;">
</textarea>
<br>
<input class="send" type="button" value="send" onClick='updateMessage(toId2,"message2","modal2")'>
</div>
</body>
</html>
