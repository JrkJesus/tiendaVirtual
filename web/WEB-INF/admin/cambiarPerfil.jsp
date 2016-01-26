<%-- 
    Document   : cambiarPerfil
    Created on : 26-ene-2016, 17:08:18
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
            .connectionTime{
                border: 10px solid black;
                border-width: 2px;
                color: white;
                background-color: red;
            }
        </style>
    </head>
    <body>
        <%@include file="../include/cabecera.jsp" %>
        <%@include file="../include/menu.jsp" %>
        <div id = "contenedor" class="center-block">
            <form method="POST" action="change" role="form">
                <div class="connectionTime">${sessionScope.fecha}</div>
                <div id="respuesta">${requestScope.msg}</div>
                <div class="row center-block" >
                    <div class="col-md-4 col-md-offset-4">
                        <div class="well">
                            <label for="email">Email: </label>
                            <input type="email" class="form-control" id="email" name="email" value="${requestScope.usuario.email}" >
                            <br>
                            <label for="name">Nombre: </label>
                            <input type="text" class="form-control" id="name" name="name" value="${requestScope.usuario.nombre}"/>
                            <br>
                            <label for="dir">Direccion: </label>
                            <input type="text" class="form-control" id="dir" name="dir" value="${requestScope.usuario.dir}"/>
                            <br>
                            <label for="cp">Codigo Postal: </label>
                            <input type="text" class="form-control" id="cp" name="cp" value="${requestScope.usuario.CP}"/>
                            <br>
                            <label for="twitter">Twitter: </label>
                            <input type="url" class="form-control" id="twitter" name="twitter" value="${requestScope.usuario.twitter}" />
                            <br>
                            <label for="fb">Facebook: </label>
                            <input type="url" class="form-control" id="fb" name="fb" value="${requestScope.usuario.fb}" />
                            <br>
                            <label for="apodo">Apodo: </label>
                            <input type="text" class="form-control" onchange="validarIdDB();" id="apodo" name="apodo" placeholder="Introduce tu apodo"/>
                            <div id="idValido"></div>
                            <br>
                            <input type="submit" name="Registrar" value="Cambiar datos" class="btn btn-primary center-block"/> 
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <%@include file="../include/footer.jsp" %>
        <script>
            var xhr;

            function init_ajax() {
                if (window.XMLHttpRequest) {
                    xhr = new XMLHttpRequest();
                } else if (window.ActiveXObject) {
                    xhr = new ActiveXObject("Microsoft.XMLHTTP");
                }

            }

            function validarIdDB() {

                init_ajax();

                var url = "idValido";
                xhr.open("POST", url, true);
                xhr.onreadystatechange = idValido;

                var id = document.getElementById("apodo");

                var datos = "apodo=" + encodeURIComponent(id.value);
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                xhr.send(datos);

            }

            function idValido() {
                if (xhr.readyState === 4) {
                    if (xhr.status === 200) {
                        document.getElementById("idvalido").innerHTML = xhr.responseText;
                    }
            }
        </script>
    </body>
</html>
