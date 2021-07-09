<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="backoffice" />
    <title>Añadir usuario</title>
</head>
<body>
    <div class="container-fluid">
        <g:if test="${flash.errorUsuario == true}">
                    <div class="alert alert-danger alert-dismissible" role="alert">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        Error de carga, intente nuevamente
                    </div>
                </g:if>
        <div class="row">
            <div class="col-sm-4"></div>
            <div class="col-sm-4">
                
                <h1>Añadir usuario</h1>
                <g:form action="save">
                    <div class="form-group">
                        <label for="nick">Usuario</label>
                        <g:textField name="nick" class="form-control" id="nick" placeholder="nick" value="${usuario.nick}"/>
                    </div>
                    <div class="form-row">
                        <div class="col">
                            <label for="nombre">Nombre</label>
                            <g:textField name="nombre-usuario" class="form-control" id="nombre" placeholder="nombre"value="${usuario.nombre}"/>
                        </div>
                        <div class="col">
                            <label for="apellido">Apellido</label>
                            <g:textField name="apellido-usuario" class="form-control" id="apellido" placeholder="apellido" value="${usuario.apellido}"/>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col">
                            <label for="contrasena">Contraseña</label>
                            <g:passwordField name="contrasena-usuario" class="form-control" id="contrasena" placeholder="contraseña" value="${usuario.contrasena}"/>
                        </div>
                        <div class="col">
                            <label for="contrasena2">Repita contraseña</label>
                            <g:passwordField name="contrasena2" class="form-control" id="contrasena2" placeholder="contraseña"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="tipo">Tipo</label>
                        <g:if test="${usuario.tipo==null}">
                            <g:select name="tipo" from="${tipos}" noSelection="${['null':'Tipo de usuario...']}" class="form-control custom-select" id="tipo" placeholder="tipo"/>
                        </g:if>
                        <g:else>
                            <g:select name="tipo" from="${tipos}" noSelection="${['null':'Tipo de usuario...']}" class="form-control custom-select" id="tipo" placeholder="tipo"value="${usuario.tipo}"/>
                        </g:else>
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <g:textField name="email" class="form-control" id="email" placeholder="email" value="${usuario.email}"/>
                    </div>
                     <g:each in="${usuario.contactos}">
                        <div class="form-group">
                            <label for="${it.tipoContacto.nombre}">${it.tipoContacto.nombre}</label>
                            <g:textField name="otro.contactos.${it.tipoContacto.nombre}" id="${it.id}" class="form-control"  placeholder="${it.tipoContacto.nombre}" value="${it.valor}"/>
                        </div>
                    </g:each>
                    <g:actionSubmit class="btn btn-primary" value="Añadir" action="save"/>
                </g:form>
            </div>
            <div class="col-sm-4"></div>
        </div>
    </div>
</body>
</html>

