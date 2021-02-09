<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="backoffice" />
        <title>Ambito</title>
    </head>
    <body>
        <div class="table-responsive">
            <g:if test="${flash.errorBorrado == true}">
                <div class="alert alert-danger alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    No se puede borrar el ámbito ${flash.errorMensaje} porque está asociado a uno o más emprendimientos
                </div>
            </g:if>
        <h1>Ambito</h1>
        <table class="table table-striped table-sm">
            <tr>
                <th>Ambito</th>
                <th></th>
                <th></th>
            </tr>
            <g:each in="${ambitos}" var="ambito">
                <tr>
                    <td>${ambito.nombre}</td>
                    <td><g:link action="edit" id="${ambito.id}"class="btn btn-primary btn-sm">editar</g:link></td>
                    <td><g:link action="delete" id="${ambito.id}"class="btn btn-primary btn-sm">borrar</g:link></td>
                </tr>
            </g:each>
        </table>
        <g:link action="create" class="btn btn-primary">Añadir ambito</g:link>
    </div>
    </body>
</html>

