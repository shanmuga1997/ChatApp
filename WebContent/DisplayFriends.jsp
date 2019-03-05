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
</style>
<script>
function sendRequest(object)
{
    var toId=object.value;
	var xmlhttp;
	var urls="SendRequest?&toId="+toId;
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
			object.innerText=xmlhttp.responseText;     
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
<div style="padding-left:16px">
</div>
<div align="center">
<div class="modal" >
<font size="4" color="black">
<form method="post" action="Display">
<table>
<tr>
<th>
User name
</th>
<th>
Chat
</th>
</tr>

<c:forEach var="list" items="${list}">
	<tr align="center">
		<td>${list.uname}</td>
		<td><button type="submit"  value=${list.uname } name="toId">chat</button></td>
	</tr>
</c:forEach>
</table>
</form>
</font>
</div>
</div>
</body>
</html>
