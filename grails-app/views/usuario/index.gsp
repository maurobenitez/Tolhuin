<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="backoffice" />
        <title>Usuario</title>
    </head>
    <body>
        <div class="table-responsive">
        <h1>Usuario</h1>
        <table class="table table-striped table-sm">
            <tr>
                <th>Usuario</th>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Tipo de usuario</th>
                <th></th>
                <th></th>
                <th></th>
            </tr>
            <g:each in="${usuarios}" var="usuario">
                <tr>
                    <td>${usuario.nick}</td>
                    <td>${usuario.nombre}</td>
                    <td>${usuario.apellido}</td>
                    <td>${usuario.tipo}</td>
                    <td><g:link action="edit" id="${usuario.id}" class="btn btn-primary btn-sm">editar</g:link></td>
                    <td><g:link action="delete" id="${usuario.id}" class="btn btn-primary btn-sm">borrar</g:link></td>
                    <td><g:link action="show" id="${usuario.id}" class="btn btn-primary btn-sm">ver</g:link></td>
                </tr>
            </g:each>
        </table>
        <g:link action="create" class="btn btn-primary">Añadir usuario</g:link>
    </div>
    </body>
</html>

