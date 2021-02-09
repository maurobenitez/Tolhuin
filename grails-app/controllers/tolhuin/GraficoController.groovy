package tolhuin
import groovy.json.* 
class GraficoController {

    def emprendimientosPorSector() { 
    	def data=new ArrayList()
        def labels=Sector.findAll().nombre
        String consulta=""
        labels.each{sector->
            consulta=("from Emprendimiento as e where e.rubro.sector.nombre='$sector'")
            data.add(Emprendimiento.findAll(consulta).size())
        }
        def backgroundcolor=[]
        for (int i in 1..data.size()){
            backgroundcolor.add(getRandomColor())
        }
    	
        def objeto=[datasets:[[label:'emprendimientos por sector',data:data,backgroundColor:backgroundcolor]],labels:labels]
        def json = JsonOutput.toJson(objeto)
        [data: json]
    }

    def rubrosPorSector(){
        def labels=Sector.findAll().nombre
        def data=new ArrayList()
        String consulta=""
        labels.each{
            consulta=("from Rubro as r where r.sector.nombre='$it'")
            data.add(Rubro.findAll(consulta).size)
        }
        def backgroundcolor=[]
        for (int i in 1..data.size()){
            backgroundcolor.add(getRandomColor())
        }
        def objeto=[datasets:[[label:'rubros por sector',data:data,backgroundColor:backgroundcolor]],labels:labels]
        def json=JsonOutput.toJson(objeto)
        [data: json]
        
    }
    def emprendimientosPorAmbito(){
        def labels=Ambito.findAll().nombre
        def data=new ArrayList()
        String consulta=""
        labels.each{
            consulta=("from Emprendimiento as e where e.ambito.nombre='$it'")
            data.add(Emprendimiento.findAll(consulta).size)
        }
        def backgroundcolor=[]
        for (int i in 1..data.size()){
            backgroundcolor.add(getRandomColor())
        }
        def objeto=[datasets:[[label:'emprendimientos por Ambito',data:data,backgroundColor:backgroundcolor]],labels:labels]
        def json=JsonOutput.toJson(objeto)
        [data: json]
        
    }
    def getRandomColor() {
        def letters = ['0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F']
        def color = '#'
        for (int i in 1..6 ) {
            color += letters.get((int)Math.floor(Math.random() * 16))
        }
        color;
    }
}