<%@page import="jdbc.Koneksi"%>
<%@page import="java.sql.*"%>

<%
    if (session.getAttribute("isLogin") == null) {
        session.setAttribute("isLogin", "false");
    }
    session.setAttribute("error", "");
    try {
        if (session.getAttribute("isLogin").equals("true")) {
            //out.print("<script>alert('"+session.getAttribute("user_id").toString()+"')</script>");
%>
<html>
    <head>
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
        <!--<link rel="stylesheet" href="bootstrap/css/font-awesome.min.css">-->
        <!-- Ionicons -->
        <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
        <!--<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
              integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">-->
        <!--<link rel="stylesheet" href="bootstrap/css/ionicons.min.css">-->
        <!-- Theme style -->
        <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
        <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
        <!--<link rel=stylesheet href=dist/css/skins/skin-red.min.css as=style>-->
        <!-- iCheck -->
        <link rel="stylesheet" href="plugins/iCheck/flat/blue.css">
        <!-- Date Picker -->
        <link rel="stylesheet" href="plugins/datepicker/datepicker3.css">
        <link rel="stylesheet" href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">

        <!--<link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">-->

        <link rel="stylesheet" href="plugins/jQueryUI/jquery-ui.css" type="text/css" />
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.10.3/themes/blitzer/jquery-ui.css" type="text/css" />
        <script src="plugins/jQuery/jquery.redirect.js"></script>
        <script type="text/javascript" src="bootstrap/js/jquery.maskMoney.js"></script>
        
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script>

        <!--<script src="plugins/datatables/tableHeadFixer.js"></script>-->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/fixedcolumns/3.2.4/css/fixedColumns.dataTables.min.css">
        
        <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'>
</head>

<body class="hold-transition skin-green sidebar-menu">
    <div class="wrapper">
        <header class="main-header">
            <!-- Logo -->
            <a href="index.jsp" class="logo">
                <span class="logo-lg"><b>Lisesni</b></span>
            </a>
            <nav class="navbar navbar-static-top" role="navigation" colour="black">
                <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                </a>
                <div class="navbar-custom-menu">
                    <ul class="nav navbar-nav">
                        <li><a href=""><i class=""></i> <%=session.getAttribute("Level").toString().toUpperCase()%>   -   <%=session.getAttribute("NamaLengkap").toString().toUpperCase()%></a></li>
                    </ul>
                </div>
            </nav>
        </header>

        <!-- Left side column. contains the logo and sidebar -->
        <aside class="main-sidebar">
            <!-- sidebar: style can be found in sidebar.less -->
            <section class="sidebar">
                <jsp:include page="header.jsp" />
            </section>
            <!-- /.sidebar -->
        </aside>

        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <div class="content">
                <div class="row">
                    <%String kode = request.getParameter("id");
                        if (kode == null) {
                    %> <jsp:include page="home.jsp" />
                    <%} else if (kode.equals("MUser")) {%>
                    <jsp:include page="master/User.jsp"/>
                    
                    <%} else if (kode.equals("JLin")) {%>
                    <jsp:include page="master/JenisLisensi.jsp"/>
                    
                    <%} else if (kode.equals("JdP")) {%>
                    <jsp:include page="master/JadwalPelatihan.jsp"/>
                    
                    <%} else if (kode.equals("AL")) {%>
                    <jsp:include page="Lisensi/AssignLisensi.jsp"/>
                    
                    <%} else if (kode.equals("HPL")) {%>
                    <jsp:include page="Lisensi/HasilPenilaianLisensi.jsp"/>
                    
                    <%} else if (kode.equals("KUL")) {%>
                    <jsp:include page="Lisensi/KerjakanUjianLisensi.jsp"/>
                    
                    <%} else if (kode.equals("PMK")) {%>
                    <jsp:include page="Lisensi/PenilaianManualKhusus.jsp"/>
                    
                    <%} else if (kode.equals("eEkLu31y")) {%>
                    <jsp:include page="Report/ListJadwlsid.jsp"/>
                    <%}%>
                </div>
            </div><!-- /.content-wrapper -->
        </div>


        <footer class="main-footer">
            <jsp:include page="footer.jsp" />
        </footer>
    </div><!-- ./wrapper -->

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

</body>
</html>
<%
        } else {
            response.sendRedirect("index.html");
        }
    } catch (Exception e) {
        response.sendRedirect("index.html");
    }

%>


