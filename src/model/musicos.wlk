object joaquin{
	var grupo = "Pimpinela"
	method habilidad(_){
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
	method habilidad(rol){
		return 70 + self.habilidadExtra(rol)
	}
	method habilidadExtra(rol){
		if (rol == "canta" && grupo != null){
			return -20
		}else{
			return 0
		}
	}
	method interpretaBien(cancion){
		return cancion.letra().contains("familia")
	}
	method costoPresentacion(presentacion){
		if (presentacion.lugar().capacidad(presentacion.dia(), presentacion.mes(), presentacion.anio()) > 5000){
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
	method habilidad(guitarra){
		return 100.min(8 * guitarra.valor())
	}
	method interpretaBien(cancion){
		return true
	}
	method costoPresentacion(presentacion){
		var fecha = new wollok.lang.Date(presentacion.dia(), presentacion.mes(), presentacion.anio())
		var fechaLimite = new wollok.lang.Date(30, 9, 2017)
		if (fechaLimite >= fecha) {
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
}

class Presentacion{
	var lugar
	var dia
	var mes
	var anio
	var musicos = #{}
	constructor(_lugar, _dia, _mes, _anio) {
		lugar = _lugar
		dia = _dia
		mes = _mes 
		anio = _anio
	}
	method agregarMusico(musico){
		musicos.add(musico)
	}
	method costo(){
		return musicos.map({musico => musico.costoPresentacion(self)}).sum()
	}
	method lugar(){
		return lugar
	}
	method dia(){
		return dia
	}
	method mes(){
		return mes
	}
	method anio(){
		return anio
	}
	method cantMusicos(){
		return musicos.size()
	}
	method removerMusico(nombre){
		musicos.remove(nombre)
	}
}