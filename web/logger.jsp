<%@page import="java.util.logging.FileHandler"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "db.jsp"%> 
<%@ page import="org.apache.log4j.*" %>
<%@ page import="java.util.logging.Level" %>
<%@ page import="java.util.logging.FileHandler" %>
<%@ page import=" java.util.logging.LogManager" %>
<%@ page import="java.util.logging.Logger" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
   <body>  
<div class="container">
   
<%     
   // PropertyConfigurator.configure(request.getRealPath("WEB-INF/log4j.properties"));this.getClass()
    PropertyConfigurator.configure("../WEB-INF/log4j.properties");
Logger log = Logger.getLogger(this.getClass().toString());
   FileHandler fileHandler = new FileHandler("C:/Log/test.log");
	    fileHandler.setLevel(Level.INFO); //Log的層級
	    log.addHandler(fileHandler);
log.info("this is INFO.");
%> 

        
  
        </div>
    </body>
</html>

</html>