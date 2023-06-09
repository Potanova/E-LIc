<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="jdbc.Koneksi"%>
<%@page import="java.sql.*"%>

<%
    SimpleDateFormat FormatD = new SimpleDateFormat("dd-MM-yyyy");   
    java.util.Date today_date = new java.util.Date();  
    String submit = request.getParameter("submit");
    String Hapus = request.getParameter("Hapus");
    String ip = session.getAttribute("IdUser").toString();
    if (submit != null){
        String jepel = request.getParameter("jepel");
        String tjad = request.getParameter("tjad");
        String wkt = request.getParameter("wkt");
        try {
            Koneksi konek = new Koneksi();
            Connection conn = konek.bukaKoneksi();                  
            Statement stm = conn.createStatement();
            String q1 = "INSERT INTO `jadwalpelatihan` "
                    + "(`IdPel`, `TglPelaksanaan`, `Waktu`, `Timestamp`)"
                    + " values "
                    + "('"+jepel+"', '"+tjad+"', '"+wkt+"', CURRENT_TIMESTAMP)";
            int result = stm.executeUpdate(q1);
            System.out.println(q1);
             if (result > 0) {
                    out.print("<script>alert('Data Successfully')</script>");
                    out.print("<META HTTP-EQUIV=Refresh CONTENT='0; URL=index.jsp?id=JdP'>");
                }
            conn.close();
            
         }catch (Exception e) {
            e.printStackTrace();
        }
    }
    if (Hapus != null){
        String IDJ = request.getParameter("IDJ");
        try {
            Koneksi konek = new Koneksi();
            Connection conn = konek.bukaKoneksi();                  
            Statement stm = conn.createStatement();
            String q1 = "DELETE FROM `jadwalpelatihan` WHERE `IdPel`='"+IDJ+"' ";
            int result = stm.executeUpdate(q1);
            conn.close();
            out.print("<script>alert('Data Successfully')</script>");
            out.print("<META HTTP-EQUIV=Refresh CONTENT='0; URL=index.jsp?id=JdP'>");
         }catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    %>
<style>
    td,th {font-size: 12px !important;}
</style>
<div class="col-md-10 col-md-offset-1 col">
    <section class="content-header">
        <h1>
            Jadwal Lisensi
        </h1>
    </section>
    <br>
    <!-- general form elements -->
    <div class="box box-default">
        <form method="post" name="form" id="form">
            <input type="hidden" name="idDV" id="idDV1">
            <div class="box-body">
                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
                            <label>JENIS PELATIHAN</label><br>
                            <select name="jepel" class="form-control select2" required>
                                <option value=""></option>
                                <%                               
                                try {
                                    Koneksi konek = new Koneksi();
                                    Connection conn = konek.bukaKoneksi();
                                    Statement stm = conn.createStatement();
                                    ResultSet res = stm.executeQuery
                                    ("SELECT `IdPel`, `NamaPelatihan`, `Level` FROM `jenispelatihan`");
                                    while (res.next()) {
                                        out.println("<option value='" + res.getString("IdPel") + "'>" 
                                                + res.getString("IdPel") + " == " + res.getString("NamaPelatihan") + " == " + res.getString("Level") + "</option>");
                                    }
                                    conn.close();
                                } catch (Exception e) {
                                    System.out.print(e);
                                }
                                %>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <label>TGL JADWAL</label>
                            <input type="text" name="tjad" class="form-control" required="true" id="tper" autocomplete="off">
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <label>WAKTU</label>
                            <input type="text" name="wkt" class="form-control" required="true" autocomplete="off">
                        </div>
                    </div>        
                </div>
            </div>
            <div class="box-footer">
                <div class="col-md-12-3">
                    <div class="form-group">
                        <input style="align:right" type="submit" name="submit" value="submit" class="btn btn-success btn-block">
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<div class="row">
    <div class="col-md-10 col-md-offset-1 col">
        <div class="col-md-12">
            <div class="table-responsive">
                <table id="example1" class="table table-bordered table-striped">
                    <thead style="color: #fff; background-color: #053A6E; border-color: #053A6E;">
                        <tr>
                            <th>ID</th>
                            <th>Nama Pelatihan</th>
                            <th>Tanggal</th>
                            <th>Waktu</th>
                            <th>Hapus</th>
                        </tr>
                    </thead>
                    <tbody id="edittableDV">
                        <%
                             try {
                                Koneksi konek = new Koneksi();
                                Connection conn = konek.bukaKoneksi();
                                Statement stm = conn.createStatement();
                                String SQLList="SELECT `jadwalpelatihan`.`IdJadwal` as IDJ, `jenispelatihan`.`IdPel` as IDP, "
                                        + "`jenispelatihan`.`NamaPelatihan` as NP, "
                                        + "`jadwalpelatihan`.`TglPelaksanaan` as TGP, `jadwalpelatihan`.`Waktu` as W "
                                        + "FROM `jadwalpelatihan` "
                                        + "INNER JOIN `jenispelatihan` ON `jadwalpelatihan`.`IdPel` = `jenispelatihan`.`IdPel`";
                                ResultSet res = stm.executeQuery(SQLList);
                                int NoUrut = 1;
                                while (res.next()) {
                                    out.print("<tr data-idven=" + res.getString("IDJ") + " > "
                                            + "<td>" + res.getString("IDJ") + "</td>"
                                            + "<td>" + res.getString("IDP") + " - " + res.getString("NP") + "</td>"
                                            + "<td>" + res.getString("TGP") + "</td>"
                                            + "<td>" + res.getString("w") + "</td>"
                                            );
                                    out.print("<td align='center'>"
                                            + "<form method='post' action=''>"
                                            + "<input type='hidden' name='IDJ' value='" + res.getString("IDJ") + "'>"
                                            + "<input type='submit' name='Hapus' value='Hapus' class='btn-xs btn-danger'>"
                                            + "</form>"
                                            + "</td>");
                                    out.print("</tr>");
                                    NoUrut++;
                                }
                                
                             } catch (Exception e) {
                                System.out.print(e);
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
                    
<script src="plugins/select2/select2.full.min.js"></script>
<script>
    
    function angka(e) {
        if (!/^[0-9.]+$/.test(e.value)) {
            e.value = e.value.substring(0, e.value.length - 1);
        }
    }
    
    $(document).ready(function () {
        $('.money').maskMoney({thousands: '.', precision: 0});
        $('#tper').datepicker({
            autoclose: true,
            dateFormat: 'yy-mm-dd'
        });
        $(".select2").select2();
    });
</script>