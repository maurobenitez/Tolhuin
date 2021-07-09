<!doctype html>
<html lang="es" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <asset:stylesheet src="application.css"/>

    <g:layoutHead/>
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="/">
            <asset:image src="845.png" width="30" height="30" class="d-inline-block align-top" loading="lazy"/>
            Tolhuin
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/grafico/emprendimientosPorSector">Gráficos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/mapa/index">Mapa</a>
                </li>
                <g:if test="${session.tipo == 'emprendedor' && session.logeado}">
                    <li class="nav-item">
                        <a class="nav-link" href="/emprendedor/show/${session.usuario}">Emprendedor</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/emprendimiento/show/${session.usuario}">Emprendimiento</a>
                    </li>
                </g:if>
            </ul>
            <span>
                <ul class="navbar-nav mr-auto">
                    <g:if test="${!session.logeado}">
                        <li class="nav-item">
                            <a class="nav-link" href="/login/login">Iniciar sesión</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/emprendedor/create">Registrarse</a>
                        </li>
                    </g:if>
                    <g:else>
                        <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            ${session.nombre}
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <g:if test="${session.tipo != 'emprendedor'}">
                                <a class="dropdown-item" href="/emprendimientos/index">Backoffice</a>
                            </g:if>
                            <a class="dropdown-item" href="/login/logout">Salir</a>
                            
                            
                        </div>

                    </li>    
                    </g:else>
                </ul>
            </span>
        </div>
    </nav>


    <g:layoutBody/>

    <div class="footer" role="contentinfo"></div>

    <div id="spinner" class="spinner" style="display:none;">
        <g:message code="spinner.alt" default="Loading&hellip;"/>
    </div>

    <asset:javascript src="application.js"/>

</body>
</html>
