<%@page import="jdbc.Koneksi" %>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    System.out.println("MASUK PLOGIN");
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String login = request.getParameter("login");

    try {
    //        System.out.println("MASUUUUK");
            Koneksi konek = new Koneksi();
            Connection conn = konek.bukaKoneksi();
                System.out.println("MASUK PLOGIN 1");
            Statement stm = conn.createStatement();
                System.out.println("MASUK PLOGIN 2");
            String sql = "SELECT `user`.`IdUser`, `user`.`StatusUser`, `user`.`Password`, "
                    + "`user`.`NamaLengkap`, `user`.`Level`, "
                    + "`user`.`Username`, `user`.`Alamat` "
                    + "FROM `user`"
                    + "WHERE `user`.`Username` = '"+username+"' "
                    + "AND `user`.`Password` = '"+password+"' "
                    + "AND StatusUser = 'ON'";
            System.out.println("sql = "+sql);
            ResultSet res = stm.executeQuery(sql);
            if (res.next()) {
                session.setAttribute("isLogin", "true");
                session.removeAttribute("error");
                session.setAttribute("error", "");
                session.setAttribute("IdUser", res.getString("IdUser"));
                session.setAttribute("NamaLengkap", res.getString("NamaLengkap"));
                session.setAttribute("Level", res.getString("Level"));

                response.sendRedirect("index.jsp");

            } else {
                session.setAttribute("error", "err");
                response.sendRedirect("1login.jsp");
            }
            conn.close();
        } catch (Exception e) { 
                System.out.println(e);
    }
    
    
%>