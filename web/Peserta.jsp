<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="jdbc.Koneksi"%>
<%@page import="java.sql.*"%>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>License System</title>
<!-- Tell the browser to be responsive to screen width -->
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<!-- jQuery 2.1.4 -->
<script src="plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- Bootstrap 3.3.5 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<!-- Select2 -->
<link rel="stylesheet" href="plugins/select2/select2.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="dist/css/AdminLTE.min.css">
<link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
<!-- iCheck -->
<link rel="stylesheet" href="plugins/iCheck/flat/blue.css">
<!-- Date Picker -->
<link rel="stylesheet" href="plugins/datepicker/datepicker3.css">
<link rel="stylesheet" href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
<link rel="stylesheet" href="plugins/jQueryUI/jquery-ui.css" type="text/css" />
<link rel="stylesheet" href="https://code.jquery.com/ui/1.10.3/themes/blitzer/jquery-ui.css" type="text/css" />
<script src="plugins/jQuery/jquery.redirect.js"></script>
<script type="text/javascript" src="bootstrap/js/jquery.maskMoney.js"></script>
        
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script>

<!--<script src="plugins/datatables/tableHeadFixer.js"></script>-->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/fixedcolumns/3.2.4/css/fixedColumns.dataTables.min.css">
        
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'>

<%
        SimpleDateFormat FormatD = new SimpleDateFormat("dd-MM-yyyy");   
        java.util.Date today_date = new java.util.Date();  
        String submit = request.getParameter("submit");
        String Hapus = request.getParameter("Hapus");
//        System.out.println("submit ="+submit);
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
    %>
<div class="col-md-6 col-md-offset-3">
    <section class="content-header">
        <div class="col-md-1">
            <a href="1login.jsp"><input type="button"  value="Back" class="btn btn-success btn-flat"/></a>
        </div>
    </section><br>
    <section class="content-header">
        <h1 align="center"><b>
            Pendaftaran Peserta
        </b></h1>
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
                            <input type="text" name="usern" class="form-control" required="true" autocomplete="off">
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>PASSWORD</label>
                            <input type="text" name="pwd" class="form-control" required="true" id="fokusproduk1" autocomplete="off">
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
                        <input style="align:right" type="submit" name="submit" value="submit" class="btn btn-primary btn-block">
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>


<!-- jQuery UI 1.11.4 -->
    <script src="plugins/jQueryUI/jquery-ui.min.js"></script>
    <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
    <script>
        $.widget.bridge('uibutton', $.ui.button);
    </script>
    <!-- Bootstrap 3.3.5 -->
    <script src="bootstrap/js/bootstrap.min.js"></script>

    <script src="plugins/datepicker/bootstrap-datepicker.js"></script>
    <!-- Bootstrap WYSIHTML5 -->
    <script src="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
    <!-- Slimscroll -->
    <script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <script src="plugins/fastclick/fastclick.min.js"></script>
    <!-- AdminLTE App -->
    <script src="dist/js/app.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="dist/js/demo.js"></script>
    <!-- Select2 -->
    <script src="plugins/select2/select2.full.min.js"></script>
    <!-- DataTables -->
    <script src="plugins/datatables/jquery.dataTables.min.js"></script>
    <!--<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>-->
    <script src="https://cdn.datatables.net/fixedcolumns/3.2.4/js/dataTables.fixedColumns.min.js"></script>

    <script src="plugins/jQuery/jquery.easy-confirm-dialog.js"></script>

    <script src="plugins/jQueryUI/jquery-ui.js"></script>
    
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