package tolhuin
import groovy.json.* 
import java.text.DecimalFormat
class EmprendimientosController {

  def index() {
    def emprendimientos=Emprendimiento.list()
    [emprendimientos:emprendimientos]
  }

  def validacion() {
    def emprendimientos=Emprendimiento.findAllByEsValido(false)
    [emprendimientos:emprendimientos]
  }
  def validar(Emprendimiento emprendimiento){
    emprendimiento.esValido=true
    emprendimiento.fecha=new Date()
    def emprendedor=emprendimiento.enValidacion
    emprendedor.validado=emprendimiento
    emprendedor.enValidacion=null
    emprendimiento.validado=emprendedor
    emprendimiento.enValidacion=null
    emprendedor.save(flush:true)
    emprendimiento.save(flush:true)
    flash.validado=true
    def mensaje="Su emprendimiento ha sido validado."
      sendMail {
        to emprendedor.email
        subject "Emprendimiento validado"
        text mensaje
      }
    render view:"validacion", model:[emprendimientos:Emprendimiento.findAllByEsValido(false)]
  }

  def create(){
    [emprendimiento:new Emprendimiento(),rubros:Rubro.list(),ambitos:Ambito.list(), investigadores:Usuario.list()]
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
      emprendimiento.save()
      redirect (action:"show",id:emprendimiento.id)
    }
  }  

  def update(Emprendimiento emprendimiento){
    if (emprendimiento.hasErrors()){
    flash.errorEmprendimiento=true
    render view:"edit", model:[emprendimiento:emprendimiento,rubros:Rubro.list(),ambitos:Ambito.list(), investigadores:Usuario.list()]
    }else{
      emprendimiento.save(flush:true)
      redirect view:"index", model:[emprendimientos: Emprendimiento.list()]
    }
  }

  def delete(){
    def emprendimiento=Emprendimiento.get(params.id)
    [emprendimiento:emprendimiento]
  }
  def borrar(){
    Emprendimiento.get(params.id).delete(flush:true)
    redirect view:"index", model:[emprendimientos: Emprendimiento.list()]
  }
  def imagen(Long id){
    def emprendimiento=Emprendimiento.get(id)
    render file: emprendimiento.foto, contentType: emprendimiento.featuredImageContentType
  }
    
}
