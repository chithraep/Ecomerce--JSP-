<%@page import="com.demo.ecommerce.RegConnection" %>
<%@page import="java.sql.*" %>
<%
String id=request.getParameter("id"); 
String name=request.getParameter("name");
String category=request.getParameter("category"); 
String price=request.getParameter("price");
String active=request.getParameter("active"); 
 try{

Connection con=RegConnection.getConnection();
Statement stmt=con.createStatement();
stmt.executeUpdate("update product set name='"+name+"',category='"+category+"',price='"+price+"',active='"+active+"' where id='"+id+"'");
 if(active.equals("no")){
	 stmt.executeUpdate("delete from cart where product_id='"+id+"' and Address is null");
	
 }
 
 response.sendRedirect("AllProductEdit.jsp?msg=done");
 }catch(Exception e){
	 response.sendRedirect("AllProductEdit.jsp?msg=wrong") ;
	 System.out.println(e);
 }



%>