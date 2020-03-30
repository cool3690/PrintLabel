<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%> 
	<%! 
          
	    String user = "abc"; 
	    String pass = "4566330"; 
	    String url = "jdbc:mysql://192.168.1.247:3306/test?useUnicode=true&characterEncoding=UTF-8";
/*
           String user = "root"; 
	    String pass = ""; 
	    String url = "jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=UTF-8";
         */   
	      PreparedStatement pstmt = null;
	        Connection conn; 
	      Statement stmt; 
	%> 
	<% 
	    try{ 
	        Class.forName("com.mysql.jdbc.Driver").newInstance(); 
	            conn = DriverManager.getConnection(url,user,pass); 
	           stmt = conn.createStatement();
                   
                    
	    }catch(SQLException sqle){ 
	        out.println("SQL Exception : " + sqle); 
	    } 
	%> 