package tolhuin

class CapaController {

    def index() {
        def capas=Capa.list()
        [capas:capas]
    }
    def create(){
        [capa:new Capa()]
    }

    def show(){
        def capa=Capa.get(params.id)
        [capa:capa]
    }

    def edit(){
        def capa=Capa.get(params.id)
        [capa:capa]
    }

    def save(Capa capa){
    if (capa.hasErrors()){
        flash.errorCapa=true
        render view:"create", model:[capa:capa]
        }else{
            capa.save()
            redirect (action:"show",id:capa.id)
        }
    }  

    def update(Capa capa){
        if (capa.hasErrors()){
        flash.errorCapa=true
        render view:"edit", model:[capa:capa]
        }else{
        capa.save(flush:true)
        redirect view:"index", model:[capas: Capa.list()]
        }
    }

    def delete(){
        def capa=Capa.get(params.id)
        [capa:capa]
    }
    def borrar(){
        Capa.get(params.id).delete(flush:true)
        redirect view:"index", model:[capas: Capa.list()]
    }

 /* def archivo(Long id){
    def capa=Capa.get(id)
    def archivo=capa.getArchivo().toString()
    [archivo:archivo]
  }*/
}
