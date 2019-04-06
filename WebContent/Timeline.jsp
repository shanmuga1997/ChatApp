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
input[type=text]{
  width: 25%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  
}
label
{
color : darkblue;
font-weight: bold;

}
span
{
color: red;
}
input[type=submit] {
  width: 10%;
  background-color:darkblue;
  color: white;
  padding: 14px 5px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  
}

.content
{
border-radius: 12px;
border:solid 1px darkblue;
}
ul{
  list-style-type: none;
  padding: 0;
  margin: 0;
}
ul li {
 
  margin-top: -1px; 
  padding: 12px;
  text-decoration: none;
  font-size: 20px;
  color: red;
  display: block;
  position: relative;
}
.close {
  cursor: pointer;
  position: absolute;
  top: 50%;
  right: -10%;
  left: 20%;
  padding: 18px 16px;
  transform: translate(0%, -50%);
}

</style>
<script>
function changeColour(object)
{
	if(object.style.color=="green")
	{
		object.style.color="black";
	}
	else
	{
		object.style.color="green";		
	}
	
}
</script>
</head>

<body  background="5.jpg">

<div class="topnav">
  <a  href="DisplayTimeline">Home</a>
  <a  href="SearchUser">Search</a>
  <a href="DisplayFriends">Chat</a>
  <a class="active">Timeline</a>
  <a href="Logout">Logout</a>
</div>
<br><br><br>

<div style="padding-left:50px">

<ul>
  <li>${msg }<span class="close">${button }</span></li>
</ul>

<script>
var closebtns = document.getElementsByClassName("close");
closebtns[0].addEventListener("click", function() {
this.parentElement.style.display = 'none';
});
</script>

<form  method="post" action="InsertStatus">
   <label for="content">Status</label>
   <br><br>
  <textarea name="content" class="content" rows="8" cols="30" ></textarea>
   
  <br><br><label for="tag">Tag Friends</label>
  <br><br><input type="submit" value="Upload">
</form>

</div>



</body>
</html>
