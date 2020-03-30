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
  
  <form action = "index.jsp" method = "post">
  
  <table class="table table-bordered table-striped">
    <thead>
    <tr><th>checkbox</th><th>value</th><th>item</th></tr> 
    </thead>
    <tbody id="myTable">
        <%     
           request.setCharacterEncoding("UTF-8");
          String sql = "select * from send LIMIT 0, 1"; 
            pstmt = conn.prepareStatement(sql);  
             ResultSet rs = pstmt.executeQuery(); 
             pstmt.setQueryTimeout(60);
	         while(rs.next()){ 
                String name = rs.getString("code");
                  String c_id = rs.getString("c_id");
         
     // out.print("<tr><td><input type='checkbox' name='a' value="+c_id+" onclick='testfun( this ,'"+c_id+"')'></td>" 
           //   + "<td><input type='text' id='"+c_id+"' name='count' value=0 SIZE=5></td><td>"+name+"</td></tr> ");
        
        %><tr><td><input type=checkbox name='a' value=" <%=c_id%>" onclick="testfun( this , '<%=c_id%>')"></td> 
                 <td><input type=text id="<%=c_id%>" name='count' value='0' SIZE=5></td> </tr> 
<%
                
     }
	                rs.close(); 
 %>
    </tbody>
  </table>
  </form>
</div>

<script type="text/javascript">

function testfun(element, c_id) {
  var x = document.getElementById(c_id);
 //window.alert(c_id);
  if (element.checked) {
  
    x.value ="1";

  } else {
    x.value = "0";
  }
}

</script>
    </body>
</html>
