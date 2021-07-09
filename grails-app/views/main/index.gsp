<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <title>emprendimiento</title>
    </head>
    <body>
        <div class="card-columns">
            <g:each in="${emprendimientos}" var="emprendimiento">
                <div class="card">
                <img src="<g:createLink controller="emprendimiento" action="imagen" id="${emprendimiento.id}"/>" class="card-img-top" alt="${emprendimiento.nombre}">
                    <div class="card-body">
                        <h5 class="card-title">${emprendimiento.nombre}</h5>
                        <p class="card-text">${emprendimiento.direccion}</p>
                        <g:link action="show" id="${emprendimiento.id}"class="btn btn-primary btn-sm">ver</g:link>
                    </div>
                </div>
            </g:each>
        </div>
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

