<%-- 
    Document   : login
    Created on : 19-ene-2016, 15:58:36
    Author     : jesus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="Shortcut Icon" type="image/x-icon" href="http://www.homexpertz.co.za/img/hand-icon-grey.png" /> 
        <title> Segunda Mano</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <style>     
            .jumbotron {
                margin-bottom: 0;
            }
        </style>
    </head>
    <body>
        <%@include file="WEB-INF/include/cabecera.jsp" %>
        <%@include file="WEB-INF/include/menu.jsp" %>
        
        <div id = "contenedor" class="center-block">
            <form method="POST" action="/vendelo/loguear" role="form">
                <div class="row center-block" >
                    <div class="col-md-4 col-md-offset-4">
                        <div class="well">
                            ${requestScope.msg}
                            <label for="email">Email: </label>
                            <input type="email" class="form-control" id="email" name="email" placeholder="Enter email">
                            <p></p>
                            <label for="pwd">Password: </label>
                            <input type="password" class="form-control" name="pwd" id="pwd" placeholder="Enter password"/>
                            <p></p>
                            <input type="submit" name="Conectar" value="Conectar" class="btn btn-primary center-block"/> 
                        </div>
                    </div>
                </div>
                <div class="row center-block" >
                    <div class="col-md-4 col-md-offset-4">
                        <div class="well">
                            <a href="registrar.jsp">¿No tienes cuenta? Registrate</a>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <%@include file="WEB-INF/include/footer.jsp" %>
    </body>
</html>
