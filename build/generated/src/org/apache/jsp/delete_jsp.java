package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.logging.FileHandler;
import java.util.logging.LogManager;
import java.util.logging.Logger;
import java.util.logging.Level;
import org.apache.log4j.*;

public final class delete_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

 
	    String user = "root"; 
	    String pass = "1234"; 
	    String url = "jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=UTF-8"; 
	      PreparedStatement pstmt = null;
	        Connection conn; 
	      Statement stmt; 
	
  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/db.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write('\n');
      out.write("\n");
      out.write(" \n");
      out.write("\t");
      out.write(" \n");
      out.write("\t");
 
	    try{ 
	        Class.forName("com.mysql.jdbc.Driver").newInstance(); 
	            conn = DriverManager.getConnection(url,user,pass); 
	           stmt = conn.createStatement();
                   
                    
	    }catch(SQLException sqle){ 
	        out.println("SQL Exception : " + sqle); 
	    } 
	
      out.write(' ');
      out.write(" \n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("  <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\">\n");
      out.write("  <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js\"></script>\n");
      out.write("  <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\"></script>\n");
      out.write("    </head>\n");
      out.write("    <style>\n");
      out.write("    body{\n");
      out.write("        font-family:微軟正黑體;\n");
      out.write("    }\n");
      out.write("    th{\n");
      out.write("        text-align:center;\n");
      out.write("    }\n");
      out.write("</style>\n");
      out.write("    <body>\n");
      out.write("        <font size=\"7\"><center>信件標籤系統</font><br><br>\n");
      out.write("        <font size=\"5\"><center> \n");
      out.write("            <a href=\"insert.jsp\" class=\"btn btn-primary btn-lg\">新增</a>\n");
      out.write("                 <a href=\"update.jsp\" class=\"btn btn-primary btn-lg\">修改</a>\n");
      out.write("                  <a href=\"delete.jsp\" class=\"btn btn-primary btn-lg\">刪除</a>\n");
      out.write("               <a href=\"index.jsp\"  class=\"btn btn-primary btn-lg\">查詢</a>\n");
      out.write("               <br>  </br><b>刪除客戶資料</b></center></font>\n");
      out.write(" ");
 
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

	
      out.write(" \n");
      out.write("  \n");
      out.write("    \n");
      out.write("        <div class=\"container\">  \n");
      out.write("         <form action = \"delete.jsp\" method = \"post\">\n");
      out.write("        <table class=\"table table-bordered table-striped\">\n");
      out.write("    <thead>\n");
      out.write("    <b><tr><th>選項</th><th>客戶代號</th><th>客戶名稱</th><th>郵遞區號</th><th>客戶地址</th></tr></b>\n");
      out.write("    </thead>\n");
      out.write("    <tbody id=\"myTable\">\n");
      out.write("     ");
 
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
	        
      out.write("\n");
      out.write("            \n");
      out.write("    </tbody>\n");
      out.write("  </table> \n");
      out.write("      </br>\n");
      out.write("           <center> <input type = \"submit\" name = \"delete\" value = \"刪除資料\" class=\"btn btn-success\"> </center>\n");
      out.write("           </br>\n");
      out.write("         </form>\n");
      out.write("           </div>\n");
      out.write("    </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
