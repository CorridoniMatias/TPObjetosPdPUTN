object joaquin{
	var grupo = "Pimpinela"
	
	method habilidad(){
		return 20 + self.habilidadExtra()
	}
	
	method habilidadExtra(){
		if (grupo != null){
			return 5
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

object lucia{
	var grupo = "Pimpinela"
	
	method habilidad(){
		return 70 + self.habilidadExtra()
	}
	
	method habilidadExtra(){
		if (grupo != null){
			return -20
		}else{
			return 0
		}
	}
	
	method interpretaBien(cancion){
		return cancion.contieneLetra("familia")
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

object luisAlberto{
	
	var guitarra
	
	method habilidad(){
		return 100.min(8 * guitarra.valor())
	}
	
	method interpretaBien(cancion){
		return true
	}
	
	method guitarra() = guitarra
	
	method guitarra(_guitarra) {
		guitarra = _guitarra
	}
	
	method costoPresentacion(presentacion){
		var fechaLimite = new wollok.lang.Date(30, 9, 2017)
		
		if (fechaLimite >= presentacion.fecha()) {
			return 1000
		}else{
			return 1200
		}
	}
}

object fender{
	method valor(){
		return 10
	}
}

object gibson{
	
	var sana = true
	
	method valor(){
		if (sana){
			return 15
		}else{
			return 5
		}
	}
	
	method romperse(){
		sana = false
	}
}

class Cancion{
	var duracion
	var letra
	constructor(_duracion, _letra) {
		duracion = _duracion
		letra = _letra
	}
	method letra(){
		return letra
	}
	method duracion(){
		return duracion
	}
	
	method contieneLetra(texto)
	{
		return letra.contains(texto)
	}
}

class Presentacion{
	var lugar
	var fecha
	var musicos = #{}
	
	constructor(_lugar, _fecha) {
		lugar = _lugar
		fecha =  _fecha
	}
	
	method agregarMusico(musico){
		musicos.add(musico)
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
}