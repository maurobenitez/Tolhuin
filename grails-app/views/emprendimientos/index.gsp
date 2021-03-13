<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="backoffice" />
        <title>emprendimiento</title>
    </head>
    <body>
        <div class="table-responsive">
            <h1>emprendimientos</h1>
            <g:link action="create" class="btn btn-primary">Añadir emprendimiento</g:link>
            <table class="table table-striped table-sm">
                <tr>
                    <th>Emprendimiento</th>
                    <th>Dirección</th>
                    <th>Rubro</th>
                    <th>Ámbito</th>
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
                        <td><g:link action="edit" id="${emprendimiento.id}" class="btn btn-primary btn-sm">editar</g:link></td>
                        <td><g:link action="delete" id="${emprendimiento.id}" class="btn btn-primary btn-sm">borrar</g:link></td>
                        <td><g:link action="show" id="${emprendimiento.id}" class="btn btn-primary btn-sm">ver</g:link></td>
                    </tr>
                </g:each>
            </table>
            
        </div>
    </body>
</html>

