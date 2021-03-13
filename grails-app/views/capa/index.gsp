<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="backoffice" />
        <title>capa</title>
    </head>
    <body>
        <div class="table-responsive">
            <h1>capas</h1>
            <table class="table table-striped table-sm">
                <tr>
                    <th>Nombre</th>
                    <th>Descripción</th>
                    <th></th>
                    <th></th>
                    <th></th>
                </tr>
                <g:each in="${capas}" var="capa">
                    <tr>
                        <td>${capa.nombre}</td>
                        <td>${capa.descripcion}</td>
                        <td><g:link action="edit" id="${capa.id}" class="btn btn-primary btn-sm">editar</g:link></td>
                        <td><g:link action="delete" id="${capa.id}" class="btn btn-primary btn-sm">borrar</g:link></td>
                        <td><g:link action="show" id="${capa.id}" class="btn btn-primary btn-sm">ver</g:link></td>
                    </tr>
                </g:each>
            </table>
            <g:link action="create" class="btn btn-primary">Añadir capa</g:link>
        </div>
    </body>
</html>

