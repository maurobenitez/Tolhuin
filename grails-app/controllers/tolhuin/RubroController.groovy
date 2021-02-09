package tolhuin

class RubroController {

  def index() {
    def rubros=Rubro.list()
    [rubros:rubros]
  }

  def create(){
    [rubro:new Rubro(), sectores:Sector.list()]
  }

  def show(){
    def rubro=Rubro.get(params.id)
    [rubro:rubro]
  }

  def edit(){
    def rubro=Rubro.get(params.id)
    [rubro:rubro, sectores:Sector.list()]
  }

  def save(Rubro rubro){
   if (rubro.hasErrors()){
    flash.errorRubro=true
    render view:"create", model:[rubro:rubro, sectores:Sector.list()]
    }else{
      rubro.save(flush:true)
      redirect view:"index", model:[rubros: Rubro.list()]
    }
  }
  def update(Rubro rubro){
    if (rubro.hasErrors()){
    flash.errorRubro=true
    render view:"edit", model:[rubro:rubro, sectores:Sector.list()]
    }else{
      rubro.save(flush:true)
      redirect view:"index", model:[rubros: Rubro.list()]
    }
  }

  def delete(){
    def rubro=Rubro.get(params.id)
    [rubro:rubro]
  }

  def borrar(){
    def rubro=Rubro.get(params.id)
    try{
      rubro.delete(flush:true)
    }
    catch(e){
      flash.errorBorrado=true
      flash.errorMensaje=rubro.nombre
    }
    redirect view:"index", model:[rubros: Rubro.list()]
  }
    
}
