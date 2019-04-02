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
               
File reportFile = new File(application.getRealPath("/report/report3.jasper"));//your report_name.jasper file
            Map parameters = new HashMap();
            byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, conn);
            response.setContentType("application/pdf");
            response.setContentLength(bytes.length);
            ServletOutputStream outStream = response.getOutputStream();
            outStream.write(bytes, 0, bytes.length);
            outStream.flush();
            outStream.close();    
	%> 