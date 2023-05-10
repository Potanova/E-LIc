<%
    try {
        if (session.isNew() == false && session.getAttribute("isLogin").equals("false")) {
%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<title>License System</title>

<meta name="author" content="">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <div class="" >
            <div class="panel-heading" style="text-align: right">
                <div class="panel-title" align="right"></div>
                
            </div>  

<!-- App favicon -->
<link rel="shortcut icon" href="logo_indos.png">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="bootstrap/jquery-ui/jquery-ui.css" type="text/css" >
<script src="bootstrap/jquery-ui/jquery-ui.js"></script>

<Script type="text/javascript">
    window.history.forward();
    function noBack() {
        window.history.forward();
    }
    
    function goToCreateUser() {
        window.location.href = "Peserta.jsp";
    }
</script>

<!--div style="background-image:url(''); width:2300px; height: 700px;" class="container img-responsive"--> 
	
	   
    <div id="loginbox" style="margin-top:10px;" class="mainbox col-md-4 col-md-offset-4 ">                    

        <div class="account-logo-box">
                <h3 class="text-uppercase text-center">
                    <a href="" class="text-success">
                        <span>
			<img src="assets/images/pilotlogo.jpg" class="img-fluid" style="width:350px; height:200px;">
			</span>
                    </a>
                </h3>
            <h2 align="center"><b>License for Aircraft Crew</b></h2>
        </div>
           

            <div style="padding-top:10px" class="panel-body" >

                <form action="1plogin.jsp" method="post" onload="noBack();" class="form-horizontal" role="form">
        <%
            String ValidateMessage = "";
            ValidateMessage = "Incorrect Username or Password";
            if (session.getAttribute("error") != null && session.getAttribute("error") != "") {
                out.print("<div class='alert alert-danger' id='demo-alert'><a href='#' class='close' data-dismiss='alert'>×</a>" + ValidateMessage + "</div>");
            }
        %>
                    <div class="col-md-10 col-md-offset-1">  
                    <div style="margin-bottom: 15px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input id="login-username" type="text" class="form-control" name="username" value="" placeholder="Username" autocomplete="off" onfocus="javascript: if (this.value == 'nama anda') {
                                    this.value = '';
                                }" onblur="javascript: if (this.value == '') {
                                            this.value = 'nama anda';
                                        }">                                        
                    </div>
                    <div style="margin-bottom: 15px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                        <input id="login-password" type="password" class="form-control" name="password" placeholder="Password" onfocus="javascript: if (this.value == 'password anda') {
                                    this.value = '';
                                }" onblur="javascript: if (this.value == '') {
                                            this.value = 'password anda';
                                        }">
                    </div>      
                    <div class="col-md-12">    
                        <div class="form-group" >
                            <input name="login" value="Login" type="submit" class="btn btn-primary  btn-block">
                        </div>
                        <div class="form-group" >
                            <a href="#" onclick="goToCreateUser();">Create User</a>
                        </div>
                    </div>
                    <div align="center"><a href="index.html">back to web</a></div>
                    </div>
                </form>  
            </div>                      
    </div>
</div>
<%
        } else {
            response.sendRedirect("index.jsp");
        }
    } catch (Exception e) {
        response.sendRedirect("index.jsp");
    }
%>