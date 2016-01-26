<%-- 
    Document   : addProducto
    Created on : 21-ene-2016, 18:03:36
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
            .glyphicon-euro{
                position: relative;
                top: 10px;
                left: -10px;
            }
        </style>
    </head>
    <body>
        <%@include file="../include/cabecera.jsp" %>
        <%@include file="../include/menu.jsp" %>
        <div id = "contenedor" class="center-block">
            <form method="POST" class="form-horizontal" id="formuploadajax" action="/vendelo/nuevo_productos" role="form" enctype="multipart/form-data">
                <fieldset>

                    <!-- Form Name -->
                    <legend>Añadir un nuevo producto</legend>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="Nombre articulo">Nombre</label>  
                        <div class="col-md-2">
                            <input name="Nombre" class="form-control input-md" id="Nombre" required="" type="text" placeholder="Ex: Raton Mars Gaming">

                        </div>
                    </div>

                    <!-- Multiple Radios -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="est">Estado</label>
                        <div class="col-md-4">
                            <div class="radio">
                                <label for="est-0">
                                    <input name="est" id="est-0" type="radio" checked="checked" value="1">
                                    Nuevo
                                </label>
                            </div>
                            <div class="radio">
                                <label for="est-1">
                                    <input name="est" id="est-1" type="radio" value="2">
                                    Seminuevo
                                </label>
                            </div>
                            <div class="radio">
                                <label for="est-2">
                                    <input name="est" id="est-2" type="radio" value="3">
                                    Desgastado
                                </label>
                            </div>
                            <div class="radio">
                                <label for="est-3">
                                    <input name="est" id="est-3" type="radio" value="4">
                                    Antiguo
                                </label>
                            </div>
                        </div>
                    </div>

                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="categoria">Categoria</label>
                        <div class="col-md-2">
                            <select name="categoria" class="form-control" id="categoria">
                                <option value="1">Informatica</option>
                                <option value="2">Moda</option>
                                <option value="3">Telefonia</option>
                                <option value="4">Electrónica</option>
                                <option value="5">Joyeria</option>
                                <option value="6">Casa y jardin</option>
                                <option value="7">Deportes y ocio</option>
                                <option value="8">Motor</option>
                                <option value="9">Herramientas</option>
                            </select>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="year">Año adquisicion</label>  
                        <div class="col-md-1">
                            <input name="year" class="form-control input-md" id="year" type="number" value="1993">

                        </div>
                    </div>

                    <!-- Textarea -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="descrip">Descripcion</label>
                        <div class="col-md-4">                     
                            <textarea name="descrip" class="form-control" id="descrip"></textarea>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="precio">Precio</label>  
                        <div class="col-md-1">
                            <input name="precio" class="form-control input-md" id="precio" required="" type="number" value="0.50">
                        </div>
                        <span class="glyphicon glyphicon-euro"></span> 
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label" for="file">Imagen</label>  
                        <div class="col-md-1">
                            <input type="file" name="file" id="file" >
                        </div>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary  center-block">Añadir</button>
                    </div>
                </fieldset>
            </form>
        </div>
        <%@include file="../include/footer.jsp" %>
    </body>
</html>
