
 <%@page import="com.demo.ecommerce.RegConnection" %>
<%@page import="java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    String name=request.getParameter("name");
    String email=request.getParameter("email");
    String MobileNumber=request.getParameter("MobileNumber");
    String SequrityQ=request.getParameter("sequrityQ");
    String sequrityA=request.getParameter("sequrityA");
    String password=request.getParameter("password");
    String Address="";
    String City="";
    String State="";
    String Country="";
    
    try{
    	Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "root","Chithra0729");
		PreparedStatement stmt =con.prepareStatement
				("insert into user_Table(name,email,MobileNumber,sequrityQ,sequrityA,password,Address,city,State,Country)values(?,?,?,?,?,?,?,?,?,?)");
		stmt.setString(1, name);
		stmt.setString(2, email);
		stmt.setString(3, MobileNumber);
		stmt.setString(4, SequrityQ);
		stmt.setString(5, sequrityA);
		stmt.setString(6, password);
		stmt.setString(7, Address);
		stmt.setString(8, City);
		stmt.setString(9,State);
		stmt.setString(10, Country);
		stmt.executeUpdate();
		response.sendRedirect("index.jsp?msg=valid");
    }catch(Exception e){
    	
    	System.out.println(e);
    	response.sendRedirect("index.jsp?msg=invalid");
    }
      
    %>
