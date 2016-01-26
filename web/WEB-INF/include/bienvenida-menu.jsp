<%-- 
    Document   : bienvenida-menu
    Created on : 20-ene-2016, 15:08:44
    Author     : jesus
--%>
<style>
    ul.nav li.dropdown:hover > ul.dropdown-menu {
        display: block;    
    }
</style>
<script> $('.dropdown-toggle').dropdownHover(options);</script>
<ul class="dropdown-menu">
    <li><a href="/vendelo/verFav">Mis Favoritos</a></li>
    <li class="divider"></li>
    <li><a href="/vendelo/changePerfil">Mi Perfil</a></li>
    <li><a href="/vendelo/changeEmail">Cambiar Email</a></li>
    <li><a href="/vendelo/changePwd">Cambiar Password</a></li>
    <li class="divider"></li>
    <li><a href="/vendelo/logout">Logout</a></li>
</ul>