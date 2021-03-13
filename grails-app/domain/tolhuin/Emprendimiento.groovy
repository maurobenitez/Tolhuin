package tolhuin

class Emprendimiento {
    String nombre
    String latitud
    String longitud
    String direccion
    Boolean esValido
    Boolean habilitado
    byte[] foto
    String featuredImageContentType
    Rubro rubro
    Ambito ambito
    Detalle detalle
    //Usuario investigador
    Date fecha
    
    static belongsTo=[validado:Usuario, enValidacion:Usuario]
    static constraints = {
        nombre nullable: true
        direccion nullable:true
        latitud  nullable:true, display:false
        longitud nullable:true, display:false
        esValido  nullable:true, display:false
        foto nullable: true
        rubro nullable:true
        ambito nullable:true
        detalle nullable:true
        //investigador  nullable:true
        fecha nullable:true, display:false
        validado nullable:true
        enValidacion nullable:true
        featuredImageContentType nullable:true
    }
    static mapping = {
		foto sqlType: 'longblob'
	}
}