<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <asset:stylesheet src="ol.css"/>
        <style>
      .map {
        height: 400px;
        width: 100%;
      }
    </style>
        <title>Mapa</title>
    </head>
    <body>
        <h1>Mapa de emprendimientos</h1>
        <asset:javascript src="ol.js"/>
        <div id="map" class="map"></div>
        <script type="text/javascript">
            const capas=${raw(archivos)};
            const puntos=${raw(emprendimientos)};
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
            
            for (let archivo of capas){
                let urlcapa="/mapa/capa/"+archivo
                let capamapa=new ol.layer.VectorImage({
                    source:new ol.source.Vector({
                        url: urlcapa,
                        format: new ol.format.GeoJSON()
                    }),
                    visible: true,
                    title: 'titulo'
                })
                map.addLayer(capamapa);
            }
            for (let emprendimiento of puntos){
                let urlcapa="/mapa/emprendimiento/"+emprendimiento
                let capamapa=new ol.layer.VectorImage({
                    source:new ol.source.Vector({
                        url: urlcapa,
                        format: new ol.format.GeoJSON()
                    }),
                    visible: true,
                    title: 'titulo'
                })
                map.addLayer(capamapa);
            }
        </script>
    </body>
</html>

