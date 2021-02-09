package tolhuin

class Ambito {
    String nombre
    
    static constraints = {
        nombre blank: false
    }
    String toString() {
    	nombre
    }
}
