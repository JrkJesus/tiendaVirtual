<%-- 
    Document   : changePwd
    Created on : 21-ene-2016, 10:57:19
    Author     : jesus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="Shortcut Icon" type="image/x-icon" href="http://www.homexpertz.co.za/img/hand-icon-grey.png" /> 
        <title> Cambiar contraseña</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <style>     
            .jumbotron {
                margin-bottom: 0;
                padding-top: 1.5ex;
            }
        </style>
    </head>
    <body>
        <%@include file="../include/cabecera.jsp" %>
        <%@include file="../include/menu.jsp" %>
        
        <div id = "contenedor" class="center-block">
            <form method="POST" action="/vendelo/change_p" role="form">
                <div class="row center-block" >
                    <div class="col-md-4 col-md-offset-4">
                        <div class="well">
                            ${requestScope.msg}
                            <label for="email">Por seguridad introduce tu email: </label>
                            <input type="email" class="form-control" name="email" id="email" placeholder="Enter email"/>
                            <br>
                            <label for="o_pwd">Contraseña antigua: </label>
                            <input type="password" class="form-control" name="o_pwd" id="o_pwd" placeholder="Enter old password"/>
                            <br>
                            <label for="n_pwd">Nueva contraseña: </label>
                            <input type="password" class="form-control" name="n_pwd" id="n_pwd" placeholder="Enter new password"/>
                            <br>
                             <label for="n_pwd_r">Nueva contraseña: </label>
                            <input type="password" class="form-control" name="n_pwd_r" id="n_pwd_r" placeholder="Verify password"/>
                            <br>
                            <input type="submit" name="Conectar" value="Cambiar contraseña" class="btn btn-primary center-block"/> 
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <%@include file="../include/footer.jsp" %>
    </body>
</html>
