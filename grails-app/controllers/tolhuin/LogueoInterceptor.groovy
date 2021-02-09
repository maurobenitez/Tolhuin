package tolhuin


class LogueoInterceptor {
	public LogueoInterceptor(){
		matchAll()
			.excludes(controller: 'login')
			.excludes(controller:'main')
			.excludes(controller:'grafico')
			.excludes(controller:'emprendimientos',action:'show')
			.excludes(controller:'emprendedor',action: 'create')
			.excludes(controller:'emprendedor',action: 'save')
			.excludes(controller:'emprendedor',action: 'show')
			.excludes(controller:'mapa')
	}

    boolean before() {
    	if (!session.logeado){
    		redirect (controller: 'login', action:"login")
    		return false
    	}
    	true
    }

    boolean after() { true }

    void afterView() {
        // no-op
    }
}

