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
    <center>  <input type = "submit" name = "index" value = "送出" class="btn btn-success"> 
    </br>
   <center ><input type=checkbox name='b' value="A0000"><font size="5">空白</font></input>
     <input type="text" name="num" id="num" value="0"/><font size="5">格</font>
   </center>
    </br>
  <table class="table table-bordered table-striped">
    <thead>
    <b>   <tr><th>選項</th><th>客戶代號</th><th>客戶名稱</th><th>郵遞區號</th><th>客戶地址</th></tr></b>  
    </thead>
    <tbody id="myTable">
        <%     
          
           request.setCharacterEncoding("UTF-8");
          String sql = "select * from send order by c_id ASC"; 
            pstmt = conn.prepareStatement(sql);  
             ResultSet rs = pstmt.executeQuery(); 
             pstmt.setQueryTimeout(60);
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
   
  </form>
</div>
<%    String[]  a = request.getParameterValues("a"); 
      String[] b=request.getParameterValues("b");
     
        int i;
         if( a!=null)
           {  sql = "select* from send where  "; 
           String str="";
           String str2="select* from send where  c_id ='A0000' ";
           //////  c_id ='A0012' union all select* from send where  c_id ='A0012' 
            int number=Integer.parseInt(request.getParameter("num"));
           if(number>0 && b!=null){
           /**/for(i=0;i<number;i++)
                {
                  str=str+str2+ "  union all  ";
                }
           
           }
         
           ////
           /**/
             for(i=0;i<a.length;i++)
                {
                  if(i==0 ){ sql=str+sql+   " c_id ='" + a[i] + "' "; }
                  else{   sql=sql+   " c_id ='" + a[i] + "' "; 
                  }
	      
                 if(i!=a.length-1){ sql=sql+   " or  "; } 
                }
            
          
                  session.setAttribute("sql", sql);
             /* response.sendRedirect("check.jsp");
             RequestDispatcher rd;
       rd = getServletContext().getRequestDispatcher("check");
       rd.forward(request,response); 
                  */
            %>
           <script>  window.open("check.jsp"); </script>
                <%//  
                    // RequestDispatcher rd;
    //   rd = getServletContext().getRequestDispatcher("check.jsp");
      //  rd.forward(request,response); 
            // response.setHeader("Refresh","3;url=check.jsp");   
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
<%  //response.sendRedirect("check.jsp");
%>