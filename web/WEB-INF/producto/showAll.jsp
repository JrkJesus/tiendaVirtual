<%-- 
    Document   : show
    Created on : 22-ene-2016, 11:09:06
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
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/round-about.css" rel="stylesheet">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    </head>
    <body>  
        <!-- Navigation -->
        <%@include file="../include/menu.jsp" %>
        <!-- Page Content -->
        <div class="container">
            <button class="btn btn-primary" onclick="hideshow();">Filtrar</button>
            <form name="form1" class="bg-info" style="display: none">
                <br>
                <div class="form-group">
                    <label for="pMe"></label>
                    <div class="col-md-2">
                        <div class="input-group">
                            <span class="input-group-addon">Precio &lt;</span>
                            <input id="pMe" name="pMe" class="form-control" type="text">
                        </div>
                    </div>
                </div>
                <!-- Prepended text-->
                <div class="form-group">
                    <label for="pMa"></label>
                    <div class="col-md-2">
                        <div class="input-group">
                            <span class="input-group-addon">Precio &gt;</span>
                            <input id="pMa" name="pMa" class="form-control" type="text">
                        </div>
                    </div>
                </div>
                <!-- Prepended text-->
                <div class="form-group">
                    <label for="cp"></label>
                    <div class="col-md-2">
                        <div class="input-group">
                            <span class="input-group-addon">CP</span>
                            <input id="cp" name="cp" class="form-control" type="text">
                        </div>
                    </div>
                </div>
                <label for="cat"></label>
                <div class="col-md-2">
                    <select id="cat" name="cat" class="form-control">
                        <option value="0"> </option>
                        <option value="1">Informatica</option>
                        <option value="2">Moda</option>
                        <option value="3">Telefonica</option>
                        <option value="4">Electronica</option>
                        <option value="5">Joyeria</option>
                        <option value="6">Casa y Jardin</option>
                        <option value="7">Deporte y Ocio</option>
                        <option value="8">Motor</option>
                        <option value="9">Herramientas</option>
                    </select>
                </div>
                <input type="button" class="btn btn-primary" value="Filtrar" onclick="filtrar();"/>
                <br>  <br>
            </form>
            <div id="respuesta">
                ${requestScope.msg}
                <!-- Team Members Row -->
                <div class="row">
                    <div class="col-lg-12">
                        <h2 class="page-header text-center">Categoria</h2>
                    </div>
                    <c:forEach var="articulo" items="${requestScope.lista}">
                        <div class="col-lg-4 col-sm-6 text-center">
                            <a href="/vendelo/filter?id=${articulo.id}">
                                <img class="img-circle img-responsive img-center" src="http://placehold.it/200x200" alt="">
                                <h3><big> ${articulo.precio} € </big>
                                </h3>
                                <p><big> ${articulo.nombre}</big></p>
                            </a>
                        </div>
                    </c:forEach>
                </div>

                <hr>
            </div>

            <!-- Footer -->
            <%@include file="../include/footer.jsp" %>
        </div>

        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <script>
                    var xhr;

                    function init_ajax() {
                        if (window.XMLHttpRequest) {
                            xhr = new XMLHttpRequest();
                        } else if (window.ActiveXObject) {
                            xhr = new ActiveXObject("Microsoft.XMLHTTP");
                        }

                    }

                    function filtrar() {

                        init_ajax();

                        var url = "/vendelo/filter";
                        xhr.open("POST", url, true);
                        xhr.onreadystatechange = articulosFiltrados;

                        var cp = document.getElementById("cp");
                        var pmenor = document.getElementById("pMe");
                        var pmayor = document.getElementById("pMa");
                        var cat = document.getElementById("cat");

                        var datos = "cp=" + encodeURIComponent(cp.value) +
                                "&pmenor=" + encodeURIComponent(pmenor.value) +
                                "&pmayor=" + encodeURIComponent(pmayor.value) +
                                "&cat=" + encodeURIComponent(cat.value);
                        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                        xhr.send("cp=" + encodeURIComponent(cp.value) +
                                "&pmenor=" + encodeURIComponent(pmenor.value) +
                                "&pmayor=" + encodeURIComponent(pmayor.value) +
                                "&cat=" + encodeURIComponent(cat.value));

                    }

                    function articulosFiltrados() {
                        if (xhr.readyState === 4) {
                            if (xhr.status === 200) {
                                document.getElementById("respuesta").innerHTML = xhr.responseText;
                            }
                        }

                    }

                    function hideshow()
                    {

                        var frm = document.form1;

                        if (frm.style.display == "block") {
                            frm.style.display = "none"
                        }

                        else

                        if (frm.style.display == "none") {
                            frm.style.display = "block"
                        }

                    }
        </script>
    </body>
</html>
