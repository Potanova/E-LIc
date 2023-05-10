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
        String usern = request.getParameter("usern");
        String pwd = request.getParameter("pwd");
        String al = request.getParameter("al");
        try {
            Koneksi konek = new Koneksi();
            Connection conn = konek.bukaKoneksi();                  
            Statement stm = conn.createStatement();
            String q1 = "INSERT INTO `user` "
                    + "(`IdUser`, `NamaLengkap`, `Level`, `Username`, `Password`, `StatusUser`, `Alamat`, `IdPembuat`, `Timestamp`)"
                    + " values "
                    + "(UUID(), '"+name+"', '"+TypeV+"', '"+usern+"', '"+pwd+"', 'ON', '"+al+"', '"+ip+"', CURRENT_TIMESTAMP)";
            int result = stm.executeUpdate(q1);
             if (result > 0) {
                    out.print("<script>alert('Data Successfully')</script>");
                    out.print("<META HTTP-EQUIV=Refresh CONTENT='0; URL=index.jsp?id=MUser'>");
                }
            conn.close();
            
         }catch (Exception e) {
            e.printStackTrace();
        }
    }
    if (Hapus != null){
        String IdUser = request.getParameter("IdUser");
        try {
            Koneksi konek = new Koneksi();
            Connection conn = konek.bukaKoneksi();                  
            Statement stm = conn.createStatement();
            String q1 = "DELETE FROM `user` WHERE `IdUser`='"+IdUser+"' ";
            int result = stm.executeUpdate(q1);
            conn.close();
            out.print("<META HTTP-EQUIV=Refresh CONTENT='0; URL=index.jsp?id=MUser'>");
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
            Management User
        </h1>
    </section>
    <br>
    <!-- general form elements -->
    <div class="box box-default">
        <form method="post" name="form" id="form">
            <input type="hidden" name="idDV" id="idDV1">
            <div class="box-body">
                <div class="row">
                    <div class="col-md-2">
                        <div class="form-group">
                            <label>Level</label><br>
                            <select class="form-control select2" name="TypeV" required="true"  id="TypeV1" >
                                <option value=""></option>
                                <option value="Penguji">PENGUJI</option>
                                <option value="Peserta">PESERTA</option>
                                <option value="Viewer">VIEWER</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>NAMA LENGKAP</label>
                            <input type="text" name="name" class="form-control" required="true" id="fokusproduk1" autocomplete="off">
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <label>USERNAME</label>
                            <input type="text" name="usern" minlength="8" class="form-control" required="true" id="fokusproduk1" autocomplete="off">
                        </div>
                    </div>
                    <div class="col-md-2">
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
                            <th>Nama User</th>
                            <th>Level</th>
                            <th>Username</th>
                            <th>Alamat</th>
                            <th>Hapus</th>
                        </tr>
                    </thead>
                    <tbody id="edittableDV">
                        <%
                             try {
                                Koneksi konek = new Koneksi();
                                Connection conn = konek.bukaKoneksi();
                                Statement stm = conn.createStatement();
                                String SQLList="SELECT `user`.`IdUser`, `user`.`StatusUser`, `user`.`Password`, "
                                        + "`user`.`NamaLengkap`, `user`.`IdPembuat`, `user`.`Level`, "
                                        + "`user`.`Username`, `user`.`Alamat` "
                                        + "FROM `user` "
                                        + "WHERE `IdUser` <> 9 ";
                                ResultSet res = stm.executeQuery(SQLList);
                                int NoUrut = 1;
                                while (res.next()) {
                                    out.print("<tr data-idven=" + res.getString("IdUser") + " > "
                                            + "<td>" + res.getString("IdUser") + "</td>"
                                            + "<td>" + res.getString("NamaLengkap") + "</td>"
                                            + "<td>" + res.getString("Level") + "</td>"
                                            + "<td>" + res.getString("Username") + "</td>"
                                            + "<td>" + res.getString("Alamat") + "</td>"
                                            );
                                    out.print("<td align='center'>"
                                            + "<form method='post' action=''>"
                                            + "<input type='hidden' name='IdUser' value='" + res.getString("IdUser") + "'>"
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
        $('#ptcap').change(function () {
            if($('#ptcap').val() == 'PT ASTANA KRIYA ANINDYA'){
                $('#ppn').val("10");                
                document.getElementById("ppn").readonly = true;
            }else{
                $('#ppn').val("0");
                document.getElementById("ppn").readonly = false;
            }            
        });
        $('#typebarang').change(function () {
            var type = $('#typebarang option:selected').val();
            if (type == 'SEASON') {
                document.getElementById("sesi").disabled = false;
                document.getElementById("itempkg").disabled = false;
                document.getElementById("package").disabled = true;
                document.getElementById("pkg").disabled = true;
            } else if (type == 'REGULER') {
                document.getElementById("package").disabled = false;
                document.getElementById("pkg").disabled = false;
                document.getElementById("sesi").disabled = true;
                document.getElementById("itempkg").disabled = true;
            }
        });
        $('#itempkg').change(function () {
//            alert($('#itempkg option:selected' ).val());
            $.getJSON('po/CekHasilMaster.jsp?callback=?', {
                itempkg: $('#itempkg option:selected').val()
            })
                    .done(function (data) {
                        $('#harga').empty();
                        $.each(data, function (i, item) {
                            $('#harga').val(item.Harga);
//                            console.log(item.Harga);
                        });
                    }).always(function () {
                $('#harga').focus();
            });
        });
        $('#package').change(function () {
//            alert($('#itempkg option:selected' ).val());
            $.getJSON('po/CekHasilMaster.jsp?callback=?', {
                package123: $('#package option:selected').val()
            })
                    .done(function (data) {
                        $('#harga').empty();
                        $.each(data, function (i, item) {
                            $('#harga').val(item.Harga);
//                            console.log(item.Harga);
                        });
                    }).always(function () {
                $('#harga').focus();
            });
        });
        $('#customerinduk').change(function () {
//            alert($('#customerinduk option:selected' ).text());
            $.getJSON('po/CekHasilMaster.jsp?callback=?', {
                level: $('#customerinduk option:selected').val()
            })
                    .done(function (data) {
                        $('#customer').empty();
                        $('#customer').append("<option value=''></option>");
                        $.each(data, function (i, item) {
                            $('#customer').append("<option value='" + item.id + "'>" + item.option + "</option>");
                            console.log(item.id + " , " + item.option);
                        });
                    });
        });
        $('#sesi').change(function () {
//            alert($('#customerinduk option:selected' ).text());
            $.getJSON('po/CekHasilMaster.jsp?callback=?', {
                sesi: $('#sesi option:selected').val()
            })
                    .done(function (data) {
                        $('#itempkg').empty();
                        $('#itempkg').append("<option value=''></option>");
                        $.each(data, function (i, item) {
                            $('#itempkg').append("<option value='" + item.IdJenis + "~" + item.NamaJenis + "~" + item.Pkg + "'>Item : " + item.NamaJenis + ", PKG : " + item.Pkg + "-- Stock = " + item.Pcs + "</option>");
                            console.log(item.IdJenis + " , " + item.NamaJenis + " , " + item.Pkg);
                        });
                    });
        });
        $('#customer').change(function () {
//            alert($('#customer option:selected').text());
            $.getJSON('po/CekHasilMaster.jsp?callback=?', {
                customer: $('#customer option:selected').val()
            })
                    .done(function (data) {
                        $('#diskon').empty();
//                        $('#diskon').append("<value=''>");
                        $.each(data, function (i, item) {
                            $('#diskon').val(item.Diskon);
                            $('#nopocus').val(item.IdToko);
//                            console.log(item.Diskon);
                        });
                    });
        });
        $('#addpo').on('click', function () {
            var type = $('#typebarang option:selected').val();
            if (type == 'REGULER') {
                if (barang <= 16) {
                    var belom = true;
                    var idcust = $("#customer").val();
                    var nama = $("#customer :selected").text();
                    var namapackage = $("#package").val();
                    var produk = $("#package :selected").val();
                    var Barang = produk.split('~');
                    var idpkg = Barang[0];
                    var namapkg = Barang[1];
                    var pkg = $("#pkg").val();
                    var qty = $("#qty").val();
                    var harga = $("#harga").val();

                    var qtyun = realval(qty);
                    var hargaun = realval(harga);
                    var hargaun1 = realval(harga);
                    var total = 0;
                    
                    if($('#ptcap').val() == 'PT ASTANA KRIYA ANINDYA'){
                        hargaun = parseInt(realval(harga))/1.1;
                        hargaun1 = Math.floor(hargaun);
                //        hargaun = parseInt(hargaun);
                    }else{
                        hargaun1 = realval(harga);
                    }
                    var total = 0;

                    $.each(udahmasuk, function (index, value) {
                        if (value.cus == idcust && value.idbrg == idpkg && value.paket == pkg) {
                            //console.log('id barang = '+value.idbrg+' == '+ idpkg +' paket = '+value.paket+' == '+namapackage);
                            belom = false;
                        }
                    });
                    if (namapackage == "" || pkg == "" || qty == "" || harga == ""){
                        belom = false;
                    }

                    if (belom) {
                        urutan++;
                        barang++;
                        console.log(qtyun + " * " + hargaun1);
                        total = (parseInt(qtyun) * parseInt(hargaun1));
                        totalDiskon = total * (parseInt($("#diskon").val()) / 100);
                        totalPPN = total * (parseInt($("#ppn").val()) / 100);
                        var totalNet = total - totalDiskon + totalPPN;

                        udahmasuk.push({cus: idcust, idbrg: idpkg, paket: pkg});
                        $("<tr id='tr" + barang + "'>\n\
                            <td id='ur" + barang + "' class=idnya >" + barang + "</td>\n\
                            <td>" + nama + "</td>\n\
                            <td>" + namapkg + "</td>\n\
                            <td>" + pkg + "</td>\n\
                            <td>" + qty + "</td>\n\
                            <td>" + hargaun1 + "</td>\n\
                                    \n\<td><button type='button' \n\
data-pkg=" + pkg + " \n\
data-brg=" + idpkg + " \n\
data-cust=" + idcust + " \n\
class='btn btn-danger form-control delete' >Delete</button></td></tr>").appendTo("table tbody");
                        $("<div id='div" + barang + "'><input type=hidden name=idpkg value=" + idpkg + " ><input type=hidden name=idcust value=" + idcust + " ><input type=hidden name=pkg1 value=" + pkg + " ><input type=hidden name=qty1 value=" + qtyun + " ><input type=hidden name=harga1 value=" + hargaun1 + " ><input type=hidden name=total value=" + total + ">").appendTo("#bahanpackage");
                        $("#package").val(null).trigger("change");
                        $("#pkg").val(null).trigger("change");
                        $("#qty").val("0");
                        $("#harga").val("0");
                    } else {
                        alert('Item Sudah Ada / Tidak Lengkap');
                    }
                } else {
                    alert('Jumlah Item Sudah 17');
                }
            } else if (type == 'SEASON') {
                if (barang <= 16) {
                    var belom = true;

                    var idcust = $("#customer").val();
                    var nama = $("#customer :selected").text();
                    var qty = $("#qty").val();
                    var harga = $("#harga").val();
                    var pkg1 = $("#itempkg :selected").val();
                    var itmpkg = pkg1.split('~');
                    var idpkg = itmpkg[0];
                    var namapkg = itmpkg[1];
                    var pkg = itmpkg[2];

                    var qtyun = realval(qty);
                    var hargaun = realval(harga);
                    var total = 0;
                    var hargaun1 = realval(harga);
                    
                    if($('#ptcap').val() == 'PT ASTANA KRIYA ANINDYA'){
                            hargaun = parseInt(realval(harga))/1.1;
                            hargaun1 = Math.floor(hargaun);
                    //        hargaun = parseInt(hargaun);
                        }else{
                            hargaun1 = realval(harga);
                        }
                        var total = 0;
                    
                    $.each(udahmasuk, function (index, value) {
                        if (value.cus == idcust && value.idbrg == idpkg && value.paket == pkg) {
                            //console.log('id barang = '+value.idbrg+' == '+ idpkg +' paket = '+value.paket+' == '+namapackage);
                            belom = false;
                        }
                    });
                    if (idpkg == "" || pkg == "" || qty == "" || harga == ""){
                        belom = false;
                    }

                    if (belom) {
                        urutan++;
                        barang++;
                        total = (parseInt(qtyun) * parseInt(hargaun1));
                        totalDiskon = total * (parseInt($("#diskon").val()) / 100);
                        totalPPN = total * (parseInt($("#ppn").val()) / 100);
                        var totalNet = total - totalDiskon + totalPPN;

                        udahmasuk.push({cus: idcust, idbrg: idpkg, paket: pkg});
                        $("<tr id='tr" + barang + "'>\n\
                                <td id='ur" + barang + "' class=idnya >" + barang + "</td>\n\
                                <td>" + nama + "</td><td>" + namapkg + "</td>\n\
                                <td>" + pkg + "</td><td>" + qty + "</td>\n\
                                <td>" + hargaun1 + "</td>\n\
<td><button type='button' \n\
data-pkg=" + pkg + " \n\
data-brg=" + idpkg + " \n\
data-cust=" + idcust + " \n\
class='btn btn-danger form-control delete' >Delete</button></td></tr>").appendTo("table tbody");
$("<div id='div" + barang + "'><input type=hidden name=idpkg value=" + idpkg + " ><input type=hidden name=idcust value=" + idcust + " ><input type=hidden name=pkg1 value=" + pkg + " ><input type=hidden name=qty1 value=" + qtyun + " ><input type=hidden name=harga1 value=" + hargaun1 + " ><input type=hidden name=total value=" + total + " >").appendTo("#bahanpackage");
                        $("#qty").val("0");
                        $("#harga").val("0");
                        $("#itempkg").val(null).trigger("change");
//                        $("#sesi").val(null).trigger("change");
                    } else {
                        alert('Item Sudah Ada / Tidak Lengkap');
                    }
                } else {
                    alert('Jumlah Item Sudah 17');
                }
            }
        });
        //function delete baru
        $("tbody").on('click', '.delete', function () {
            var idnya = parseInt($(this).closest('tr').find('.idnya').text());
            var idpkg = $(this).attr('data-brg');
            var pkg = $(this).attr('data-pkg');
            var idcust = $(this).attr('data-cust');

            if (barang == idnya) {
                barang--;
                $('#tr' + idnya + '').remove();
                $('#div' + idnya + '').remove();
            } else {
                var barang2 = barang;
                //alert('masuk, x = '+(idnya+1));
                $('#tr' + idnya + '').remove();
                $('#div' + idnya + '').remove();
                for (var x = idnya + 1; x <= barang2; x++) {
                    $('#ur' + x).empty();
                    $('#ur' + x).append((x - 1));
                    $('#tr' + x).attr('id', 'tr' + (x - 1));
                    $('#div' + x).attr('id', 'div' + (x - 1));
                    $('#ur' + x).attr('id', 'ur' + (x - 1));
                }
                barang--;
            }
            $.each(udahmasuk, function (index, value) {
                console.log(index + ' id barang = ' + value.idbrg + ' == ' + idpkg + ' paket = ' + value.paket + ' == ' + pkg);
                if (value.cus == idcust && value.idbrg == idpkg && value.paket == pkg) {
                    console.log(index + ' di delete');
                    udahmasuk.splice(index, 1);
                    return false;
                }
            });
        });
        //sampe sini ya
    });
    var udahmasuk = new Array();
    var totalDiskon = 0;
    var totalPPN = 0;
    var barang = 0;
    var urutan = 0;
    
    
    $(document).ready(function () {
        $(".select2").select2();
        $('#tgldibuatv').datepicker({
            autoclose: true,
            dateFormat: 'yy-mm-dd'
        });
    });
</script>