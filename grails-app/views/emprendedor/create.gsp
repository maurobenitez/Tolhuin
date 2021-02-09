<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
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
                <g:form action="saveRegister">
                    <div class="form-group">
                        <label for="nick">Usuario</label>
                        <g:textField name="nick" class="form-control" id="nick" placeholder="nick" value="${usuario.nick}"/>
                    </div>
                    <div class="form-group">
                        <label for="nombre">Nombre</label>
                        <g:textField name="nombre" class="form-control" id="nombre" placeholder="nombre"value="${usuario.nombre}"/>
                    </div>
                    <div class="form-group">
                        <label for="apellido">Apellido</label>
                        <g:textField name="apellido" class="form-control" id="apellido" placeholder="apellido" value="${usuario.apellido}"/>
                    </div>
                    <div class="form-group">
                        <label for="contrasena">Contraseña</label>
                        <g:passwordField name="contrasena" class="form-control" id="contrasena" placeholder="contrasena" value="${usuario.contrasena}"/>
                    </div>
                    <div class="form-group">
                        <label for="contrasena2">Repita contraseña</label>
                        <g:passwordField name="contrasena2" class="form-control" id="contrasena2" placeholder="contrasena"/>
                    </div>
                   
                    <div class="form-group">
                        <label for="email">Email</label>
                        <g:textField name="email" class="form-control" id="email" placeholder="email" value="${usuario.email}"/>
                    </div>

                    <g:hiddenField name="tipo" id="tipo" placeholder="tipo" value="${usuario.tipo}"/>
                     <g:each in="${usuario.contactos}">
                        <div class="form-group">
                            <label for="${it.tipoContacto.nombre}">${it.tipoContacto.nombre}</label>
                            <g:textField name="otro.contactos.${it.tipoContacto.nombre}" id="${it.id}" class="form-control"  placeholder="${it.tipoContacto.nombre}" value="${it.valor}"/>
                        </div>
                    </g:each>
                    <g:actionSubmit class="btn btn-primary" value="Registrarse" action="save"/>
                </g:form>
            </div>
            <div class="col-sm-4"></div>
        </div>
    </div>
</body>
</html>

