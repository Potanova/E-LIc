<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="jdbc.Koneksi"%>
<%@page import="java.sql.*"%>

<%--
        SimpleDateFormat FormatD = new SimpleDateFormat("dd-MM-yyyy");   
        java.util.Date today_date = new java.util.Date();  
        String submit = request.getParameter("submit");
        String Hapus = request.getParameter("Hapus");
        String ip = session.getAttribute("IdUser").toString();
        if (submit != null){
            String name = request.getParameter("name");
            String usern = request.getParameter("usern");
            String pwd = request.getParameter("pwd");
            String al = request.getParameter("al");
            try {
                Koneksi konek = new Koneksi();
                Connection conn = konek.bukaKoneksi();                  
                Statement stm = conn.createStatement();
                System.out.println("name: "+name);
                System.out.println("usern: "+usern);
                System.out.println("pwd: "+pwd);
                System.out.println("al: "+al);
                String q1 = "INSERT INTO `user` "
                        + "(`NamaLengkap`, `Level`, `Username`, `Password`, `StatusUser`, `Alamat`,  `Timestamp`)"
                        + " values "
                        + "('"+name+"', 'Peserta', '"+usern+"', '"+pwd+"', 'ON', '"+al+"', CURRENT_TIMESTAMP)";
                System.out.println("sql: "+q1);
                int result = stm.executeUpdate(q1);
                if (result > 0) {
                    out.print("<script>alert('Data Successfully')</script>");
                }
                conn.close(); 
           }catch (Exception e) {
               e.printStackTrace();
           }
        }
    
    --%>
<style>
    td,th {font-size: 12px !important;}
</style>
<div class="col-md-6 col-md-offset-3 col">
    <section class="content-header">
        <h1>
            Pendaftaran Peserta
        </h1>
    </section>
    <br>
    <!-- general form elements -->
    <div class="box box-warning">
        <form method="post" name="form" id="form">
            <input type="hidden" name="idDV" id="idDV1">
            <div class="box-body">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>NAMA LENGKAP</label>
                            <input type="text" name="name" class="form-control" required="true" autocomplete="off">
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>USERNAME</label>
                            <input type="text" name="usern" minlength="8" class="form-control" required="true" autocomplete="off">
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>PASSWORD</label>
                            <input type="text" name="pwd" minlength="8" class="form-control" required="true" id="fokusproduk1" autocomplete="off">
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>ALAMAT</label>
                            <textarea name="al" class="form-control" rows='3' autocomplete="off" required></textarea>
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


    
<script src="plugins/select2/select2.full.min.js"></script>
<script>
    
    function angka(e) {
        if (!/^[0-9.]+$/.test(e.value)) {
            e.value = e.value.substring(0, e.value.length - 1);
        }
    }
    $(document).ready(function () {
        $('.money').maskMoney({thousands: '.', precision: 0});
        }
 
    $(document).ready(function () {
        $(".select2").select2();
        $('#tgldibuatv').datepicker({
            autoclose: true,
            dateFormat: 'yy-mm-dd'
        });
    });
</script>