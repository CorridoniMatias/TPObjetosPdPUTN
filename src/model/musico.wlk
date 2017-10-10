class Musico{
	var grupo
	var habilidadBase
	var elementoHabilidadExtra
	var albumes = #{}
	
	constructor(_grupo ,_habilidadBase , _elementoHabilidadExtra) {
		grupo = _grupo
		habilidadBase = _habilidadBase
		elementoHabilidadExtra = _elementoHabilidadExtra
	}
	
	method agregarAlbum(_album)
	{
		albumes.add(_album)
	}
	 
	method esMinimalista()
	{
		return albumes.all({album => album.cancionesMinimalistas()})
	}
	 
	method cancionesConPalabra(palabra)
	{
		return albumes.flatMap({ album => album.cancionesConPalabra(palabra) })
	}
 	
 	method duracionObra()
 	{
 		return albumes.sum({album => album.duracion()})
 	}
	
	method laPego()
	{
		return albumes.all({album => album.bienVendido()})
	}	 
}

class MusicoDeGrupo inherits Musico{
	
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

class MusicoVocalistaPopular inherits Musico{
	
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
		if (new Date(30,9,2017) >= presentacion.fecha()) {
			return 1000
		}else{
			return 1200
		}
	}
}