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
span
{
color : red;

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
  width: 20%;
  background-color:darkblue;
  color: white;
  padding: 10px 5px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
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
  right: 25%;
  left: 68%;
  padding: 18px 16px;
  transform: translate(0%, -50%);
}
</style>
</head>
<body  background="5.jpg">

<div class="topnav">
  <a href="Home.jsp" href="#home">Signin</a>
   <a  href="signup.jsp">Signup</a>
  <a href="#contact">Contact</a>
  <a href="#about">About</a>
</div>

<div align="center">
<div class="modal">

<ul>
  <li>${error }<span class="close">${button }</span></li>
</ul>

<script>
var closebtns = document.getElementsByClassName("close");
closebtns[0].addEventListener("click", function() {
    this.parentElement.style.display = 'none';
   
  });
</script>
<form method="post" action="ForgetPassword">
<h3>Forget Password</h3>
<table>
<tr>
<td>
<label for="uname">User Name</label>
</td>

<td>
<input type="text" autocomplete="off" id="uname" name="uname" placeholder="Your user name.." required>
</td>
</tr>

<tr>
<td>

</td>

<td>
<span>${UnameError }</span>
</td>
</tr>

</table>
<input type="submit" value="Submit">

</form>
</div>
</div>

</body>
</html>
