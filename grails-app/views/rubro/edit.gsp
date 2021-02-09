<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="backoffice" />
    <title>Editar rubro</title>
</head>
<body>

    <div class="container-fluid">
        <g:if test="${flash.errorRubro == true}">
            <div class="alert alert-danger alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                Error de carga, intente nuevamente
            </div>
        </g:if>
        <div class="row">
            <div class="col-sm-4"></div>
            <div class="col-sm-4">
            <h1>Editar rubro</h1>
            <g:form name="cargarRubro" id="${rubro.id}">
                <div class="form-group">
                <label for="nombre">Nombre</label>
                    <g:textField name="nombre" value="${rubro.nombre}" class="form-control" id="nombre" placeholder="nombre"/>
                </div>
                <div class="form-group">
                    <label for="sector">Sector</label>
                    <g:select name="sector" value="${rubro.sector.id}" from="${sectores}" optionKey="id" class="form-control custom-select" id="sector" placeholder="sector"/>     
                </div>
                <g:actionSubmit value="actualizar" action="update" class="btn btn-primary"/>
            </g:form>

    </div>
    <div class="col-sm-4"></div>
</div>
</div>


</body>
</html>