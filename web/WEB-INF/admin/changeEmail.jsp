<%-- 
    Document   : changeEmail
    Created on : 21-ene-2016, 12:36:01
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
            <form method="POST" action="/vendelo/change_e" role="form">
                <div class="row center-block" >
                    <div class="col-md-4 col-md-offset-4">
                        <div class="well">
                            ${requestScope.msg}
                            <label for="o_email">Introduce tu email antiguo: </label>
                            <input type="email" class="form-control" name="o_email" id="o_email" placeholder="Enter old email"/>
                            <br>
                            <label for="n_email">Introduce tu email nuevo: </label>
                            <input type="email" class="form-control" name="n_email" id="n_email" placeholder="Enter new email"/>
                            <br>
                            <input type="submit" name="Conectar" value="Cambiar email" class="btn btn-primary center-block"/> 
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <%@include file="../include/footer.jsp" %>
    </body>