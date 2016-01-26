<%-- 
    Document   : show
    Created on : 22-ene-2016, 17:39:50
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
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container">
            <%@include file="../include/menu.jsp" %>
            <div id="wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h2 class="page-header text-center"><big>${requestScope.lista.get(0).nombre}</big></h2>
                    </div>

                    <img class="img-responsive img-center" src="http://placehold.it/200x200" alt="">
                    <h3  class="text-center">
                        <a href="/vendelo/addFav?id=${requestScope.lista.get(0).id}"><span class="glyphicons glyphicon glyphicon-heart-empty"></span></a>
                        <big> ${requestScope.lista.get(0).precio} € </big> 
                    </h3>

                    <div class="col-md-4">
                        <table class="table center-block">
                            <legend>Informacion del usuario</legend>
                            <tbody>
                                <tr>
                                    <td>Nombre</td>
                                    <td> ${requestScope.lista.get(0).vendedor.nombre}</td>
                                </tr>
                                <tr>
                                    <td>Direccion</td>
                                    <td> ${requestScope.lista.get(0).vendedor.dir}</td>
                                </tr>
                                <tr>
                                    <td>CP</td>
                                    <td> ${requestScope.lista.get(0).vendedor.CP}</td>
                                </tr>
                                <tr>
                                    <td>Twitter</td>
                                    <td> ${requestScope.lista.get(0).vendedor.twitter}</td>
                                </tr>
                                <tr>
                                    <td>Facebook</td>
                                    <td> ${requestScope.lista.get(0).vendedor.fb}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <p>${requestScope.lista.get(0).descripcion}</p>
                    <br>    
                </div>
                <div id="contenido-coment">
                    <div id="coments">
                        <ul class="nav nav-tabs" >
                            <li class="active"><a onclick="verComents(1);">Publico</a></li>
                                <c:if test="${!empty sessionScope.name}">
                                <li><a onclick="verComents(2);">Privado</a></li>
                                <li><a onclick="verComents(3);">Nota</a></li>
                                </c:if>
                        </ul>
                        <c:forEach var="comentario" items="${requestScope.coments}">
                            <div class="col-xs-offset-8 panel panel-primary">
                                <div class="panel-heading">
                                    @${comentario.autor.nombre}: 
                                </div>
                                <div class="panel-group">
                                    ${comentario.comentar}
                                </div>
                            </div>
                            <br>
                        </c:forEach>
                    </div>
                    <c:if test="${!empty sessionScope.name}">
                        <form class="form-horizontal" method="POST" action="/vendelo/nuevo_comentario">
                            <fieldset>
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="descrip">Nuevo comentario</label>
                                    <div class="col-md-4">                     
                                        <textarea name="comen" class="form-control" id="comen"></textarea>
                                    </div>
                                    <label class="col-md-4 control-label" for="tipoC"></label>
                                    <div class="col-md-2">
                                        <select id="tipoC" name="tipoC" class="form-control">
                                            <option value="1">Publico</option>
                                            <option value="2">Privado</option>
                                            <option value="3">Nota</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary  center-block">Nuevo comentario</button>
                                </div>
                                <div class="col-md-4">                     
                                    <input name="id" id="id" required="" type="number" style="visibility: hidden"    value="${requestScope.lista.get(0).id}">
                                </div>
                            </fieldset>
                        </form>
                    </c:if>
                </div>
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

                function verComents(id) {

                    init_ajax();

                    var url = "/vendelo/verComentario";
                    xhr.open("POST", url, true);
                    xhr.onreadystatechange = comentsFiltrados;
                    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                    xhr.send("id=" + encodeURIComponent(id));

                }

                function comentsFiltrados() {
                    if (xhr.readyState === 4) {
                        if (xhr.status === 200) {
                            document.getElementById("coments").innerHTML = xhr.responseText;
                        }
                    }

                }
            </script>
    </body>
</html>
