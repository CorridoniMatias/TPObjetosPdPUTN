class Musico{
	var grupo
	var habilidadBase
	var elementoHabilidadExtra
	constructor(_grupo ,_habilidadBase , _elementoHabilidadExtra) {
		grupo = _grupo
		habilidadBase = _habilidadBase
		elementoHabilidadExtra = _elementoHabilidadExtra
	}
}

class DeGrupo inherits Musico{
	
	method habilidad(){
		return habilidadBase + self.habilidadExtra()
	}
	
	method habilidadExtra(){
		if (grupo != null){
			return elementoHabilidadExtra
		}else{
			return 0
		}
	}
	
	method interpretaBien(cancion){
		return cancion.duracion() > 300
	}
	
	method costoPresentacion(presentacion){
		if (presentacion.cantMusicos() == 1){
			return 100
		}else{
			return 50
		}
	}
	
	method lanzarSolista() {
		grupo = null 
	}
}

class VocalistaPopular inherits Musico{
	
	method habilidad(){
		return habilidadBase + self.habilidadExtra()
	}
	
	method habilidadExtra(){
		if (grupo != null){
			return -20
		}else{
			return 0
		}
	}
	
	method interpretaBien(cancion){
		return cancion.contienePalabra(elementoHabilidadExtra)
	}
	
	method costoPresentacion(presentacion){
		if (presentacion.capacidadLugar() > 5000){
			return 500
		}else{
			return 400
		}
	}
	
	method lanzarSolista() {
		grupo = null 
	}
}

object luisAlberto inherits Musico(null,8,null){
	var guitarra
	
	method habilidad(){
		return 100.min(habilidadBase * guitarra.valor())
	}
	
	method interpretaBien(cancion){
		return true
	}
	
	method guitarra() = guitarra
	
	method guitarra(_guitarra) {
		guitarra = _guitarra
	}
	
	method costoPresentacion(presentacion){		
		if (30/9/2017 >= presentacion.fecha()) {
			return 1000
		}else{
			return 1200
		}
	}
}