<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="jdbc.Koneksi"%>
<%@page import="java.sql.*"%>


<div class="col-md-12">
    <div class="row">
        <section class="content-header">
            <h1><i class="fa fa-lock"></i> JADWAL SIDANG
            </h1>
            </section>
    </div><br>
    <div class="box box-warning">
        <div class="row">
        <div class="col-md-12">
            <form method="post" action="Report/LapJad.jsp" target="_blank">
                <br>
                <input type="submit" class="btn btn-primary btn-block form-control" name="Rep" value="Download">
            </form>
         </div>
        <div class="col-md-12">
            <div class="table-responsive">
                <table id="example1" class="table table-bordered table-striped">
                    <thead style="color: #fff; background-color: #053A6E; border-color: #053A6E;">
                        <tr>
                            <th>Nama Perkara</th>
                            <th>Tgl Sidang</th>
                            <th>Jam Sidang</th>
                            <th>KUHP</th>
                            <th>Jaksa</th>
                            <th>Jaksa Penuntut</th>
                            <th>pEMBUAT LAPORAN</th>
                            <th>Tahanan</th>
                            <th>Jenis</th>
                        </tr>
                    </thead>
                    <tbody id="edittableDV">
                        <%
                             try {
                                Koneksi konek = new Koneksi();
                                Connection conn = konek.bukaKoneksi();
                                Statement stm = conn.createStatement();
                                String SQLList="SELECT `jenissidang`.`NamaJenisSidang`, `tahanan`.`NamaTahanan`, `perkara`.`StatPerkara`, `perkara`.`IdPerkara`, "
                                        + "`user2`.`NamaLengkap`, `user1`.`NamaLengkap` AS `NamaLengkap1`, `user`.`NamaLengkap` AS `NamaLengkap2`, "
                                        + "`perkara`.`KUHP`, `perkara`.`NamaPerkara`, `perkara`.`TglSidang`, `perkara`.`Disetujui`, "
                                        + "`perkara`.`Tiestamp`, `perkara`.`IdPembuat`, `user2`.`IdUser`, `perkara`.`JamSidang` "
                                        + "FROM `perkara` "
                                        + "INNER JOIN `user` ON `user`.`IdUser` = `perkara`.`IdJaksa` "
                                        + "INNER JOIN `tahanan` ON `tahanan`.`IdTahanan` = `perkara`.`IdTahanan` "
                                        + "INNER JOIN `user` `user1` ON `user1`.`IdUser` = `perkara`.`IdJaksaPenuntut` "
                                        + "INNER JOIN `user` `user2` ON `user2`.`IdUser` = `perkara`.`IdPembuat` "
                                        + "INNER JOIN `jenissidang` ON `jenissidang`.`IdJenisSidang` = `perkara`.`IdJenisSidang`";
                                ResultSet res = stm.executeQuery(SQLList);
                                int NoUrut = 1;
                                while (res.next()) {
                                    out.print("<tr data-idven=" + res.getString("NamaPerkara") + " > "
                                            + "<td class=tdnamaven>" + res.getString("NamaPerkara") + "</td>"
                                            + "<td class=tdnamaven>" + res.getString("TglSidang") + "</td>"
                                            + "<td class=tdnamaven>" + res.getString("JamSidang") + "</td>"
                                            + "<td class=tdnamaven>" + res.getString("KUHP") + "</td>"
                                            + "<td class=tdnamaven>" + res.getString("NamaLengkap2") + "</td>"
                                            + "<td class=tdnamaven>" + res.getString("NamaLengkap1") + "</td>"
                                            + "<td class=tdnamaven>" + res.getString("NamaLengkap") + "</td>"
                                            + "<td class=tdnamaven>" + res.getString("NamaTahanan") + "</td>"
                                            + "<td class=tdnamaven>" + res.getString("NamaJenisSidang") + "</td>");
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
                    
<script src="plugins/select2/select2.full.min.js"></script>
<script>
    $(document).ready(function () {
        $(".select2").select2();
        $('#tgldibuatv').datepicker({
            autoclose: true,
            dateFormat: 'yy-mm-dd'
        });
    });
</script>