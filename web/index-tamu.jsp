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
    String cari = request.getParameter("cari");
    String ids = request.getParameter("ids");
%>
<div class="col-md-12">
    <div class="row">
        <section class="content-header">
            <div class="col-md-1">
               <a href="index.html"><input type="button"  value="Back" class="btn btn-success btn-flat"/></a>
            </div>
        </section><br>
        <section class="content-header">
            <h1 align="center"><b> VERIFIKASI LISENSI </b></h1>
        </section><br>
    </div>
    <div class="row">
        <div class="col-md-10 col-md-offset-1 col">
        <form name="form" method="post" > 
        <div class="box box-comment" id=pt>
            <div class="box-body pad">
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>ID User</label>
                            <input type="text" name="ids" class="form-control" autocomplete="off" required>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <label>&nbsp; </label>
                            <input type="submit" class="btn btn-primary btn-block form-control" name="cari" value="cari">
                        </div>
                    </div>
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
                <table class="table table-bordered table-striped">
                    <thead style="color: #fff; background-color: #053A6E; border-color: #053A6E;">
                        <tr>
                            <th>No</th>
                            <th>ID USER</th>
                            <th>Nama Lengkap</th>
                            <th>No Pendaftaran</th>
                            <th>Nama Pelatihan</th>
                            <th>Tanggal</th>
                            <th>Skor</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            System.out.println("ids ="+ids);
                             try {
                                Koneksi konek = new Koneksi();
                                Connection conn = konek.bukaKoneksi();
                                Statement stm = conn.createStatement();
                                String SQLList="SELECT `prosespelatihan`.`IdPendaftaran` AS IDPD, `prosespelatihan`.`IdUser` AS IDU, "
                                        + "`user`.`NamaLengkap` AS NL , `prosespelatihan`.`IdJadwal` AS IDJ, `prosespelatihan`.`StatLulus` AS L, "
                                        + "`jenispelatihan`.`NamaPelatihan` AS NP, `jadwalpelatihan`.`TglPelaksanaan` AS TGP, "
                                        + "`jadwalpelatihan`.`Waktu` AS W, `user`.`Level` AS LEV, `prosespelatihan`.`Skor` AS SKOR "
                                        + "FROM `jenispelatihan` "
                                        + "INNER JOIN `jadwalpelatihan` ON `jenispelatihan`.`IdPel` = `jadwalpelatihan`.`IdPel` "
                                        + "INNER JOIN `prosespelatihan` ON `prosespelatihan`.`IdJadwal` = `jadwalpelatihan`.`IdJadwal` "
                                        + "INNER JOIN `user` ON `prosespelatihan`.`IdUser` = `user`.`IdUser` "
                                        + "WHERE `prosespelatihan`.`IdUser` = '"+ids+"' AND "
                                        + "`prosespelatihan`.`Status`='ON'";
                                ResultSet res = stm.executeQuery(SQLList);
                                System.out.println("SQLList="+SQLList);
                                int NoUrut = 1;
                                while (res.next()) {
                                    out.print("<tr data-idven=" + res.getString("IDPD") + " > "
                                            + "<td>" + NoUrut + "</td>"
                                            + "<td>" + res.getString("IDU") + "</td>"
                                            + "<td>" + res.getString("NL") + " - " + res.getString("LEV") + "</td>"
                                            + "<td>" + res.getString("IDPD") + "</td>"     
                                            + "<td>" + res.getString("IDJ") + " - " + res.getString("NP") + "</td>"
                                            + "<td>" + res.getString("TGP") + " - " + res.getString("W") + "</td>"
                                           );
                                    if (res.getString("SKOR") != null) {
                                        out.print("<td>" + res.getString("SKOR") + "</td>"
                                                + "<td>" + res.getString("L") + "</td>");
                                    }else{
                                        out.print("<td> - </td>"
                                                + "<td> - </td>");
                                    }
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
    <script>
        $(function () {
            //Initialize Select2 Elements
            $(".select2").select2();
            $("#example1").DataTable();
//            var table = $("#example1").DataTable({
//            "scrollX": true,
//            fixedColumns: {
//                leftColumns: 2
//            }
//        });
            ex3 = $("#example3").DataTable();
            $('#example2').DataTable({
                "paging": true,
                "lengthChange": false,
                "searching": false,
                "ordering": true,
                "info": true,
                "autoWidth": false
            });
        });
        
    </script>