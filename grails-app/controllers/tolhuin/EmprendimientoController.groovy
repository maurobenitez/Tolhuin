package tolhuin

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
    [emprendimiento:emprendimiento]
  }

  def edit(){
    def emp=Emprendimiento.get(params.id)
    def usuario=Usuario.get(session.usuario)
    def emprendimiento=new Emprendimiento()
    if (emp.esValido){
      emprendimiento.setProperties(emp)
      emprendimiento.esValido=false
      emprendimiento.enValidacion=usuario
      usuario.enValidacion=emprendimiento
      emprendimiento.save(flush:true)
      usuario.save(flush:true)
    }else{
      emprendimiento=emp
    }
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
