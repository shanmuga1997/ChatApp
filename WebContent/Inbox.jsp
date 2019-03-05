<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

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
<body style="background-color:lightblue">
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