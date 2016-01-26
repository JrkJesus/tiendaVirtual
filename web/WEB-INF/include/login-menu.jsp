<%-- 
    Document   : login-menu
    Created on : 20-ene-2016, 14:56:33
    Author     : jesus
--%>


<ul class="dropdown-menu">
    <form method="POST" action="/vendelo/loguear" class="navbar-form navbar-left" role="form">
        <div class="form-group">
            <input type="text" class="form-control" id="email" name="email" placeholder="email">
        </div>
        <div class="form-group">
            <input type="password" class="form-control" id="pwd" name="pwd" placeholder="password">
        </div>
        <button type="submit" class="btn btn-default">Log in</button>
        <br>
        <a href="/vendelo/registrar">¿No tienes cuenta? Registrate</a>
    </form>  
</ul>