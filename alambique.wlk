object luke {

    var lugaresVisitados = []
    const recuerdo = []
    var vehiculo = alambiqueVeloz

    method viajar(lugar){
        if ( lugar.puedeViajar(vehiculo)) {
        vehiculo.irA(lugar)
        lugaresVisitados = lugaresVisitados + [lugar]
        recuerdo.clear()
        recuerdo.add(lugar.recuerdo()) }
    }
    
    method cantidadLugaresVisitados() = lugaresVisitados.size()
    method ultimoRecuerdo() = recuerdo  
    method cambiarVehiculo(v) { vehiculo = v }
}

object paris {

    method recuerdo() = "torreEiffel" 

    method puedeViajar(vehiculo) = vehiculo.combustible() >= 20  
}

object buenosAires {
    var presidente = "milei"

    method cambiarPresidente(nombre) { presidente = nombre }

    method recuerdo() {
        if ( presidente == "milei" ) return  "mate"  
        else return "mateConYerba"

    }

    method puedeViajar(vehiculo) = vehiculo.velocidadMaxima() >= 30
}

object bagdad {
    const recuerdos = ["bidonConPetroleoCrudo", "armasDeDestruccionMasiva", "jardinesColgantesDeBabilonia", "armaduraDeGuerra" ]

    method recuerdo() = recuerdos.anyOne()

    method puedeViajar(vehiculo) = true
}

object lasVegas {
    
    var lugarHomnejeado = paris

    method cambiarLugarHomenajeado(lugar) { lugarHomnejeado = lugar }

    method recuerdo() = lugarHomnejeado.recuerdo() 

    method puedeViajar(vehiculo) = lugarHomnejeado.puedeViajar(vehiculo)
}

object roma {
    method recuerdo() = "lobaCapitolina"

    method puedeViajar(vehiculo) = vehiculo.combustible() >= 60  
}

object alambiqueVeloz {
    var combustible = 100

    method irA(lugar) { combustible = (combustible - 25).max(0) }

    method combustible() = combustible

    method velocidadMaxima() = 75
  
}

object chatarraEspecial {
    var combustible = municiones * 2
    const municiones = 55
    
    method irA(lugar) { combustible = (combustible - 50).max(0) }

    method combustible() = combustible

    method velocidadMaxima() = 25
}

object antiguallaBlindada {
    var combustible = 180

  //  var gangster = ["pepe","jose","lolo","pedro","carlos","pepita","lino"]
    
    method irA(lugar) { 
        combustible = (combustible - 15).max(0)
         
    }

    method combustible() = combustible

    method gangster() = ["pepe","jose","lolo","pedro","carlos","pepita","lino"]

    method velocidadMaxima() = self.gangster().map({g => g.size()}).sum()
}

object superConvertible {
    var combustible = 300
    var property estaConvertido = true
    var velocidadMaxima = 60
    var vehiculoSimulado = null
    
    method irA(lugar) { 
        if ( self.estaConvertido()){
            combustible = (combustible - 40).max(0)
            velocidadMaxima = velocidadMaxima - 10 }
        else { 
            combustible = (combustible - 30).max(0) }
    }

    method combustible() = combustible

    method velocidadMaxima() = velocidadMaxima

    method vehiculoSimulado() = vehiculoSimulado

    method cambiarVehiculo() { 
        vehiculoSimulado = carrera.vehiculosAnotados().anyOne()
    }
}

// Parte 2
// Los autos locos

object superPerrari {
    var combustible = 120
    var velocidadMaxima = 100
    method irA(lugar) { combustible = (combustible - 50).max(0) }

    method combustible() = combustible

    method hacerTrampa() { 
        combustible = (combustible - 10).max(0)  
        velocidadMaxima = velocidadMaxima - 20    
    }

    method velocidadMaxima() = velocidadMaxima
}

object carrera {

    var vehiculosAnotados = []
    var vehiculosRechazados = []
    var lugar = paris
    
    method vehiculosAnotados() = vehiculosAnotados 
    
    method vehiculosRechazados() = vehiculosRechazados

    method inscribir(vehiculo) { 
        if ( lugar.puedeViajar(vehiculo) ) {
        vehiculosAnotados = vehiculosAnotados + [vehiculo] }
        else {
        vehiculosRechazados = vehiculosRechazados + [vehiculo] }
     }

    method cambiarCiudad(ciudad) {
        lugar = ciudad
        const vehiculos = vehiculosAnotados + vehiculosRechazados
        vehiculosAnotados = vehiculos.filter( {v => lugar.puedeViajar(v)} )
        vehiculosRechazados = vehiculos.filter({ v => not lugar.puedeViajar(v) } )
    }

    method irA(ciudad){
        vehiculosAnotados.forEach({ v => v.irA(ciudad) })
    }


}
