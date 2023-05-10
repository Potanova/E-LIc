<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="jdbc.Koneksi"%>
<%@page import="java.sql.*"%>


<div class="col-md-12">
    <div class="row">
        <section class="content-header"> <h1><i class="fa fa-lock"></i> JADWAL SIDANG </h1> </section>
    </div><br>
    
        <div class="col-md-12">
            <div class="table-responsive">
                <table id="example1" class="table table-bordered table-striped">
                    <thead style="color: #fff; background-color: #053A6E; border-color: #053A6E;">
                        <tr>
                            <th>Id Tahanan</th>
                            <th>Nama tahanan</th>
                            <th>Gender</th>
                        </tr>
                    </thead>
                    <tbody id="edittableDV">
                        <%
                             try {
                                Koneksi konek = new Koneksi();
                                Connection conn = konek.bukaKoneksi();
                                Statement stm = conn.createStatement();
                                String SQLList="SELECT `tahanan`.`TempatLahir`, `tahanan`.`Gender`, `tahanan`.`IdTahanan`, "
                                            +"`tahanan`.`NamaTahanan`, `tahanan`.`TglLahir`, `tahanan`.`ktp`, "
                                            +"`tahanan`.`StatTahanan`, `tahanan`.`IdPembuat` "
                                            +"FROM `tahanan` ";
                                ResultSet res = stm.executeQuery(SQLList);
                                int NoUrut = 1;
                                while (res.next()) {
                                    out.print("<tr data-idven=" + res.getString("IdTahanan") + " > "
                                            + "<td class=tdnamaven>" + res.getString("IdTahanan") + "</td>"
                                            + "<td class=tdnamaven>" + res.getString("NamaTahanan") + "</td>"
                                            + "<td class=tdnamaven>" + res.getString("Gender") + "</td>");
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