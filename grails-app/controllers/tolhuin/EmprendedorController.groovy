package tolhuin

class EmprendedorController {

  def create(){
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
    if (usuario.enValidacion!=null){
      session.emprendimiento=usuario.enValidacion.id
    }else if (usuario.validado!=null){
      session.emprendimiento=usuario.validado.id
    }
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
    [usuario:usuario]
  }
  
  def save(Usuario usuario){
    usuario.tipo="emprendedor"
    params.otro.contactos.each{
        def tipoContacto=TipoContacto.findByNombre(it.key)
        def contacto=new Contacto(valor:it.value,tipoContacto:tipoContacto)
        contacto.save()
        usuario.addToContactos(contacto)
      }
   if ((usuario.hasErrors()) || (params.contrasena2!=params.contrasena)){
    flash.errorUsuario=true
    usuario.errors?.allErrors?.each{
      println it.toString()
    }
    render view:"create", model:[usuario:usuario]
    }else{
      usuario.save(flush:true)
      session["logeado"]=true
      session["usuario"]=usuario.id
			session["tipo"]="emprendedor"
      session["nombre"]=usuario.nick
      redirect action:"show", id: usuario.id
    }
  }
    
}