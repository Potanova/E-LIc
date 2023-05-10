<ul class="sidebar-menu">
    <li><a href="index.jsp"><i class="fa fa-cube"></i> DASHBOARD</a></li>
    <%  if (session.getAttribute("Level").equals("admin")) {%>
    <li class="treeview">
        <a href="#">
            <i class="fa fa-archive"></i> <span> MASTER</span> <i class="fa fa-angle-left pull-right"></i>
        </a>
        <ul class="treeview-menu">
            <li><a href="index.jsp?id=MUser"><i class="fa fa-user"></i> <span> MANAGEMENT USER</span></a></li>
            <li><a href="index.jsp?id=JLin"><i class="fa fa-clone"></i> <span> JENIS LISENSI</span></a></li>
            <li><a href="index.jsp?id=JdP"><i class="fa fa-street-view"></i> <span> JADWAL PELATIHAN LISENSI</span></a></li>
        </ul>
    </li>
    <% } if ( (session.getAttribute("Level").equals("Peserta")) || (session.getAttribute("Level").equals("admin")) ) {%>
    <li><a href="index.jsp?id=AL"><i class="fa fa-search"></i> Pilih Lisensi </a></li>
    <li><a href="index.jsp?id=KUL"><i class="fa fa-th-large"></i> Ujian Lisensi </a></li>
    <li><a href="index.jsp?id=HPL"><i class="fa fa-cloud-upload"></i> Hasil Lisensi </a></li>
    <% } if ( (session.getAttribute("Level").equals("Penguji"))  || (session.getAttribute("Level").equals("admin")) ) {%>
    <li><a href="index.jsp?id=PMK"><i class="fa fa-pencil"></i> Penilaian Manual Peserta </a></li>
    <% } if ( (session.getAttribute("Level").equals("admin")) ) {%>
    <li class="treeview">
        <a href="#">
            <i class="fa fa-file-pdf-o"></i> <span> REPORT</span> <i class="fa fa-angle-left pull-right"></i>
        </a>
        <ul class="treeview-menu">
            <li><a href="index.jsp?id=30PlWW"><i class="fa fa-user"></i> <span> USER</span></a></li>
            <li><a href="index.jsp?id=eEkLu31y"><i class="fa fa-line-chart"></i> <span> JADWAL SIDANG</span></a></li>
        </ul>
    </li>
    <% } %>
    <li><a href="logout.jsp"><i class="fa fa-send-o"></i> Sign out</a></li>
    <br>
</ul>