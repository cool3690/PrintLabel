<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "db.jsp"%> 
<%@ page import="java.util.logging.FileHandler" %>
<%@ page import=" java.util.logging.LogManager" %>
<%@ page import="java.util.logging.Logger" %>
<%@ page import="java.util.logging.Level" %>
<%@ page import="org.apache.log4j.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <style>
    body{
        font-family:微軟正黑體;
    }
    th{
        text-align:center;
    }
</style>
    <body>
        <font size="7"><center>信件標籤系統</font><br><br>
        <font size="5"><center> 
            <a href="insert.jsp" class="btn btn-primary btn-lg">新增</a>
                 <a href="update.jsp" class="btn btn-primary btn-lg">修改</a>
                  <a href="delete.jsp" class="btn btn-primary btn-lg">刪除</a>
               <a href="index.jsp"  class="btn btn-primary btn-lg">查詢</a>
               <br>  </br><b>刪除客戶資料</b></center></font>
 <% 
           String[]   a   =   request.getParameterValues("a"); 
         int i;
           PropertyConfigurator.configure("../WEB-INF/log4j.properties");
Logger log = Logger.getLogger(this.getClass().toString());

   FileHandler fileHandler = new FileHandler("C:/Log/delete.log");
  
     fileHandler.setLevel(Level.INFO); //Log的層級
	    log.addHandler(fileHandler);
          
           
         if(request.getParameter("delete") != null && a!=null)
           { 
             for(i=0;i<a.length;i++)
                {
	        String sql = "delete from send where c_id = ?"; 
	        pstmt = conn.prepareStatement(sql);  
                log.info("delete id="+a[i]);
	         pstmt.setString(1 , a[i]); 
	        pstmt.executeUpdate(); 
                }
	  } 

	%> 
  
    
        <div class="container">  
         <form action = "delete.jsp" method = "post">
        <table class="table table-bordered table-striped">
    <thead>
    <b><tr><th>選項</th><th>客戶代號</th><th>客戶名稱</th><th>郵遞區號</th><th>客戶地址</th></tr></b>
    </thead>
    <tbody id="myTable">
     <% 
	                String sql = "select * from send"; 
	                ResultSet rs = stmt.executeQuery(sql); 
	                while(rs.next()){ 
	                   String youad = rs.getString("youad"); 
                           String youad2 = rs.getString("youad2"); 
                            String name = rs.getString("name");
                            String c_id = rs.getString("c_id");
                            String code = rs.getString("code");
                              
	 out.print("<tr><td><center>"+"<input type=checkbox name='a' value="+c_id+">"+"</center></td><td>"+ c_id + "</td><td>"+name+"</td><td> "+ code+"</td><td> " + youad+ youad2+ "</td></tr> "); 
     
	                }
	                rs.close(); 
	        %>
            
    </tbody>
  </table> 
      </br>
           <center> <input type = "submit" name = "delete" value = "刪除資料" class="btn btn-success"> </center>
           </br>
         </form>
           </div>
    </body>
</html>