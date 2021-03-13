package tolhuin

class Capa {
    String nombre
    String descripcion
    byte[] archivo
    static constraints = {
    nombre blank: false
    descripcion blank:false
    archivo nullable:true
    }

    static mapping = {
		archivo sqlType: 'longblob'
	}
}
