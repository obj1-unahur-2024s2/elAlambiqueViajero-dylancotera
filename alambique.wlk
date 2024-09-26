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

    method puedeViajar(vehiculo) = vehiculo.velocidadMaxima() <= 50
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

    method velocidadMaxima() = 50
  
}

object chatarraEspecial {
    var combustible = municiones * 2
    const municiones = 55
    
    method irA(lugar) { combustible = (combustible - 50).max(0) }

    method combustible() = combustible

    method velocidadMaxima() = 55
}

object antiguallaBlindada {
    var combustible = 180
    var velocidadMaxima = 90
    
    method irA(lugar) { 
        combustible = (combustible - 15).max(0)
        velocidadMaxima = velocidadMaxima / self.gangster()
    }

    method combustible() = combustible

    method gangster() = 2

    method velocidadMaxima() = velocidadMaxima
}

object superConvertible {
    var combustible = 300
    var property estaConvertido = true
    var velocidadMaxima = 60
    
    method irA(lugar) { 
        if ( self.estaConvertido()){
            combustible = (combustible - 40).max(0)
            velocidadMaxima = velocidadMaxima - 10 }
        else { 
            combustible = (combustible - 30).max(0) }
    }

    method combustible() = combustible

    method velocidadMaxima() = velocidadMaxima
}