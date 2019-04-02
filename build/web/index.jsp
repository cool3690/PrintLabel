<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
    <security:http use-expressions="true">

    <security:form-login />
    <security:logout />
    <security:intercept-url pattern="/insert.jsp*" access="ROLE_ADMIN"/>
</security:http>
     <sec:authorize access="hasRole('admin')">
   <a href="insert.jsp">insert</a>
   </sec:authorize>
    <font size="7"><center>信件標籤系統</font> </br> </br> 
          <font size="5"> 
          <a href="insert.jsp" class="btn btn-primary btn-lg">新增</a>
                 <a href="update.jsp" class="btn btn-primary btn-lg">修改</a>
                  <a href="delete.jsp" class="btn btn-primary btn-lg">刪除</a>
               <a href="index.jsp"  class="btn btn-primary btn-lg">查詢</a>
               </br></br><b>查詢客戶資料</b></center></font>
<div class="container">
  
  <input class="form-control" id="myInput" type="text" placeholder="Search..">
  <br>
  <form action = "index.jsp" method = "post">
  <table class="table table-bordered table-striped">
    <thead>
    <b>   <tr><th>選項</th><th>客戶代號</th><th>客戶名稱</th><th>郵遞區號</th><th>客戶地址</th></tr></b>  
    </thead>
    <tbody id="myTable">
        <%     
          
           request.setCharacterEncoding("UTF-8");
          String sql = "select * from send"; 
            pstmt = conn.prepareStatement(sql);  
             ResultSet rs = pstmt.executeQuery(); 
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
  </table></br>
   <center>  <input type = "submit" name = "index" value = "送出" class="btn btn-success"> 
  </form>
</div>
<%    String[]  a = request.getParameterValues("a"); 
        int i;
         if(request.getParameter("index") != null && a!=null)
           {  sql = "select* from send where   "; 
             for(i=0;i<a.length;i++)
                {
	         sql=sql+   "  c_id ='" + a[i] + "' "; 
                 if(i!=a.length-1){ sql=sql+   "  or  "; } 
                }
              
                  session.setAttribute("sql", sql);
                  response.sendRedirect("check.jsp");
	  } 

	%> 
<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script></br>
    </body>
</html>

</html>