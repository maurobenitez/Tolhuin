package tolhuin

class LoginController {
	def autologueo=false
	def logear(){
		def usr=Usuario.findByNickAndContrasena(params.usuario, params.password)
		if (usr!=null){
			session["logeado"]=true	
			session["tipo"]=usr.tipo
			session["usuario"]=usr.id
			if (usr.tipo=="emprendedor"){
				redirect(action:"show", controller: "emprendedor", id:usr.id)
			}
			else{
				redirect(action:"index",controller:"emprendimientos")
			}
			return
		}else{
				flash.errorUsuario=true
			}		
		render(view:"login")
	}
	def login(){
		if (autologueo){
			session["logeado"]=true
			session["tipo"]="administrador"
			redirect(action:"index", controller: "emprendimientos")
			return true
		}
		
	}

	def logout(){
		session.logeado=false
		redirect(controller: "main")
	}

    def index() {}
}


