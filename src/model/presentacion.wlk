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