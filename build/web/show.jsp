<%@page import="net.sf.jasperreports.engine.design.JasperDesign"%>
<%@page import="net.sf.jasperreports.engine.*" %>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.io.File"%>
<%@ page import="java.sql.*"%> 
<%@ include file = "db.jsp"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
 
       String Lang3="";
      Object sql1=session.getAttribute("Lang2"); 
      
       if(sql1!=null){Lang3=sql1.toString();}
  
    
	  //  String sql = "select * from send where name like '益良%' ";
          //String sql = "select * from send where name='n2' ";
       
	    ResultSet rs = stmt.executeQuery(Lang3);             
            File reportFile = new File(application.getRealPath("/report/report3.jasper"));
            Map parameters = new HashMap();
           JRDataSource dataSource = new JRResultSetDataSource(rs);
             byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, dataSource); 
            response.setContentType("application/pdf");
            response.setContentLength(bytes.length);
            ServletOutputStream outStream = response.getOutputStream();
            outStream.write(bytes, 0, bytes.length);
            outStream.flush();
            outStream.close(); 
            rs.close();


%> 