<%-- 
    Document   : ver_comen
    Created on : 26-ene-2016, 1:05:20
    Author     : jesus
--%>
<%@taglib prefix="c"  uri="http://java.sun.com/jstl/core_rt"%>
<ul class="nav nav-tabs" >
    <c:choose>
        <c:when test="${requestScope.lista.get(0).tipo == 1}">
            <li class="active"><a onclick="verComents(1);">Publico</a></li>
            </c:when>
            <c:otherwise>
            <li><a onclick="verComents(1);">Publico</a></li>
            </c:otherwise>
        </c:choose>
        <c:if test="${!empty sessionScope.name}">
            <c:choose>
                <c:when test="${requestScope.lista.get(0).tipo == 2}">
                <li class="active"><a onclick="verComents(2);">Privado</a></li>
                </c:when>
                <c:otherwise>
                <li><a onclick="verComents(2);">Privado</a></li>
                </c:otherwise>
            </c:choose>
            <c:choose>
                <c:when test="${requestScope.lista.get(0).tipo == 3}">
                <li class="active"><a onclick="verComents(3);">Nota</a></li>
                </c:when>
                <c:otherwise>
                <li><a onclick="verComents(3);">Nota</a></li>
                </c:otherwise>
            </c:choose>
        </c:if>
</ul>
<c:forEach var="comentario" items="${requestScope.lista}">
    <c:choose>
        <c:when test="${comentario.tipo == 2 }">
            <c:if test="${(comentario.autor.id == sessionScope.id || comentario.articulo.vendedor.id == sessionScope.id)}">
            <div class="col-xs-offset-8 panel panel-primary">
                <div class="panel-heading">
                    @${comentario.autor.nombre}: 
                </div>
                <div class="panel-group">
                    ${comentario.comentar}
                </div>
            </div>
            <br>
            </c:if>
        </c:when>
        <c:when test="${comentario.tipo == 3}">
            <c:if test="${comentario.autor.id == sessionScope.id}">
            <div class="col-xs-offset-8 panel panel-primary">
                <div class="panel-heading">
                    @${comentario.autor.nombre}: 
                </div>
                <div class="panel-group">
                    ${comentario.comentar}
                </div>
            </div>
            <br>
            </c:if>
        </c:when>
        <c:otherwise>
            <div class="col-xs-offset-8 panel panel-primary">
                <div class="panel-heading">
                    @${comentario.autor.nombre}: 
                </div>
                <div class="panel-group">
                    ${comentario.comentar}
                </div>
            </div>
            <br>
        </c:otherwise>
    </c:choose>
</c:forEach>
