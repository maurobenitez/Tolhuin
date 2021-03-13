package tolhuin

class BootStrap {

    def init = { servletContext ->
    	environments {
            development {
                cargar()
            }
        }
    }
    	
    
    def destroy = {
    }

    def cargar(){
		File file = new File("grails-app/assets/csv/BBDD_Tolhuin.csv")
    	def rubros=[:]
		def ambitos=[:]
		def sectores=[:]
		
		file.splitEachLine(",") {campos ->
			if (!sectores.containsKey(campos[5])){
				def sector=new Sector(nombre: campos[5])
				if (sector.validate()){
					sector.save(flush:true)
					sectores.put(campos[5],sector)
				}
			}
			if (!ambitos.containsKey(campos[4])){
				def ambito=new Ambito(nombre: campos[4])
				if (ambito.validate()){
					ambito.save(flush:true)
					ambitos.put(campos[4],ambito)
				}
			}
			if (!rubros.containsKey(campos[3])){
				def rubro=new Rubro(nombre: campos[3])
				if (rubro.nombre!=null){
					rubro.save()
					def sector=sectores.get(campos[5])
					if (sector!=null){
						sector.addToRubros(rubro)
						sector.save()
					}
					rubros.put(campos[3],rubro)
				}
			}
			def emprendimiento=new Emprendimiento(nombre:campos[0],direccion:campos[1],habilitado:campos[2],rubro:rubros.get(campos[3]),ambito:ambitos.get(campos[4]))
			if (emprendimiento.validate()){
				emprendimiento.save()
			}
			
		}
		
    	new Usuario(nombre: "abc", apellido: "def",nick:"admin1", email:"maurogabrielbenitez@gmail.com", tipo: "administrador", contrasena:"11111" ).save()
        new TipoContacto(nombre:"teléfono").save()
    }
}
