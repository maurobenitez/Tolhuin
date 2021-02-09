package tolhuin

class UsuarioController {

  def index() {
    def usuarios=Usuario.list()
    [usuarios:usuarios]
  }

  def create(){
      def tipos=['administrador','municipalidad','emprendedor','investigador']
      def usuario=new Usuario()
      TipoContacto.list().each{
        def contacto=new Contacto(tipoContacto:it)
        contacto.save(flush:true)
        usuario.addToContactos(contacto)
      }
      usuario.save(flush:true)
    [usuario:usuario,tipos:tipos]
  }
  def register(){
     def usuario=new Usuario(tipo:'emprendedor')
     TipoContacto.list().each{
        def contacto=new Contacto(tipoContacto:it)
        contacto.save(flush:true)
        usuario.addToContactos(contacto)
      }
      usuario.save(flush:true)
    [usuario:usuario]
  }

  def show(){
    def usuario=Usuario.get(params.id)
    [usuario:usuario]
  }

  def showEmprendedor(){
    def usuario=Usuario.get(params.id)
    [usuario:usuario]
  }

  def edit(){
    def usuario=Usuario.get(params.id)
    def tipos=['administrador','municipalidad','emprendedor','investigador']
    TipoContacto.list().each{
      def contacto=usuario.contactos.find{contacto->contacto.tipoContacto==it}
      if (contacto==null){
        contacto=new Contacto(tipoContacto:it)
        contacto.save(flush:true)
        usuario.addToContactos(contacto)
      }
      usuario.save(flush:true)
    }
    [usuario:usuario, tipos:tipos]
  }
  
  def save(Usuario usuario){
    params.otro.contactos.each{
        def tipoContacto=TipoContacto.findByNombre(it.key)
        def contacto=new Contacto(valor:it.value,tipoContacto:tipoContacto)
        contacto.save()
        usuario.addToContactos(contacto)
      }
   if ((usuario.hasErrors()) || (params.contrasena2!=usuario.contrasena)){
    flash.errorUsuario=true
    render view:"create", model:[usuario:usuario, tipos:['administrador','municipalidad','emprendedor','investigador']]
    }else{
      usuario.save(flush:true)
      redirect view:"index", model:[usuarios: Usuario.list()]
    }
  }

  def saveRegister(Usuario usuario){
    usuario.tipo="emprendedor"
    params.otro.contactos.each{
        def tipoContacto=TipoContacto.findByNombre(it.key)
        def contacto=new Contacto(valor:it.value,tipoContacto:tipoContacto)
        contacto.save()
        usuario.addToContactos(contacto)
      }
   if ((usuario.hasErrors()) || (params.contrasena2!=usuario.contrasena1)){
    flash.errorUsuario=true
    usuario.errors?.allErrors?.each{
      println it.toString()
    }
    render view:"register", model:[usuario:usuario]
    }else{
      usuario.save(flush:true)
      session["logeado"]=true
			session["tipo"]="emprendedor"
      redirect action:"showEmprendedor", id: usuario.id
    }
  }
  
  def update(Usuario usuario){
    if (usuario.hasErrors()){
      flash.errorUsuario=true
      render view:"edit", model:[usuario:usuario, tipos:['administrador','municipalidad','emprendedor','investigador']]
      }else{
        params.otro.contactos.each{ c->
          def tipoContacto=TipoContacto.findByNombre(c.key)
          def contacto=Contacto.findByUsuarioAndTipoContacto(usuario,tipoContacto)
          contacto.valor=c.value
          contacto.save()
        }
        usuario.save(flush:true)
        redirect view:"index", model:[usuarios: Usuario.list()]
      }
  }

  def delete(){
    def usuario=Usuario.get(params.id)
    [usuario:usuario]
  }
  
  def borrar(){
    Usuario.get(params.id).delete(flush:true)
    redirect view:"index", model:[usuarios: Usuario.list()]
  }
    
}