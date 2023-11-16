<%@ include file="adminHeader.jsp" %>
<%@ include file="AdminFooter.jsp" %>
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
<style>
.back
{
  color: white;
  margin-left: 2.5%
}
</style>
</head>
<body>
<h2><a class="back" href="AllProductEdit.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></h2>
<%
try{
	String id=request.getParameter("id");
	
	Connection con=RegConnection.getConnection();
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("select * from product where id='"+id+"'");
		while(rs.next())
	     {
	     
	     %>
		<form action="EditProductAction.jsp" method="post">
		<input type="hidden" name="id" value="<%out.println(id);%>">
	
<div class="left-div">
 <h3>Enter Name</h3>
	<input class="input-style" type="text" name="name" value="<%rs.getString(2);%>">
<hr>
</div>

<div class="right-div">
<h3>Enter Category</h3>
 	<input class="input-style" type="text" name="category" value="<%rs.getString(3);%>">
<hr>
</div>

<div class="left-div">
<h3>Enter Price</h3>
 <input class="input-style" type="number" name="price" value="<%rs.getString(4);%>">
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

<%
}
}
catch(Exception e){
	System.out.println(e);
}
%>

<br><br><br>
</body>
</html>