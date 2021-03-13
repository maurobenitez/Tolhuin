package tolhuin
import groovy.json.* 
class MapaController {

    def index() {
        def capas=Capa.list()
        def archivosSinSerializar=[]
        capas.each{
            archivosSinSerializar.add(it.id)
        }
        def emprendimientosSinSerializar=[]
        def emprendimientosLista=Emprendimiento.list()
        emprendimientosLista.each{
            if ((it.latitud!=null)&&(it.longitud!=null)){
                emprendimientosSinSerializar.add(it.id)
            }
        }
            def archivos=JsonOutput.toJson(archivosSinSerializar)
            def emprendimientos=JsonOutput.toJson(emprendimientosSinSerializar)
            [archivos:archivos, emprendimientos:emprendimientos]
     }
    def capa(Long id){
        def capa=Capa.get(params.id)
        def archivo=capa.getArchivo()
        render file: archivo, contentType: 'text'
    }
    def emprendimiento(Long id){
        def emprendimiento=Emprendimiento.get(params.id)
        def x=emprendimiento.getLatitud()
        def y=emprendimiento.getLongitud()
        def archivo=null
        if ((x!=null)&&(y!=null)){
            archivo="""{
            "type": "FeatureCollection",
            "features": [
                {
                "type": "Feature",
                "properties": {},
                "geometry": {
                    "type": "Point",
                    "coordinates": [
                    $x,
                    $y
                    ]
                }
                }
            ]
            }"""
        }
        render archivo
    }

}
