<%@ page import="java.util.logging.FileHandler" %>
<%@ page import=" java.util.logging.LogManager" %>
<%@ page import="java.util.logging.Logger" %>
<%@ page import="java.util.logging.Level" %>
<%@ page import="org.apache.log4j.*" %>

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
    <style>
    body{
        font-family:微軟正黑體;
    }
    th{
        text-align:center;
    }
 
</style>
    <body>
        
   
    <font size="7"><center>信件標籤系統</font> </br> </br>
         <center><font size="5">
             <a href="insert.jsp" class="btn btn-primary btn-lg">新增</a>
                 <a href="update.jsp" class="btn btn-primary btn-lg">修改</a>
                  <a href="delete.jsp" class="btn btn-primary btn-lg">刪除</a>
               <a href="index.jsp"  class="btn btn-primary btn-lg">查詢</a>
               </br>  </br><b>新增客戶資料</b></font></center>
    <div class="container">
      <form action = "insert.jsp" method = "post" class="form-inline">
          <table class="table table-bordered table-striped">
          <tbody id="myTable">
	  <b><tr><td>客戶代號：</td><td><input type = "text" class="form-control" name= "c_id" size = "8" align="left"></td></tr>
                <tr><td>客戶名稱：</td><td> <input type = "text" class="form-control" name= "name" size = "30"></td></tr>
               <tr><td>郵遞區號：</td><td> <input type = "text" class="form-control" name= "code" size = "5"></td></tr>
              <tr><td>客戶地址：</td><td><input type = "text" class="form-control" name= "youad" size = "64"></td></tr>
               <tr><td>備註：</td><td><input type = "text" class="form-control" name= "memo" size = "50"></td></tr>
             </b>      
              </tbody>   
              </table>
          <input type = "submit" name = "insert" value = "新增"  class="btn btn-success">
	        </form> 
        <%
            PropertyConfigurator.configure("../WEB-INF/log4j.properties");
Logger log = Logger.getLogger(this.getClass().toString());

   //FileHandler fileHandler = new FileHandler("../Log/insert.log");
  
    // fileHandler.setLevel(Level.INFO); //Log的層級
	 //   log.addHandler(fileHandler);
        %> 
  
       <%  request.setCharacterEncoding("UTF-8");
	        String c_id = request.getParameter("c_id"); 
                String name = request.getParameter("name"); 
                String code = request.getParameter("code"); 
                String youad = request.getParameter("youad"); 
                String memo = request.getParameter("memo"); 
                String youad2="";
                
	    if(request.getParameter("insert") != null){ 
	        String sql = "insert into send (c_id,youad,youad2,name,code,memo) values (?,?,?,?,?,?)"; 
	        pstmt = conn.prepareStatement(sql); 
               if(youad.length()>19){
                  youad2=youad.substring(19,youad.length());
                }
                log.info("insert id="+c_id +" name="+name+" code="+code+" youad="+youad+" youad2="+youad2+"memo="+memo);
                pstmt.setString(1 , c_id);
                pstmt.setString(2 , youad);
                pstmt.setString(3 , youad2);
	        pstmt.setString(4, name); 
                pstmt.setString(5 , code);
                pstmt.setString(6 , memo);
                pstmt.executeUpdate(); 
	          } 
      
	%> 
    
      </br>
      <table class="table table-bordered table-striped">
    <thead>
    <center><b><tr><th>客戶代號</th><th>客戶名稱</th><th>郵遞區號</th><th>客戶地址</th><th>備註</th></tr></b></center>
    </thead>
    <tbody id="myTable">
   <%     
       request.setCharacterEncoding("UTF-8");
       out.print("<tr><td> " + c_id + "</td><td>"+name+"</td><td> "+ code+"</td><td> " + youad +"</td><td> "+memo+ "</td></tr> "); 
       %>
      
    </tbody>
  </table>
        </br>
    
         </div>
    </body>
</html>

    