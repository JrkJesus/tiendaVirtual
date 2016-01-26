<%-- 
    Document   : ver_prod_fil
    Created on : 25-ene-2016, 22:35:11
    Author     : jesus
--%>

<%@taglib prefix="c"  uri="http://java.sun.com/jstl/core_rt"%>

<!-- Team Members Row -->
<div class="row">
    ${requestScope.msg}
    <div class="col-lg-12">
        <h2 class="page-header text-center">Categoria</h2>
    </div>
    <c:forEach var="articulo" items="${requestScope.lista}">
        <div class="col-lg-4 col-sm-6 text-center">
            <a href="/vendelo/filter?id=${articulo.id}">
                <img class="img-circle img-responsive img-center" src="http://placehold.it/200x200" alt="">
                <h3><big> ${articulo.precio} ? </big>
                </h3>
                <p><big> ${articulo.nombre}</big></p>
            </a>
        </div>
    </c:forEach>
</div>