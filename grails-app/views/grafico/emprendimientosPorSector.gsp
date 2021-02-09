<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />

        <title>Graficos estadísticos</title>
    </head>

    <body>
        <br>    
        <div class="container">
            <div class="row">
                <div class="col">
                    <div class="btn-group" role="group">
                        <g:link class="btn btn-secondary grupo" action="rubrosPorSector">Rubros por sector</g:link>
                        <g:link class="btn btn-secondary grupo" action="emprendimientosPorAmbito">emprendimientos por ámbito</g:link>
                        <g:link class="btn btn-secondary grupo" action="emprendimientosPorSector">emprendimientos por sector</g:link>
                    </div>      
                </div>
            </div>
        </div>
        
        <h1>Emprendimientos por sector</h1>
        <div class="row">
            <div class="col-sm-4"></div>
            <div class="col-sm-4">
                <asset:javascript src="chartjs.js"/>
                <div class="chart-container" height:50; width:30">
                    <canvas id="myChart" responsive=true></canvas>
                </div>
        
                <script>
                    var ctx = document.getElementById("myChart").getContext('2d');
                    data =  ${raw(data)};
                    var myPieChart = new Chart(ctx,{
                        type: 'pie',
                        data: data,
                        options: {
                            layout: {
                                padding: {
                                    left: 0,
                                    right: 0,
                                    top: 0,
                                    bottom: 0
                                }
                            }
                        }
                    });
                </script>
            </div>
            <div class="col-sm-4"></div>
        </div>

    </body>

</html> 
