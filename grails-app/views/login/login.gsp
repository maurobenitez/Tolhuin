<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />

        <title>login de usuario</title>
    </head>
    <body>
    <div class="container">
        <div class="row">
            <div class="col-sm-4"></div>
            <div class="col">
                <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"></h3>
                </div>
                <div class="panel-body">
                    <g:form name="login" action="logear">
                        <fieldset>
                            <g:if test="${flash.errorUsuario}">
                                <div class="form-group has-error">
                                    <input class="form-control" placeholder="usuario" name="usuario" type="text" autofocus>
                                </div>
                            </g:if>
                            <g:else>
                                <div class="form-group has-success">
                                    <input class="form-control" placeholder="usuario" name="usuario" type="text" autofocus>
                                </div>
                            </g:else>
                            <div class="form-group has-success">
                                <input class="form-control" placeholder="password" name="password" type="password" value="">
                            </div>
                            <button type="submit" class="btn btn-success btn-block">Iniciar sesión</button>
                            <p></p>
                            </fieldset>
                    </g:form>
                </div>
            </div>
            </div>
        <div class="col-sm-4"></div>
    </div>




    </body>
</html>
