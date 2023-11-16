<%@page import="com.demo.ecommerce.RegConnection" %>
<%@page import="java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

  <%
    String id=request.getParameter("id"); 
    String name=request.getParameter("name");
    String category=request.getParameter("category"); 
    String price=request.getParameter("price");
    String active=request.getParameter("active"); 
    
    try{
    Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "root","Chithra0729");
		PreparedStatement stmt =con.prepareStatement
				("insert into product(id,name,category,price,active)values(?,?,?,?,?)");
		stmt.setString(1, id);
		stmt.setString(2, name);
		stmt.setString(3,category);
		stmt.setString(4, price);
		stmt.setString(5, active);
		stmt.executeUpdate();
		response.sendRedirect("addNewProduct.jsp?msg=done");
    }catch(Exception e){
    	response.sendRedirect("addNewProduct.jsp?msg=wrong");
    	System.out.println(e);
    }
		
			%>