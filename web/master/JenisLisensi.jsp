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
        String TypeV = request.getParameter("TypeV");
        try {
            Koneksi konek = new Koneksi();
            Connection conn = konek.bukaKoneksi();                  
            Statement stm = conn.createStatement();
            String q1 = "INSERT INTO `jenispelatihan` "
                    + "(`IdPel`, `Level`, `NamaPelatihan`, `Stat`, `Timestamp`)"
                    + " values "
                    + "(UUID(), '"+TypeV+"', '"+name+"', 'ON', CURRENT_TIMESTAMP)";
            int result = stm.executeUpdate(q1);
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
        String IdPel = request.getParameter("IdPel");
        try {
            Koneksi konek = new Koneksi();
            Connection conn = konek.bukaKoneksi();                  
            Statement stm = conn.createStatement();
            String q1 = "DELETE FROM `jenispelatihan` WHERE `IdPel`='"+IdPel+"' ";
            int result = stm.executeUpdate(q1);
            conn.close();
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
            Management Lisensi
        </h1>
    </section>
    <br>
    <!-- general form elements -->
    <div class="box box-default">
        <form method="post" name="form" id="form">
            <input type="hidden" name="idDV" id="idDV1">
            <div class="box-body">
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Level</label><br>
                                <select class="form-control select2" name="TypeV" required="true"  id="TypeV1" >
                                <option value=""></option>
                                <option value="BEGINNER">BEGINNER</option>
                                <option value="MID">MID</option>
                                <option value="ADVANCE">ADVANCE</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="form-group">
                            <label>NAMA PELLATIHAN</label>
                            <input type="text" name="name" class="form-control" required="true" id="fokusproduk1" autocomplete="off">
                        </div>
                    </div>
                </div>
            </div>
            <div class="box-footer">
                <div class="col-md-12-3">
                    <div class="form-group">
                        <input style="align:right" type="submit" name="submit" id="addpc" value="submit" class="btn btn-success btn-block">
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
                            <th>Level</th>
                            <th>Hapus</th>
                        </tr>
                    </thead>
                    <tbody id="edittableDV">
                        <%
                             try {
                                Koneksi konek = new Koneksi();
                                Connection conn = konek.bukaKoneksi();
                                Statement stm = conn.createStatement();
                                String SQLList="SELECT `IdPel`, `Level`, `NamaPelatihan`, `Stat` FROM `jenispelatihan` ";
                                ResultSet res = stm.executeQuery(SQLList);
                                int NoUrut = 1;
                                while (res.next()) {
                                    out.print("<tr data-idven=" + res.getString("IdPel") + " > "
                                            + "<td>" + res.getString("IdPel") + "</td>"
                                            + "<td>" + res.getString("NamaPelatihan") + "</td>"
                                            + "<td>" + res.getString("Level") + "</td>"
                                            );
                                    out.print("<td align='center'>"
                                            + "<form method='post' action=''>"
                                            + "<input type='hidden' name='IdPel' value='" + res.getString("IdPel") + "'>"
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
        
        $(".select2").select2();
        $('#tgldibuatv').datepicker({
            autoclose: true,
            dateFormat: 'yy-mm-dd'
        });
    });
</script>