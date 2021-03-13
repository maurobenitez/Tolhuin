package tolhuin
import groovy.json.* 

class EmprendimientoController {

  def create(){
    [emprendimiento:new Emprendimiento(),rubros:Rubro.list(),ambitos:Ambito.list()]
  }

  def show(){
        
    def usuario=Usuario.get(params.id)
    def emprendimiento=null
    if (usuario.enValidacion!=null){
      emprendimiento=usuario.enValidacion
    }else{
      emprendimiento=usuario.validado
    }
    def coordenada=null
    if (emprendimiento!=null){
      def x=emprendimiento.getLatitud()
      def y=emprendimiento.getLongitud()
          


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
    }
    [emprendimiento:emprendimiento, coordenada:coordenada]
  }

  def edit(){
    def emprendimiento=Emprendimiento.get(params.id)
    [emprendimiento:emprendimiento,rubros:Rubro.list(),ambitos:Ambito.list(), investigadores:Usuario.list()]
  }

  def save(Emprendimiento emprendimiento){
   if (emprendimiento.hasErrors()){
    flash.errorEmprendimiento=true
    render view:"create", model:[emprendimiento:emprendimiento,rubros:Rubro.list(),ambitos:Ambito.list(),investigadores:Usuario.list()]
    }else{
      emprendimiento.esValido=false
      def usuario=Usuario.get(session.usuario)
      usuario.enValidacion=emprendimiento
      emprendimiento.enValidacion=usuario
      usuario.save(flush:true)
      emprendimiento.save(flush:true)
      redirect action:"show", id:usuario.id
    }
  }  

  def update(Emprendimiento emprendimiento){
    if (emprendimiento.hasErrors()){
      flash.errorEmprendimiento=true
      println(emprendimiento.foto)
      println(emprendimiento.getErrors())
      
      render view:"edit", model:[emprendimiento:emprendimiento,rubros:Rubro.list(),ambitos:Ambito.list(), investigadores:Usuario.list()]
    }else{
      emprendimiento.save(flush:true)
      redirect action:"show", id:session.usuario
    }
  }

  def imagen(Long id){
    def emprendimiento=Emprendimiento.get(id)
    render file: emprendimiento.foto, contentType: emprendimiento.featuredImageContentType
  }
  
  def delete(){
    def emprendimiento=Emprendimiento.get(params.id)
    [emprendimiento:emprendimiento]
  }
  def borrar(){
    Emprendimiento.get(params.id).delete(flush:true)
    redirect view:"index", model:[emprendimientos: Emprendimiento.list()]
  }
    
}
