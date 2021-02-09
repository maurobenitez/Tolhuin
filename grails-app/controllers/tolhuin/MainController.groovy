package tolhuin

class MainController {

  def index() {
    def emprendimientos=Emprendimiento.list()
    [emprendimientos:emprendimientos]
  } 

  def show(){
    def usuario=Usuario.get(params.id)
    [usuario:usuario]
  }

}
