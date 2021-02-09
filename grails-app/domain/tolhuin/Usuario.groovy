package tolhuin

class Usuario {
    String nick
    String apellido
    String nombre
    String tipo
    String contrasena
    String email    
    Emprendimiento validado
    Emprendimiento enValidacion

    static hasMany=[contactos:Contacto]

    static constraints = {
    	nick unique:true
        tipo(inList:['administrador','municipalidad','emprendedor','investigador'])
        contrasena password: true, nullable:true
        email nullable:true
        validado nullable:true
        enValidacion nullable:true
    }
}
