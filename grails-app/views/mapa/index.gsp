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
            var map = new ol.Map({
                target: 'map',
                layers: [
                new ol.layer.Tile({
                    source: new ol.source.OSM()
                })
                ],

                
                view: new ol.View({
                center: ol.proj.fromLonLat([-67.2046,-54.5090]),
                zoom: 13
                })
            });
        </script>
    </body>
</html>

