<%-- 
    Document   : showFav
    Created on : 25-ene-2016, 19:28:20
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
            ${requestScope.msg}
            <!-- Team Members Row -->
            <div class="row">
                <div class="col-lg-12">
                    <h2 class="page-header text-center">Favoritos</h2>
                </div>
                <c:forEach var="articulo" items="${sessionScope.fav}">
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

            <!-- Footer -->
            <%@include file="../include/footer.jsp" %>
        </div>
    </body>
</html>
