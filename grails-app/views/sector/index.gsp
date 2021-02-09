<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="backoffice" />
        <title>sector</title>
    </head>
    <body>
        <div class="table-responsive">
            <g:if test="${flash.errorBorrado == true}">
                <div class="alert alert-danger alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    No se puede borrar el sector ${flash.errorMensaje} porque está asociado a uno o más emprendimientos
                </div>
            </g:if>
        <h1>sector</h1>
        <table class="table table-striped table-sm">
            <tr>
                <th>sector</th>
                <th></th>
                <th></th>
            </tr>
            <g:each in="${sectores}" var="sector">
                <tr>
                    <td>${sector.nombre}</td>
                    <td><g:link action="edit" id="${sector.id}"class="btn btn-primary btn-sm">editar</g:link></td>
                    <td><g:link action="delete" id="${sector.id}"class="btn btn-primary btn-sm">borrar</g:link></td>
                </tr>
            </g:each>
        </table>
        <g:link action="create"class="btn btn-primary">Añadir sector</g:link>
    </div>
    </body>
</html>

