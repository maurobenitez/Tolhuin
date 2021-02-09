package tolhuin

class Contacto {
    String valor
    TipoContacto tipoContacto
    
    static belongsTo=[usuario:Usuario]
    String toString() {
    	valor
    }
    static constraints = {
    	valor blank:true, nullable:true
    	
    }
}
