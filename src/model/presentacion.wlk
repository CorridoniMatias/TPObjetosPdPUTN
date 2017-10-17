import estadio.*
import cancion.*

class ExceptionHabilidadMenor70 inherits Exception{}
class ExceptionNoCompusoCanciones inherits Exception{}
class ExceptionNoInterpretaBienAlicia inherits Exception{}

class Presentacion{
	var lugar
	var fecha
	var musicos = #{}
	
	constructor(_lugar, _fecha) {
		lugar = _lugar
		fecha =  _fecha
	}
	
	method costo(){
		return musicos.sum({musico => musico.costoPresentacion(self)})
	}
	
	method lugar(){
		return lugar
	}
	
	method capacidadLugar() = lugar.capacidad(fecha)
	
	method fecha() = fecha
	
	method cantMusicos(){
		return musicos.size()
	}
	
	method removerMusico(nombre){
		musicos.remove(nombre)
	}
	
	method participaDelRecital(musico) = musicos.contains(musico)
	
	method agregarMusico(musico){
		musicos.add(musico)
	}
}

object pdpalooza inherits Presentacion (lunaPark , new Date(15,12,2017)){
	
	override method agregarMusico (musico){
		if (musico.habilidad() < 70){
			throw new ExceptionHabilidadMenor70()
		}
		
		if (musico.noCompusoCanciones()){
			throw new ExceptionNoCompusoCanciones()
		}
		
		if (not musico.interpretaBien(aliciaEnElPais)){
			throw new ExceptionNoInterpretaBienAlicia()
		}
		
		super(musico)
	}
	
}