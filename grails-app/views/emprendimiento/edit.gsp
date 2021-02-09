<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <title>Editar emprendimiento</title>
</head>
<body>
    <div class="container-fluid">
        <g:if test="${flash.errorEmprendimiento == true}">
            <div class="alert alert-danger alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    Error de carga, intente nuevamente
            </div>
        </g:if>
        <div class="row">
            <div class="col-sm-4"></div>
            <div class="col-sm-4">
                <h1>Editar emprendimiento</h1>
                <g:form name="cargarEmprendimiento" id="${emprendimiento.id}">
                    <div class="form-group">
                        <label for="nombre">Nombre</label>
                        <g:textField name="nombre" value="${emprendimiento.nombre}" class="form-control" id="nombre" placeholder="nombre"/>
                    </div>
                    <div class="form-group">
                        <label for="direccion">Dirección</label>
                        <g:textField name="direccion" value="${emprendimiento.direccion}" class="form-control" id="direccion" placeholder="direccion"/>
                    </div>
                    <div class="form-group">
                        <label for="foto">Imagen</label>
                        <g:textField name="foto" value="${emprendimiento.foto}" class="form-control" id="foto" placeholder="foto"/>
                    </div>
                    <div class="form-group">
                        <label for="rubro">Rubro</label>         
                        <g:select name="rubro" value="${emprendimiento.rubro.id}" from="${rubros}" optionKey="id" class="form-control custom-select" id="rubro" placeholder="rubro"/>
                    </div>
                    <div class="form-group">
                        <label for="ambito">Ambito</label>
                        <g:select name="ambito" value="${emprendimiento.ambito.id}" optionKey="id" from="${ambitos}" class="form-control custom-select" id="ambito" placeholder="ambito"/>
                    </div>
                    
                    <div class="form-group">
                        <g:checkBox name="habilitado" value="${emprendimiento.habilitado}" id="habilitado" />
                        <label for="habilitado">Habilitado</label>
                    </div>
                    <g:actionSubmit value="actualizar" action="update" class="btn btn-primary"/>
                </g:form>
            </div>
            <div class="col-sm-4"></div>
        </div>
    </div>
</body>
</html>