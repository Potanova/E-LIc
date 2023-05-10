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
        String name = request.getParameter("name");
        String jp = request.getParameter("jp");
        try {
            Koneksi konek = new Koneksi();
            Connection conn = konek.bukaKoneksi();                  
            Statement stm = conn.createStatement();
            String q1 = "INSERT INTO `prosespelatihan` "
                    + "(`IdPendaftaran`, `IdUser`, `IdJadwal`, `Status`, `Timestamp`)"
                    + " values "
                    + "(UUID(), '"+ip+"', '"+jp+"', 'ON', CURRENT_TIMESTAMP)";
            int result = stm.executeUpdate(q1);
            System.out.println(q1);
            if (result > 0) {
                    out.print("<script>alert('Data Successfully')</script>");
                    out.print("<META HTTP-EQUIV=Refresh CONTENT='0; URL=index.jsp?id=AL'>");
            }
            conn.close();
            
         }catch (Exception e) {
            e.printStackTrace();
        }
    }
    if (Hapus != null){
        String IDPD = request.getParameter("IDPD");
        try {
            Koneksi konek = new Koneksi();
            Connection conn = konek.bukaKoneksi();                  
            Statement stm = conn.createStatement();
            String q1 = "UPDATE `prosespelatihan` SET `Status`='OFF' WHERE `IdPendaftaran`='"+IDPD+"' ";
            System.out.println(q1);
            int result = stm.executeUpdate(q1);
            conn.close();
            out.print("<script>alert('Data Successfully')</script>");
            out.print("<META HTTP-EQUIV=Refresh CONTENT='0; URL=index.jsp?id=AL'>");
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
            Penialian Khusus
        </h1>
    </section>
    <br>
</div>
<div class="row">
    <div class="col-md-10 col-md-offset-1 col">
        <div class="col-md-12">
            <div class="table-responsive">
                <table id="example1" class="table table-bordered table-striped">
                    <thead style="color: #fff; background-color: #053A6E; border-color: #053A6E;">
                        <tr>
                            <th>ID PENDAFTARAN</th>
                            <th>Nama Lengkap</th>
                            <th>Nama Pelatihan</th>
                            <th>Tanggal</th>
                            <th>Skor</th>
                        </tr>
                    </thead>
                    <tbody id="edittableDV">
                        <%
                             try {
                                Koneksi konek = new Koneksi();
                                Connection conn = konek.bukaKoneksi();
                                Statement stm = conn.createStatement();
                                String SQLList="SELECT `prosespelatihan`.`IdPendaftaran` AS IDPD, `prosespelatihan`.`IdUser` AS IDU, "
                                        + "`user`.`NamaLengkap` AS NL , `prosespelatihan`.`IdJadwal` AS IDJ, "
                                        + "`jenispelatihan`.`NamaPelatihan` AS NP, `jadwalpelatihan`.`TglPelaksanaan` AS TGP, "
                                        + "`jadwalpelatihan`.`Waktu` AS W, `user`.`Level` AS LEV, `prosespelatihan`.`Skor` AS SKOR "
                                        + "FROM `jenispelatihan` "
                                        + "INNER JOIN `jadwalpelatihan` ON `jenispelatihan`.`IdPel` = `jadwalpelatihan`.`IdPel` "
                                        + "INNER JOIN `prosespelatihan` ON `prosespelatihan`.`IdJadwal` = `jadwalpelatihan`.`IdJadwal` "
                                        + "INNER JOIN `user` ON `prosespelatihan`.`IdUser` = `user`.`IdUser` "
                                        + "WHERE `prosespelatihan`.`Status`='ON'";
                                ResultSet res = stm.executeQuery(SQLList);
                                System.out.println("SQLList="+SQLList);
                                int NoUrut = 1;
                                while (res.next()) {
                                    out.print("<tr data-idven=" + res.getString("IDPD") + " > "
                                            + "<td>" + res.getString("IDPD") + "</td>"
                                            + "<td>" + res.getString("IDU") + " - " + res.getString("NL") + " - " + res.getString("LEV") + "</td>"
                                            + "<td>" + res.getString("IDJ") + " - " + res.getString("NP") + "</td>"
                                            + "<td>" + res.getString("TGP") + " - " + res.getString("W") + "</td>");
                                    if (res.getString("SKOR") != null) {
                                        out.print("<td>" + res.getString("SKOR") + "</td>");
                                    }else{
                                        out.print("<td align='center'>"
                                            + "<form method='post' action=''>"
                                            + "<input type='hidden' name='IDPD' value='" + res.getString("IDPD") + "'>"
                                            + "<input type='submit' name='Hapus' value='Scoring' class='btn-xs btn-success'>"
                                            + "</form>"
                                            + "</td>");
                                    out.print("</tr>");
                                    }
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
       
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Detil Packaging</h4>
      </div>
      <div class="modal-body">
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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