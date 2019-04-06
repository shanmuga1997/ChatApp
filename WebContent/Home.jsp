<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/Home.css">
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

<ul>
  <li>${error }<span class="close">${button }</span></li>
</ul>

<script>
var closebtns = document.getElementsByClassName("close");
closebtns[0].addEventListener("click", function() {
this.parentElement.style.display = 'none';
});
</script>

<form method="post" action="UserLogin">
<h3>Login</h3>


<label for="uname">User Name</label>
<input type="text" autocomplete="off" id="uname" name="uname" placeholder="Your user name.." required>
<span></span><br><br>

<label for="password">Password</label>
<input type="password" autocomplete="off" id="password" name="password" placeholder="Your password.." required>
<span></span><br><br>

<input type="submit" value="Signin"><br><br>
<a class="forgetpassword" href="ForgetPassword.jsp">Forget Password?</a>
</form>
</div>
</div>

</body>
</html>
