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
    <script>
$(document).ready(function(){
   
    $("#fix").click(function(){
        $(tt).show();
    });
});
</script>
<style>
    body{
        font-family:微軟正黑體;
    }
    th{
        text-align:center;
    }
</style>
    <body>
        <font size="7"><center>信件標籤系統</font></br> </br> 
    <center><font size="5">
           <a href="insert.jsp" class="btn btn-primary btn-lg">新增</a>
                 <a href="update.jsp" class="btn btn-primary btn-lg">修改</a>
                  <a href="delete.jsp" class="btn btn-primary btn-lg">刪除</a>
               <a href="index.jsp"  class="btn btn-primary btn-lg">查詢</a>
               </br> </br><b>修改客戶資料</b></font></center></br>
     <% 
         PropertyConfigurator.configure("../WEB-INF/log4j.properties");
      Logger log = Logger.getLogger(this.getClass().toString());
  // FileHandler fileHandler = new FileHandler("/Log/update.log");
   //fileHandler.setLevel(Level.INFO); //Log的層級
	   // log.addHandler(fileHandler);
     %>
     <%     request.setCharacterEncoding("UTF-8");
             int i=0,len=0;
           String[] a =request.getParameterValues("a"); 
           String name2[] = request.getParameterValues("name"); 
             String code2[] = request.getParameterValues("code"); 
             String c_id2[] = request.getParameterValues("c_id"); 
                String stri[] = request.getParameterValues("str");
            
	    if( request.getParameter("fix") != null ){ 
                 String yad="";
              for(i=0;i<c_id2.length;i++){
                yad="";
                   if(stri[i].length()>19){
                  yad=stri[i].substring(19,stri[i].length());
                  stri[i]=stri[i].substring(0,19);
                }
              log.info("insert id="+c_id2[i] +" name="+name2[i]+" code="+code2[i]+" youad="+stri[i]);
               String sql = "update send set youad = '" + stri[i] + "',name = '" + name2[i] + "',code = '" + code2[i] + "',youad2 = '" +  yad +"'  where c_id ='" + c_id2[i] + "' "; 
	      int b = stmt.executeUpdate(sql); 
           }
             } 
             
	%> 
      <div class="container">  
      <form action = "update.jsp" method = "post">
        <%  if(request.getParameter("update") != null && a!=null)
           { 
             for(i=0;i<a.length;i++){
                String sql="select * from send where c_id = '" + a[i] + "' ";
                 ResultSet rs = stmt.executeQuery(sql); 
       while(rs.next()){ 
         
       String str="";
       str=str+rs.getString("youad")+rs.getString("youad2");
        %>
     客戶代號：  <input type = "text" name= "c_id" size = "6" value = "<%=a[i]%>"> 
      客戶名稱：  <input type = "text" name= "name" size = "24" value = "<%=rs.getString("name")%>"> 
      郵遞區號：  <input type = "text" name= "code" size = "5" value = "<%=rs.getString("code")%>"> 
      客戶地址：  <input type = "text" name= "str" size = "64" value = "<%=str%>"> 
       </br></br>
	 <% } if(i==a.length-1) { %>
 <center></br>  <input type = "submit" name = "fix" value = "確認" id="fix" class="btn btn-success">
<%}}}%> 
      
        
      </form>
        </br></br> 
       <input class="form-control" id="myInput" type="text" placeholder="Search..">
  <br>
      <form action = "update.jsp" method = "post">
        <table class="table table-bordered table-striped">
    <thead>
    <b><tr><th>選項</th><th>客戶代號</th><th>客戶名稱</th><th>郵遞區號</th><th>客戶地址</th></tr></b>
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
  </table> </br>
            <center> <input type = "submit" name = "update" value = "選擇更新項目"  class="btn btn-success" > </br> </br>
         </form>
             </center>  
      </div>
    </body>
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
</html>

</html>

    