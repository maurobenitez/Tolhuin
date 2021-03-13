<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="backoffice" />
    <title>Editar capa</title>
</head>
<body>
    <div class="container-fluid">
        <g:if test="${flash.errorCapa == true}">
            <div class="alert alert-danger alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    Error de carga, intente nuevamente
            </div>
        </g:if>
        <div class="row">
            <div class="col-sm-4"></div>
            <div class="col-sm-4">
                <h1>Editar capa</h1>
                <g:form name="cargarCapa" id="${capa.id}" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="nombre">Nombre</label>
                        <g:textField name="nombre" value="${capa.nombre}" class="form-control" id="nombre" placeholder="nombre"/>
                    </div>
                    <div class="form-group">
                        <label for="descripcion">Descripcion</label>
                        <g:textField name="descripcion" value="${capa.descripcion}" class="form-control" id="descripcion" placeholder="descripcion"/>
                    </div>
                    <div class="form-group">
                            <label for="archivo">Archivo</label>
                            <input type="file" name="archivo" id="archivo"/>
                        </div>
                    <g:actionSubmit value="actualizar" action="update" class="btn btn-primary"/>
                </g:form>
            </div>
            <div class="col-sm-4"></div>
        </div>
    </div>
</body>
</html>