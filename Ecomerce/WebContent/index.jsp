<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup.css">
<meta charset="ISO-8859-1">
<title>SignUp here</title>
</head>
<body>
<div id='container'>
  <div class='signup'>-
  <form action="signupAction.jsp" method="post">
  
  <input type="text" name="name" placeholder="Enter Name">
  <input type="email" name="email" placeholder="Enter Email">
  <input type="number" name="MobileNumber" placeholder="Enter Mobile Number">
  <select name="sequrityQ" >
  <option value="What was your first Car">What was your first Car</option>
  <option value="What was your first Teacher">What was your first Teacher</option>
  <option value="What was your first Friend">What was your first Friend</option>
  <option value="What was your first doctor">What was your first doctor</option>
  </select>
   <input type="text" name="sequrityA" placeholder="Enter Answer">
   <input type="password" name="password" placeholder="Enter password">
   <input type="submit" value="signup">
  
  </form>
    
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whysign'>
<% 
String msg=request.getParameter("msg");
if("valid".equals(msg))
{%>
<h1>Successfully Registerd</h1>

<%}%>
 
<%if("invalid".equals(msg)){ %>
<h1>Some thing Went Wrong! Try Again !</h1>
<% }%>

    <h2>Online Shopping</h2>
    <p>The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them.</p>
  </div>
</div>

</body>
</html>