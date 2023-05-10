<%@page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>

<%@page import="java.util.Calendar"%>
<%@page import="java.sql.*"%>
<%@page import="jdbc.Koneksi"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="net.sf.jasperreports.engine.*"%>
<%@ page import="net.sf.jasperreports.engine.xml.JRXmlLoader"%>
<%@ page import="net.sf.jasperreports.engine.design.JasperDesign"%>
<%@ page import="net.sf.jasperreports.j2ee.servlets.*"%>
<%@ page import="net.sf.jasperreports.view.*"%>
<%@ page import="net.sf.jasperreports.engine.util.*"%>
<%@ page import="net.sf.jasperreports.engine.export.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Laporan</title>
    </head>
    <body>
    <%
        System.out.println("MASUK");
        DateFormat dF = new SimpleDateFormat("dd-MM-yyyy");
        java.util.Date today_date = new java.util.Date();
        String curDate = dF.format(today_date);
        String namaFile = "Laporan";
        String URL = "/Jasper/Laporan.jasper";
        System.out.println(namaFile +" + "+ URL);
        String reporttype = "PDF";	
            
        try {
	Koneksi konek = new Koneksi();
	Connection conn = konek.bukaKoneksi();

	File reportFile = new File(application.getRealPath(URL));
	Map parameter = new HashMap();
	JasperPrint jasperPrint = JasperFillManager.fillReport(reportFile.getPath(), parameter, conn);
	OutputStream ouputStream = response.getOutputStream();
	JRExporter exporter = null;            
	response.setContentType("application/pdf");
	exporter = new JRPdfExporter();
	exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
	exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, ouputStream);
					
	try {
            exporter.exportReport();
	} catch (JRException e) {
            throw new ServletException(e);
	} finally {
            
            if (ouputStream != null) {
		try {
                    ouputStream.close();
		} catch (IOException ex) {
			
                }
            }
	}
	conn.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    %>
    </body>            
</html>