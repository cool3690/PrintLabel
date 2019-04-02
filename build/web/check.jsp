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
    <center><font size="5"><br><b>客戶確認明細</b></font></center>
<div class="container">
  

  <form action = "check.jsp" method = "post">
  <table class="table table-bordered table-striped">
    <thead>
       <tr><th>客戶代號</th><th>客戶名稱</th><th>郵遞區號</th><th>客戶地址</th></tr>
    </thead>
    <tbody id="myTable">
        <%     
           String Lang2="";
      Object sql1=session.getAttribute("sql"); 
      
       if(sql1!=null){Lang2=sql1.toString();}
           request.setCharacterEncoding("UTF-8");
          String sql = "select * from send"; 
            pstmt = conn.prepareStatement(Lang2);  
             ResultSet rs = pstmt.executeQuery(); 
	         while(rs.next()){ 
	                   String youad = rs.getString("youad"); 
                           String youad2 = rs.getString("youad2"); 
                            String name = rs.getString("name");
                            String c_id = rs.getString("c_id");
                            String code = rs.getString("code");
                              
	 out.print("<tr><td>"+ c_id + "</td><td>"+name+"</td><td> "+ code+"</td><td> " + youad+ youad2+ "</td></tr> "); 
                   }
	                rs.close(); 
	        %>
      
    </tbody>
  </table></br>
 
<form name="selection" >
<p> 紙張大小：  
<select name="time" size="1" id="time" > 
<option value="1" selected>信件（小）</option> 
<option value="2">信件（大）</option> 
</select> 
     <input type = "submit" name = "check" value = "確認"  class="btn btn-success"> 
</form>

</div>
<%
if(request.getParameter("check") != null )
           { String i = request.getParameter("time");
            if(i.equals("1")){ 
                session.setAttribute("Lang2", Lang2);
                response.sendRedirect("show.jsp");
            }
              else
                { session.setAttribute("Lang2", Lang2);
                  response.sendRedirect("showy.jsp");
                }
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
</script>
    </br><center>
    <!-- <font size="5">  <a href="index.jsp">首頁</a></font>-->
    </body>
</html>

</html>