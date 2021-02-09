<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="backoffice" />
    <title>Borrar ámbito</title>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-sm-4"></div>
            <div class="col">
                <h1>¿Desea borrar el ámbito ${ambito.nombre}?</h1>
                <div class="row">
                    <div class="col-6">
                        <g:link action="borrar" id="${ambito.id}" class="btn btn-primary btn-block">Si</g:link>
                    </div>
                    <div class="col-6">
                        <g:link action="index" class="btn btn-primary btn-block">No</g:link>
                    </div>
                </div>
            </div>
        <div class="col-sm-4"></div>
    </div>
</div>
</body>
</html>