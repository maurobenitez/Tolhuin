package tolhuin

class TipoContacto {
    String nombre

    String toString() {
    	nombre
    }
    static constraints = {
    	nombre unique:true
    }
}
