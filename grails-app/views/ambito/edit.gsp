<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="backoffice" />
    <title>Editar ámbito</title>
</head>
<body>

    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-4"></div>
            <div class="col-sm-4">
                <g:if test="${flash.errorAmbito == true}">
                <div class="alert alert-danger alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    Error de carga, intente nuevamente
                </div>
            </g:if>

            <h1>Editar ámbito</h1>
            <g:form name="cargarAmbito" id="${ambito.id}">
            <div class="form-group">
                <label for="nombre">Nombre</label>
                <g:textField name="nombre" value="${ambito.nombre}" class="form-control" id="nombre" placeholder="nombre"/>
            </div>
            <g:actionSubmit value="actualizar" action="update" class="btn btn-primary"/>
        </g:form>

    </div>
    <div class="col-sm-4"></div>
</div>
</div>


</body>
</html>