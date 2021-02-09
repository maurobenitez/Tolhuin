<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="backoffice" />
    <title>Añadir rubro</title>
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
                    
                    <h1>Añadir rubro</h1>
                    <g:form action="save">
                        <div class="form-group">
                            <label for="nombre">Nombre</label>
                            <g:textField name="nombre" class="form-control" id="nombre" placeholder="nombre"value="${rubro.nombre}"/>
                        </div>
                        <div class="form-group">
                            <label for="sector">Sector</label>
                            <g:if test="${rubro.sector==null}">
                                <g:select name="sector" from="${sectores}" optionKey="id" optionValue="nombre" noSelection="${['null':'Ámbito...']}" class="form-control custom-select" id="sector" placeholder="sector"/>
                            </g:if>
                            <g:else>
                                <g:select name="sector" from="${sectores}" optionKey="id" optionValue="nombre" class="form-control custom-select" noSelection="${['null':'Ámbito...']}" id="sector" placeholder="sector"value="${rubro.sector.id}"/>
                            </g:else>
                        </div>
                        <g:actionSubmit class="btn btn-primary" value="Añadir" action="save"/>
                    </g:form>
                </div>
                <div class="col-sm-4"></div>
            </div>
        </div>
    </body>
</html>

