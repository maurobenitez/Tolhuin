package tolhuin

class TipocontactoController{

  def index() {
    def tipoContactos=TipoContacto.list()
    [tipoContactos:tipoContactos]
  }

  def create(){}

  def show(){
    def tipoContacto=TipoContacto.get(params.id)
    [tipoContacto:tipoContacto]
  }

  def edit(){
    def tipoContacto=TipoContacto.get(params.id)
    [tipoContacto:tipoContacto]
  }

  def save(TipoContacto tipoContacto){
   if (tipoContacto.hasErrors()){
    flash.errorTipoContacto=true
    render view:"create"
    }else{
      tipoContacto.save()
      render view:"index", model:[tipoContactos: TipoContacto.list()]
    }
  }  

  def update(TipoContacto tipoContacto){
   if (tipoContacto.hasErrors()){
    flash.errorTipoContacto=true
    render view:"edit", model:[tipoContacto:tipoContacto]
    }else{
      tipoContacto.save(flush:true)
      render view:"index", model:[tipoContactos: TipoContacto.list()]
    }
  }

 def delete(){
    def tipoContacto=TipoContacto.get(params.id)
    [tipoContacto:tipoContacto]
  }

  def borrar(){
    def tipoContacto=TipoContacto.get(params.id)
    try{
      tipoContacto.delete(flush:true)
    }
    catch(e){
      flash.errorBorrado=true
      flash.errorMensaje=tipoContacto.nombre
    }
    render view:"index", model:[tipoContactos: TipoContacto.list()]
  }
    
}
	
