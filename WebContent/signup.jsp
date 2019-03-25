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
    top: 35%;
    left:20%;
    margin-top: -9em; /*set to a negative number 1/2 of your height*/
    margin-left: -15em;
    height:250px;
    width:25%;
}
p.thicker {
  font-weight: 900;
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
input[type=text],[type=email],[type=password]{
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  
}

input[type=submit] {
  width: 25%;
  background-color:darkblue;
  color: white;
  padding: 14px 5px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  
}



.main {
  border-radius: 5px;
  
  padding: 20px;
}
.otp
{
display: none;
}
</style>

<script>
var output;
var unameFlag=false;
function checkUname(object)
{
	
		    var uname=object.value;
			var xmlhttp;
			var urls;
		    urls="ValidateUserName?&uname="+uname;
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
			      output=xmlhttp.responseText;
			      output=output.trim();
			      document.getElementById("unameError").innerHTML=output;     
			      var str="Username already exists!!Try another name";
			     if(output.localeCompare(str)!=0)
			  	 {
			  		unameFlag=true;
			  	 }
			  }
			  }
			
			xmlhttp.open("POST",urls,true);
			xmlhttp.send();
			
			
			
			
			
			
}
function check()
{
	
  return unameFlag;
}
</script>


</head>
<body  background="5.jpg">

<div class="topnav">
   <a  href="Home.jsp">Signin</a>
   <a class="active" href="signup.jsp">Signup</a>
  <a href="#contact">Contact</a>
  <a href="#about">About</a>
</div>

<div class="modal">
  <form method="post" action="UserSignup" onsubmit="return check()">
    <label for="uname">User Name</label>
    <input type="text" autocomplete="off" id="uname" name="uname" onfocusout="checkUname(this)" placeholder="Your user name.." required>
    <span id="unameError"></span><br><br>
	
    <label for="fullname">Full Name</label>
    <input type="text" autocomplete="off" id="fullname" name="fullname"   placeholder="Your full name.." required>
    <span></span><br><br>
	
	<label for="email">Email</label>
    <input type="email" autocomplete="off" id="email" name="email"  placeholder="Your email id.." required>
    <span> </span><br><br>
	
	
	<label for="gender">Gender</label><br><br>
	<font color="darkblue">
	<input type="radio" name="gender" value="male" required>Male<br><br>
    <input type="radio" name="gender" value="female" required>Female<br><br>
	</font>
	
	<label for="password">Password</label>
    <input type="password" id="password" name="password" placeholder="Your password.." required>
    <span></span><br><br>
	
   <input type="submit" value="Submit">
  </form>
</div>

</body>
</html>
