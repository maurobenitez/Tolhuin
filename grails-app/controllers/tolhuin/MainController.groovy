package tolhuin
import groovy.json.* 

class MainController {

  def index() {
    def emprendimientos=Emprendimiento.list()
    [emprendimientos:emprendimientos]
  } 

  def show(){
    def emprendimiento=Emprendimiento.get(params.id)
    def x=emprendimiento.getLatitud()
    def y=emprendimiento.getLongitud()
    def coordenada=null    
    //-67.20560073852539
    //-54.49815951177054
    if ((x!=null) && (y!=null)){
      def coordenadaSinSerializar="""{
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
          coordenada=JsonOutput.toJson(coordenadaSinSerializar)
    }
    
    [emprendimiento:emprendimiento, coordenada:coordenada]
  }
    def imagen(Long id){
        def emprendimiento=Emprendimiento.get(id)
        render file: emprendimiento.foto, contentType: emprendimiento.featuredImageContentType
    }
}
