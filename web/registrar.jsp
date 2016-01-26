<%-- 
    Document   : registrar
    Created on : 19-ene-2016, 16:52:14
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
            <form method="POST" action="validate_registrar" role="form">
                <div class="row center-block" >
                    <div class="col-md-4 col-md-offset-4">
                        <div class="well">
                            ${requestScope.msg}
                            <div id=""></div>
                            <label for="email">*Email: </label>
                            <input type="email" class="form-control" id="email" name="email" placeholder="Ex: example@dominio.com" required="true">
                            <br>
                            <label for="pwd">*Password: </label>
                            <input type="password" class="form-control" id="pwd" name="pwd" placeholder="Enter password" required="true"/>
                            <br>
                            <label for="pwd_r">*Repite la contraseña: </label>
                            <input type="password" class="form-control" id="pwd_r" name="pwd_e" placeholder="Enter password again" required="true"/>
                            <br>
                            <label for="name">Nombre: </label>
                            <input type="text" class="form-control" id="name" name="name" placeholder="Ex: Antonio Ruz"/>
                            <br>
                            <label for="dir">Direccion: </label>
                            <input type="text" class="form-control" id="dir" name="dir" placeholder="Ex: Av Andalucia 7 8 B"/>
                            <br>
                            <label for="cp">Codigo Postal: </label>
                            <input type="text" class="form-control" id="cp" name="cp" placeholder="Ex: 21009"/>
                            <br>
                            <label for="twitter">Twitter: </label>
                            <input type="url" class="form-control" id="twitter" name="twitter" placeholder="Ex: https://twitter.com/Example" />
                            <br>
                            <label for="fb">Facebook: </label>
                            <input type="url" class="form-control" id="fb" name="fb" placeholder="Ex: https://www.facebook.com/example" />
                            <br>
                            <input type="checkbox" name="venta" value="aceptar" required="true"> Aceptas venderle tu alma al diablo.<br>
                            <br>
                            <input type="submit" name="Registrar" value="Registrar" class="btn btn-primary center-block"/> 
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <%@include file="WEB-INF/include/footer.jsp" %>
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

                var id = document.getElementById("id");

                var datos = "id=" + encodeURIComponent(id.value);
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
