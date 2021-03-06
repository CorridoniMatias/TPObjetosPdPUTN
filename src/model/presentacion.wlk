class Presentacion{
	var lugar
	var fecha
	var musicos = #{}
	var condiciones = #{}
	var bandas = #{}
	
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
	
	method agregarBanda(banda)
	{
		bandas.add(banda)
	}
	
	method removerMusico(nombre){
		musicos.remove(nombre)
	}
	
	method participaDelRecital(musico) = musicos.contains(musico)
	
	method agregarMusico(musico){
		musicos.add(musico)
	}
	
	method agregarCondicion(condicion){
		condiciones.add(condicion)
	}
	
	method removerCondicion(condicion){
		condiciones.remove(condicion)
	}
	
	method cumpleCondiciones(artista){
		condiciones.forEach({condicion => condicion.verificar(artista)})
	}
	
	method magia()
	{
		return musicos.sum({musico => musico.habilidad()}) + bandas.sum({banda => banda.habilidad()})
	}
}

object pdplooza inherits Presentacion(lunaPark, new Date(15,12,2017))
{
	override method agregarMusico(musico)
	{
		self.cumpleCondiciones(musico)
		super(musico)
	}
}