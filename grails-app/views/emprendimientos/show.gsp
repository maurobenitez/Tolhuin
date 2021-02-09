<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="backoffice" />
        <title>emprendimiento</title>
    </head>
    <body>
        <div class="container-fluid">
        <div class="row">
            <div class="col-sm-4"></div>
            <div class="col-sm-4">
                <h1>${emprendimiento.nombre}</h1>
                <p><img src="<g:createLink controller="emprendimiento" action="imagen" id="${emprendimiento.id}"/>" width="100%" height: auto/></p>
                <p><b>Dirección: </b>${emprendimiento.direccion}</p>
                
                <p><b>Rubro: </b>${emprendimiento.rubro}</p>
                <p><b>Ámbito: </b>${emprendimiento.ambito}</p>
                
                <g:if test="${emprendimiento.habilitado}">
                <p><b>Emprendimiento habilitado</b></p>
                </g:if>
                <g:else>
                <p><b>Emprendimiento no habilitado</b></p>
                </g:else>
                <g:if test="${emprendimiento.esValido}">
                <p><b>Emprendimiento validado</b></p>
                </g:if>
                <g:else>
                <p><b>Emprendimiento no validado</b></p>
                </g:else>
            </div>
            <div class="col-sm-4"></div>
        </div>
        <!-- validado habilitado imagen rubro ambito -->
        </div>
    </body>
</html>

