<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
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
color: darkblue;
border:none
}
.head1
{
 position:fixed;
 top: 48%;
 left: 45%;
 margin-top: -17em;
 margin-left: -20em;
 color: darkblue;
 width: 500px;
 height: 50px;
 padding: 5px;  
}
.timeline
{
 position:fixed;
 top: 55%;
 left: 45%;
 margin-top: -17em;
 margin-left: -20em;
 color: darkblue;
 width: 500px;
 height: 500px;
 padding: 5px;  
 overflow:scroll;
 overflow-x:hidden;
 overflow-y:scroll;
 
}
.head2
{
 position:fixed;
 top: 48%;
 left: 90%;
 margin-top: -17em;
 margin-left: -20em;
 color: darkblue;
 width: 450px;
 height: 50px;
 padding: 5px;  
}
.notifications
{
position:fixed;
top: 67%;
left: 95%;
margin-top: -17em;
margin-left: -20em;
font-style: oblique;
font-size: 20px;
color: red;
width: 500px;
height: 500px;
padding: 5px;  
overflow:scroll;
overflow-x:hidden;
overflow-y:scroll;
}

.name
{
color:darkblue;
}
.content
{
color:darkblue;

}
.modal
{
 text-align: center; 
 line-height: 200px;
 width: 300px;
 height: 200px;
 border: 2px solid darkblue;
 border-radius: 19px;
 padding: 25px;
 
 
}
.like
{
  background-image: url("5.jpg"); 
  color: darkblue; 
  border: 2px solid darkblue;
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
.liked
{
  background-image: url("5.jpg"); 
  color: red; 
  border: 2px solid red;
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
/* width */
::-webkit-scrollbar {
  width: 6px;
  height: 5px;
   cursor: pointer;
}

/* Track */
::-webkit-scrollbar-track {
 
}
 
/* Handle */
::-webkit-scrollbar-thumb {
  background: darkblue; 
  height: 5px;
   cursor: pointer;
}
</style>
<script>
window.setInterval("DisplayNotifications()", 2500);
function DisplayNotifications()
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
		document.getElementById("notifications").innerHTML=xmlhttp.responseText;     
        
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
function getLikes(object)
{
	var xmlhttp;
	var urls="getLikes?&Id="+object.value;
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
		  document.getElementById(object.value).innerHTML=xmlhttp.responseText;      
	  }
	  }
	xmlhttp.open("POST",urls,true);
	xmlhttp.send();
}
function updatelike(object,id,name)
{
    var value=object.value;
	if(value.localeCompare("like")==0)
	{	
	    var xmlhttp;
	    var urls="UpdateLike?&id="+id+"&name="+name;
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
	     if(xmlhttp.readyState==4)
	     {
	    	        object.innerHTML=xmlhttp.responseText; 
		  		    object.value="liked";
		  		    object.style.color="red";		
				    object.style.border="2px solid red";
	      }
	     }
	xmlhttp.open("POST",urls,true);
	xmlhttp.send();
	}
	else
	{
		  var xmlhttp;
		    var urls="DeleteLike?&id="+id;
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
		     if(xmlhttp.readyState==4)
		     {
		    	        object.innerHTML=xmlhttp.responseText; 
			  		    object.value="like";
			  		    object.style.color="darkblue";		
					    object.style.border="2px solid darkblue";
		      }
		     }
		xmlhttp.open("POST",urls,true);
		xmlhttp.send();
		
   	 }
}
function changeColour(object)
{
	if(object.style.color=="darkblue")
	{
		object.style.color="darkblue";
	}
	else
	{
		object.style.color="red";		
	}
	
}
function changeRefreshColour(object)
{
	if(object.style.color=="darkblue")
	{
		object.style.color="blue";
	}
	else
	{
		object.style.color="darkblue";		
	}
	
}
function changeNotificationColour(object)
{
	if(object.style.color=="red")
	{
		object.style.color="red";
	}
	else
	{
		object.style.color="blue";		
	}
	
}
function displayLikes(id)
{
	 var xmlhttp;
	 var urls="DisplayLikes?&id="+id;
  	 if(window.XMLHttpRequest)
	    {
	      xmlhttp=new XMLHttpRequest();
	    }
	    else
	    {
	      xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	    }
	    xmlhttp.onreadystatechange=function()
	    {
	     if(xmlhttp.readyState==4)
	     {
	    	       var x=xmlhttp.responseText;
	    	       x=x+" "+"like";
	    	       document.getElementById(id).innerText=x; 
	      }
	     }
	xmlhttp.open("POST",urls,true);
	xmlhttp.send();
	
}
function hideLikes(id)
{
	document.getElementById(id).innerText=" "; 
}
function removeNotification(id)
{
	    var xmlhttp;
	    var urls="DeleteNotification?&id="+id;
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
	     if(xmlhttp.readyState==4)
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
  <a class="active" href="DisplayTimeline">Home</a>
  <a  href="SearchUser">Search</a>
  <a href="DisplayFriends">Chat</a>
   <a href="Timeline.jsp">Timeline</a>
  <a href="Logout">Logout</a>
</div>

<br>
<p><font color="darkblue" size="5">Hai ${uname } !!!</font></p>
<div class="head2">
<h3>Notification</h3>
</div>
<div id=notifications class="notifications">

</div>
<div class="head1">
<h3>Timeline   <i class='fa fa-refresh' style='font-size:18px;color:darkblue' onmouseover="changeRefreshColour(this)" onmouseout="changeRefreshColour(this)"  onclick="location.reload();"></i></h3>
</div>
<div id="timeline" class="timeline">
<span style='color:red;font-size:20px'>${noposts }</span>
<c:forEach var="list" items="${list}">
		   <h4 class="name"><i class='far fa-hand-point-right' style='font-size:20px;color:darkblue'></i>  ${list.fname }  </h4>
		   <div class="modal" >
		   <span class="content">${list.content}</span><br><br>
		   </div>
		   <br>
		   <button type="button"   class=${list.flag } value='${list.flag }' onmouseover="displayLikes('${list.id }')" onmouseout="hideLikes('${list.id }')" onclick="updatelike(this,'${list.id }','${list.fname }')" >${list.flag } <i class="fa fa-heart"></i></button>
		   <span id='${list.id }'></span>
</c:forEach>
</div>

</body>
</html>
