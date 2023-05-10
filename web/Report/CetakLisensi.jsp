<%@page import="java.util.Calendar"%>
<%@page import="java.sql.*"%>
<%@page import="jdbc.Koneksi"%>
<%@page import="java.sql.*"%>
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
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cetak Lisensi</title>
    </head>
    <body>
    <%
        DateFormat dF = new SimpleDateFormat("dd-MM-yyyy");
        java.util.Date today_date = new java.util.Date();
        String curDate = dF.format(today_date);

        System.out.print("MASUK CETAK");
        String IdPendaf = request.getParameter("IdPendaf"); 
        String URL = "/Jasper/CetakLisensi.jasper";
        System.out.print(URL);
        String reporttype = "pdf";
        
        try {
            Koneksi konek = new Koneksi();
            Connection conn = konek.bukaKoneksi();
            Statement stm = conn.createStatement();
            
            //URL Jasper File
            File reportFile = new File(application.getRealPath(URL));
            
            //Parameter in Jasper
            Map parameter = new HashMap();
            parameter.put("par_IdPendaf", IdPendaf);
            System.out.print("masuk SESUDAH parameter IdPendaf"); 
            
            //Call Jasper
            JasperPrint jasperPrint = JasperFillManager.fillReport(reportFile.getPath(), parameter, conn);
            OutputStream ouputStream = response.getOutputStream();
            JRExporter exporter = null; 
            System.out.print("masuk call jasper"); 
            
            
            if ("pdf".equalsIgnoreCase(reporttype)) {
                response.setContentType("application/pdf");
                exporter = new JRPdfExporter();
                exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
                exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, ouputStream);
                System.out.print("masuk pdf");
            } else if ("xls".equalsIgnoreCase(reporttype)) {
                response.setContentType("application/xls");
                response.setHeader("Content-Disposition", "inline; filename=\"" + curDate + ".xls\"");
                exporter = new JRXlsExporter();
                exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
                exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, ouputStream);
                System.out.print("masuk xls");
            }
            

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
        }catch (Exception e) {
            System.out.println(e);
        }
    %>      
    </body>
</html>



