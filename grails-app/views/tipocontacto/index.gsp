<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="backoffice" />
        <title>Tipo contacto</title>
    </head>
    <body>
        <div class="table-responsive">
            <g:if test="${flash.errorBorrado == true}">
                <div class="alert alert-danger alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    No se puede borrar el tipo de contacto ${flash.errorMensaje} porque está asociado a uno o más usuarios
                </div>
            </g:if>
        <h1>Tipo contacto</h1>
        <table class="table table-striped table-sm">
            <tr>
                <th>Tipo contacto</th>
                <th></th>
                <th></th>
            </tr>
            <g:each in="${tipoContactos}" var="tipoContacto">
                <tr>
                    <td>${tipoContacto.nombre}</td>
                    <td><g:link action="edit" id="${tipoContacto.id}"class="btn btn-primary btn-sm">editar</g:link></td>
                    <td><g:link action="delete" id="${tipoContacto.id}"class="btn btn-primary btn-sm">borrar</g:link></td>
                </tr>
            </g:each>
        </table>
        <g:link action="create"class="btn btn-primary">Añadir tipo de contacto</g:link>
    </div>
    </body>
</html>

