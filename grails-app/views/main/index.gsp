<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <title>emprendimiento</title>
    </head>
    <body>
        <div class="table-responsive">
        <h1>emprendimientos</h1>
        <table class="table table-striped table-sm">
            <tr>
                <th>Emprendimiento</th>
                <th>Dirección</th>
                <th>Rubro</th>
                <th>Ámbito</th>
                <th></th>
            </tr>
            <g:each in="${emprendimientos}" var="emprendimiento">
                <tr>
                    <td>${emprendimiento.nombre}</td>
                    <td>${emprendimiento.direccion}</td>
                    <td>${emprendimiento.rubro}</td>
                    <td>${emprendimiento.ambito}</td>
                    <td><g:link action="show" id="${emprendimiento.id}"class="btn btn-primary btn-sm">ver</g:link></td>
                </tr>
            </g:each>
        </table>
    </div>
    </body>
</html>

