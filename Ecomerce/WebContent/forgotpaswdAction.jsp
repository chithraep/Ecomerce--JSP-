<%@page import="com.demo.ecommerce.RegConnection" %>
<%@page import="java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%
    
    String email=request.getParameter("email");
    String MobileNumber=request.getParameter("MobileNumber");
    String sequrityQ=request.getParameter("sequrityQ");
    String sequrityA=request.getParameter("sequrityA");
    String newpassword=request.getParameter("newpassword");
    int check=0;
    try{
    Connection con=RegConnection.getConnection();
    		PreparedStatement stmt=con.prepareStatement("select * from user_table where email='"+email+"'and MobileNumber='"+MobileNumber+"'and sequrityQ ='"+sequrityQ+"'and sequrityA ='"+sequrityA+"'");
    		ResultSet rs=stmt.executeQuery();
    		while(rs.next()){
    		check=1;
    		stmt.executeUpdate( "update  user_table set password='"+newpassword+"' where email='"+email+"'");
    		response.sendRedirect("forgotPassword.jsp?msg=done");
    		}if(check==0){
    			response.sendRedirect("forgotPassword.jsp?msg=invalid");
    		}
    		}catch(Exception e){
    			System.out.println(e);
    		}
    		%>