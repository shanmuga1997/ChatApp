<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
    overflow:scroll;
    overflow-x:hidden;
    overflow-y:scroll;
}
p.thicker {
  font-weight: 900;
}
.Requested
{
padding: 0;
border: none;
background: none;
color: darkblue;
font-size: 20px;
}
.Send
{
padding: 0;
border: none;
background: none;
color: green;
font-size: 20px;
}
th
{
color: darkblue;
font-size: 20px;
}
tr
{
color: darkblue;
font-size: 20px;
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
* {
  box-sizing: border-box;
}

form.search input[type=text] {
  padding: 10px;
  font-size: 17px;
  border: 1px solid grey;
  float: left;
  width: 10%;
  background: #f1f1f1;
}

form.search button {
  float: left;
  width: 3%;
  padding: 10px;
  background: darkblue;
  color: white;
  font-size: 17px;
  border: 1px solid grey;
  border-left: none;
  cursor: pointer;
}

form.search button:hover {
  background: #0b7dda;
}
h2
{
color : darkblue;
font-weight: bold;

}
p
{
color : red;

font-size: 20px;
}
span,a
{
color : darkblue;

font-size: 20px;
}
.show
{
text-decoration: none;
color: darkblue;
}
.show:hover { 
  color: blue;
}
</style>
<script>
function sendRequest(object)
{
	
		    var toId=object.value;
			var xmlhttp;
			var urls;
			var state=object.innerText;
			var send="Send";
			if(state.localeCompare(send)==0)
			{
			   urls="SendRequest?&toId="+toId;
			   object.style.color="darkblue"; 
			   
			}
			else if(state=="Requested")
			{
				urls="WithdrawRequest?&toId="+toId;
				object.style.color="green";
				
			}
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
					if(object.innerText=="Send")
					{
						object.innerText="Requested";
					}
					else
					{
						object.innerText="Send";
					}
					
			  }
			  }
			xmlhttp.open("POST",urls,true);
			xmlhttp.send();
}
function findByUname(object)
{
	    
		var xmlhttp;
		var urls;
	    urls="DisplayUserByUname?&name="+object.value;
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
				document.getElementById("modal").innerHTML=xmlhttp.responseText;
		  }
		  }
		xmlhttp.open("POST",urls,true);
		xmlhttp.send();
}

</script>
</head>

<body   background="5.jpg">
<div class="topnav">
  <a  href="DisplayTimeline">Home</a>
  <a class="active" href="SearchUser">Search</a>
  <a href="DisplayFriends">Chat</a>
  <a href="Timeline.jsp">Timeline</a>
  <a href="Logout">Logout</a>
</div>

<br><br><br><br><br><br><br>

<div style="padding-left:30px">
<h2>Search by</h2>
<form class="search" method="post" action="DisplayUserBySearch">
<span>Username :</span><br><br>
<input type="text"  name="uname" placeholder="Search.."  autocomplete="off" value=${searchUname }>
<button type="submit"><i class="fa fa-search"></i></button><br><br>
<br><br><span>Fullname :</span><br><br>
<input type="text"  name="fname" placeholder="Search.."  autocomplete="off" value=${searchFname }>
<button type="submit"><i class="fa fa-search"></i></button><br><br></form>
<br><br><a class="show" href="SearchUser">show all</a>
</div>

<div align="center">

<div class="modal" id="modal">
<p>${searchError }</p>
<table>
<tr>
<th>
User name
</th>
<th>
Full name
</th>
<th>
Request
</th>
</tr>
<c:forEach var="list" items="${list}">
	<tr align="center">
		<td>${list.uname }</td>
		<td>${list.fullname}</td>
		<td><button type="button"  class=${list.status }  onclick="sendRequest(this)" value=${list.uname } id=${list.uname } >${list.status }</button></td>
	</tr>
</c:forEach>
</table>
</div>
</div>
</body>
</html>
