<%-- 
    Document   : menu
    Created on : 19-ene-2016, 15:41:25
    Author     : jesus
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %> 
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>      
            </button>
        </div>
        <nav class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li><a href="/vendelo"><span class="glyphicon glyphicon-home"></span> Home</a></li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="/vendelo/filter">Categorias<span class="caret"></span></a>
                        <%@include file="menu_categoria.jsp" %>
                </li>
                <c:choose>
                    <c:when test="${!empty sessionScope.name}">
                        <li><a href="/vendelo/addProducto"><span class="glyphicon glyphicon-plus"></span> Nuevo producto</a></li>
                        </c:when>
                    </c:choose>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <c:choose>
                        <c:when test="${!empty sessionScope.name}">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown">
                                Bienvenido,  <c:out value="${sessionScope.name}"/>   <b class="caret"></b>
                            </a>
                            <%@include file="bienvenida-menu.jsp" %>
                        </li>
                    </c:when>
                    <c:otherwise> 
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown">
                                Login <b class="caret"></b>
                            </a>
                            <%@include file="login-menu.jsp" %>
                        </li>
                    </c:otherwise> 
                </c:choose>
                </li>
            </ul>
        </nav>
    </div>
</nav>
<script src="http://code.jquery.com/jquery.js"></script>