
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "db.jsp"%> 
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
         /*    */
          String Lang2="";
          
      Object sql1=session.getAttribute("sql"); 
      
       if(sql1!=null){Lang2=sql1.toString();}
      out.print(Lang2);
       
	        %>
      
   
</div>

    </br><center>
     <font size="5">  <a href="index.jsp">回首頁</a></font>
    </body>
</html>

</html>