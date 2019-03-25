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
.forgetpassword
{
color:red;
}
.modal {
   position:fixed;
    top: 50%;
    left:50%;
    margin-top: -9em; /*set to a negative number 1/2 of your height*/
    margin-left: -15em;
	
    height:250px;
    width:25%;
   
}
p.thicker {
  font-weight: 900;
}

h3,label
{
color : darkblue;
font-weight: bold;

}

input[type=text],[type=email],[type=password]{
  width: 50%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;

}

input[type=submit] {
  width: 20%;
  background-color:darkblue;
  color: white;
  padding: 10px 5px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}


</style>
</head>
<body  background="5.jpg">

<div class="topnav">
  <a class="active" href="#home">Signin</a>
   <a  href="signup.jsp">Signup</a>
  <a href="#contact">Contact</a>
  <a href="#about">About</a>
</div>

<div align="center">
<div class="modal">
<font color="red" size="5">
${error }
</font>
<form method="post" action="ChangePassword">
<h3>Password Reset</h3>


<label for="uname">User Name</label>
<input type="text" autocomplete="off" id="uname" name="uname" value=${uname } required>
<span></span><br><br>

<label for="password">Password</label>
<input type="password" autocomplete="off" id="password" name="password" placeholder="Your password.." required>
<span></span><br><br>

<input type="submit" value="change"><br><br>

</form>
</div>
</div>

</body>
</html>
