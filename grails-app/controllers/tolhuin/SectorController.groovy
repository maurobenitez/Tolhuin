package tolhuin


class SectorController {

  def index() {
    def sectores=Sector.list()
    [sectores:sectores]
  }

  def create(){}

  def show(){
    def sector=Sector.get(params.id)
    [sector:sector]
  }

  def edit(){
    def sector=Sector.get(params.id)
    [sector:sector]
  }

  def save(Sector sector){
   if (sector.hasErrors()){
    flash.errorSector=true
    render view:"create", model:[sector:sector]
    }else{
      sector.save(flush:true)
      redirect view:"index", model:[sectores: Sector.list()]
    }
  }  

  def update(Sector sector){
   if (sector.hasErrors()){
    flash.errorSector=true
    render view:"edit", model:[sector:sector]
    }else{
      sector.save(flush:true)
      redirect view:"index", model:[sectores: Sector.list()]
    }
  }


 def delete(){
    def sector=Sector.get(params.id)
    [sector:sector]
  }

  def borrar(){
    def sector=Sector.get(params.id)
    try{
      sector.delete(flush:true)
    }
    catch(e){
      flash.errorBorrado=true
      flash.errorMensaje=sector.nombre
    }
    redirect view:"index", model:[sectores: Sector.list()]
  }
    
}
