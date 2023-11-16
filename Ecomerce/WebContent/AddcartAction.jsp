<%@page import="com.demo.ecommerce.RegConnection" %>
<%@page import="java.sql.*" %>
<%@ include file="header.jsp" %>
<%@ include file="Footer.jsp" %>

<% 
String emailid=session.getAttribute("email").toString();
String product_id=request.getParameter("id");
int quantity=1;
int product_price=0;
int product_total=0;
int cart_total=0;
int z=0;


try{
	Connection con=RegConnection.getConnection();
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery("select * from product where id='"+product_id+"'");
	while(rs.next())
	{
		product_price=rs.getInt(4);
		product_total=product_price;
	}
	ResultSet rs1=stmt.executeQuery("select * from cart where  product_id='"+product_id+"' and email='"+emailid+"'and Address is NUll");	
	while(rs1.next())
	{
		 cart_total=rs1.getInt(5);
		 cart_total= cart_total+product_total;
		 quantity=rs1.getInt(3);
		 quantity=quantity+1;
		 z=1;
	}if(z==1){
		stmt.executeUpdate("update cart set total='"+ cart_total+"', quantity='"+quantity+"'where product_id='"+product_id+"' and email='"+emailid+"'and Address is NUll ");
	         response.sendRedirect("home.jsp?msg=exit");
	
	}
	if(z==0){
		PreparedStatement smt =con.prepareStatement
				("insert into cart(email,product_id,quantity,price,total)values(?,?,?,?,?)");
		smt.setString(1,emailid);
		smt.setString(2,product_id);
		smt.setInt(3,quantity);
		smt.setInt(4,product_price);
		smt.setInt(5,product_total);
		smt.executeUpdate();
		response.sendRedirect("home.jsp?msg=added");
		
		
	}
}catch(Exception e){
	System.out.println(e);
	response.sendRedirect("home.jsp?msg=invalid");
}

%>