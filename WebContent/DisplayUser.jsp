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
color: red;
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
				object.style.color="red";
				
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
</script>

</head>

<body   background="5.jpg">
<div class="topnav">
  <a  href="welcome.jsp">Home</a>
  <a class="active" href="SearchUser">Search</a>
  <a href="DisplayFriends">Chat</a>
  <a href="Logout">Logout</a>
</div>
<div style="padding-left:16px">
</div>
<div align="center">
<div class="modal" >

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
