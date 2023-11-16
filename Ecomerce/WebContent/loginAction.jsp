<%@page import="com.demo.ecommerce.RegConnection" %>
<%@page import="java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <% 
    String email=request.getParameter("email"); 
    String password=request.getParameter("password");
    if("admin@inmakes.com".equals(email)&&"admin".equals(password))
    {
    	session.setAttribute("email", email);
    	response.sendRedirect("Admin/admin.jsp");
    }else{
    	int z=0;
    	try{
    		Connection con=RegConnection.getConnection();
    		PreparedStatement stmt=con.prepareStatement("select * from user_table where email='"+email+"'&& password='"+password+"'");
    		ResultSet rs=stmt.executeQuery();
    		
    		
    		while(rs.next()){
    			z=1;
    			session.setAttribute("email", email);
    	    	response.sendRedirect("home.jsp");
    		}
    		if(z==0)
    			response.sendRedirect("login.jsp?msg=notexist");
    		}
    	catch(Exception e){
    		System.out.println(e);
    		response.sendRedirect("login.jsp?msg=invalid");
    	}
    } 
      %>