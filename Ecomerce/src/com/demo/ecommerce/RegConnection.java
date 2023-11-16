package com.demo.ecommerce;

import java.sql.Connection;
import java.sql.DriverManager;

public class RegConnection {
	public static Connection getConnection()
    {
           
             try {
            Class.forName("com.mysql.cj.jdbc.Driver");
         String url="jdbc:mysql://localhost:3306/ecommerce";
         Connection con=DriverManager.getConnection(url,"root","Chithra0729");
                 return con;
                     } catch (Exception e) {
                 // TODO Auto-generated catch block
                 e.printStackTrace();
                 System.out.println(e);
                 
                 return null;
              	}
                    	
          }

}
