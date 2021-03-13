<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <title>emprendimiento</title>
        <asset:stylesheet src="ol.css"/>
        <style>
            .map {
                height: 400px;
                width: 100%;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
        
        <div class="row">
            <div class="col-sm-4"></div>
            <div class="col-sm-4">
                <g:if test="${emprendimiento!=null}">
                <h1>${emprendimiento.nombre}</h1>
                <p><img src="<g:createLink controller="emprendimiento" action="imagen" id="${emprendimiento.id}"/>" width="100%" height: auto/></p>
                <p><b>Dirección: </b>${emprendimiento.direccion}</p>
                
                <p><b>Rubro: </b>${emprendimiento.rubro}</p>
                <p><b>Ámbito: </b>${emprendimiento.ambito}</p>
                
                <g:if test="${emprendimiento.habilitado}">
                <p><b>Emprendimiento habilitado</b></p>
                </g:if>
                <g:else>
                <p><b>Emprendimiento no habilitado</b></p>
                </g:else>
                <g:if test="${emprendimiento.esValido}">
                <p><b>Emprendimiento validado</b></p>
                </g:if>
                <g:else>
                <p><b>Emprendimiento no validado</b></p>
                </g:else>
                <g:link action="edit" class="btn btn-primary" id="${emprendimiento.id}">Editar emprendimiento</g:link>
                </g:if> 
                <g:else>
                <g:link action="create" class="btn btn-primary">Registrar emprendimiento</g:link>
                </g:else>
            </div>
            <div class="col-sm-4">
            <asset:javascript src="ol.js"/>
                <div id="map" class="map"></div>
                <script type="text/javascript">
                    const punto=${raw(coordenada)};
                    const blob1=new Blob([punto],{type:"text/plain"});
                    const mapa=URL.createObjectURL(blob1);
                    
                    var map = new ol.Map({
                        target: 'map',
                        layers: [
                            new ol.layer.Tile({
                                source: new ol.source.OSM()
                            }),
                            
                        ],

                        
                        view: new ol.View({
                        center: ol.proj.fromLonLat([-67.2046,-54.5090]),
                        zoom: 13
                        })
                    }); 
                    const mapa1=new ol.layer.VectorImage({
                        source:new ol.source.Vector({
                            url:mapa,
                            format: new ol.format.GeoJSON()
                        }),
                        visible: true,
                        title: 'titulo 1'
                    })
                    map.addLayer(mapa1);
                </script>
            </div>
        </div>
        <!-- validado habilitado imagen rubro ambito -->
        </div>
    </body>
</html>

