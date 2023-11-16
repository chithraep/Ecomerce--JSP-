<%@page import="com.demo.ecommerce.RegConnection" %>
<%@page import="java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="addNewProduct.css">
<title>Add New Product</title>
</head>
<body>
<% 
String msg=request.getParameter("msg");
if("done".equals(msg))
{%>
<h3 class="alert">Product Added Successfully!</h3>
<%}%>
 
<%if("wrong".equals(msg)){ %>
<h3 class="alert">Some thing went wrong! Try Again!</h3>
<% }%>

<% 
 int id=1;
 try{
	 Connection con=RegConnection.getConnection();
		PreparedStatement stmt=con.prepareStatement("select max(id)from product");
		ResultSet rs=stmt.executeQuery();
		while(rs.next())
		     {
			id=rs.getInt(1);
			id=id+1;
		     }
 }catch(Exception e){
	 
		     }
 %>

<h3 style="color: yellow;">Product ID:<%out.println(id); %> </h3>
<form action="addNewProductAction.jsp" method="post">
<input type="hidden" name="id" value=<%out.println(id); %>>
<div class="left-div">
 <h3>Enter Name</h3>
 <input class="input-style" type="text" name="name" plceholder="Enter product name" required="required" >
<hr>
</div>
<div class="right-div">
<h3>Enter Category</h3>
 <input class="input-style" type="text" name="category" plceholder="Enter product category" required="required" >
<hr>
</div>

<div class="left-div">
<h3>Enter Price</h3>
 <input class="input-style" type="number" name="price" plceholder="Enter price" required="required" >
<hr>
</div>

<div class="right-div">
<h3>Active</h3>
  <select class="input-style" name="active">
  <option value="yes">yes</option>
  
  <option value="no">no</option>
  </select>
<hr>
</div>
<button class="button">save <i class='far fa-arrow-alt-circle-right'></i></button>

</form>

<br><br><br>
</body>
</html>