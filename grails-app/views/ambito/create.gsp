<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="backoffice" />
    <title>Añadir ámbito</title>
</head>
<body>
    <div class="container-fluid">
        <g:if test="${flash.errorAmbito == true}">
                    <div class="alert alert-danger alert-dismissible" role="alert">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        Error de carga, intente nuevamente
                    </div>
                </g:if>
        <div class="row">
            <div class="col-sm-4"></div>
            <div class="col-sm-4">
                
                <h1>Añadir ámbito</h1>
                <g:form action="save">
                    <div class="form-group">
                        <label for="nombre">Nombre</label>
                        <g:textField name="nombre" class="form-control" id="nombre" placeholder="nombre"/>
                    </div>
                    
                    <g:actionSubmit class="btn btn-primary" value="Añadir" action="save"/>
                </g:form>
            </div>
            <div class="col-sm-4"></div>
        </div>
    </div>
</body>
</html>

