package tolhuin


class AmbitoController {

  def index() {
    [ambitos:Ambito.list()]
  }

  def create(){}

  def edit(){
    def ambito=Ambito.get(params.id)
    [ambito:ambito]
  }

  def save(Ambito ambito){
   if (ambito.hasErrors()){
    flash.errorAmbito=true
    render view:"create", model:[ambito:ambito]
    }else{
      ambito.save()
      redirect view:"index", model:[ambitos: Ambito.list()]
    }
  }  

  def update(Ambito ambito){
    if (ambito.hasErrors()){
    flash.errorAmbito=true
    render view:"edit", model:[ambito:ambito]
    }else{
      ambito.save(flush:true)
      redirect view:"index", model:[ambitos: Ambito.list()]
    }
  }

 def delete(){
    def ambito=Ambito.get(params.id)
    [ambito:ambito]
  }

  def borrar(){
    def ambito=Ambito.get(params.id)
    try{
      ambito.delete(flush:true)
    }
    catch(e){
      flash.errorBorrado=true
      flash.errorMensaje=ambito.nombre
    }
    redirect view:"index", model:[ambitos: Ambito.list()]
  }
    
}
