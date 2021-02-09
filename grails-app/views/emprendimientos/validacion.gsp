<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="backoffice" />
        <title>Validar emprendimientos</title>
    </head>
    <body>
        <div class="container-fluid">
        <g:if test="${flash.validado == true}">
                <div class="alert alert-success alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    Emprendimiento validado correctamente
                </div>
            </g:if>
        <h1>emprendimientos</h1>
        <table class="table table-striped">
            <tr>
                <th>Emprendimiento</th>
                <th>Dirección</th>
                <th>Rubro</th>
                <th>Ámbito</th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
            </tr>
            <g:each in="${emprendimientos}" var="emprendimiento">
                <tr>
                    <td>${emprendimiento.nombre}</td>
                    <td>${emprendimiento.direccion}</td>
                    <td>${emprendimiento.rubro}</td>
                    <td>${emprendimiento.ambito}</td>
                    <td><g:link action="edit" id="${emprendimiento.id}" class="btn btn-primary btn-xs">editar</g:link></td>
                    <td><g:link action="delete" id="${emprendimiento.id}" class="btn btn-primary btn-xs">borrar</g:link></td>
                    <td><g:link action="show" id="${emprendimiento.id}" class="btn btn-primary btn-xs">ver</g:link></td>
                    <td><g:link action="validar" id="${emprendimiento.id}" class="btn btn-primary btn-xs">validar</g:link></td>
                </tr>
            </g:each>
        </table>
        <g:link action="create" class="btn btn-primary">Añadir emprendimiento</g:link>
    </div>
    </body>
</html>

