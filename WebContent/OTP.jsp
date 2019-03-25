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
.resend
{
color:red;
padding: 0;
border: none;
background: none;
font-size: 15px;
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
h3
{
color : darkblue;
font-weight: bold;


}
td
{
color : darkblue;
font-weight: bold;
 

}

.name{
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  padding:10px;
}
.otp {
 
 width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  padding:10px;
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
h5
{
color: darkblue;
}

</style>
<script>
function refresh() {
  location.reload();
}
</script>
</head>
<body  background="5.jpg">

<div class="topnav">
  <a  href="Home.jsp">Signin</a>
   <a  href="signup.jsp">Signup</a>
  <a href="#contact">Contact</a>
  <a href="#about">About</a>
</div>

<div align="center">
<div class="modal">
<form method="post" action="ValidateOTP">
<h3>Forget Password</h3>
<h5>OTP has send to your mail!</h5>
<input type="hidden" id="validotp" name="validotp" value=${validotp }>
<table align="center">
<tr>
<td>
Username
</td>
<td>
<input type="text" class="name" name="uname" id="uname" value=${unameOTP } readonly="true" autocomplete="off" required><br><br>
</td>
</tr>
<tr>
<td>
OTP
</td>
<td>
<input type="text" class="otp" name="otp" id="otp" autocomplete="off" required>
</td>
</tr>
</table>
<input type="submit" value="submit"><br><br>
<button class="resend" onclick="refresh()">resend OTP</button>
</form>
</div>
</div>

</body>
</html>
