<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%> 
	<%! 
	    String user = "root"; 
	    String pass = "1234"; 
	    String url = "jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=UTF-8"; 
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