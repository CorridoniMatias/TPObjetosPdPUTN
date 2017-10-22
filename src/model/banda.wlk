
class Banda {
	
	var nombre
	var musicos = #{}
	var representante
	
	constructor(_nombre, _representante)
	{
		nombre = _nombre
		representante = _representante
	}
	
	method agregarMusico(musico)
	{
		musico.grupo(nombre)
		musicos.add(musico)
	} 
	
	method habilidad()
	{
		return musicos.sum({musico => musico.habilidad()}) * 1.1 
	}
	
	method costoPresentacion(presentacion)
	{
		return musicos.sum({musico => musico.costoPresentacion(presentacion)}) + representante.costoPresentacion()
	}
	
	method puedeTocar(cancion)
	{
		return musicos.all({musico => musico.interpretaBien(cancion)})
	}
}

class Representante
{
	
	var costoPresentacion
	
	constructor(_costoPresentacion)
	{
		costoPresentacion = _costoPresentacion
	}
	
	
	method costoPresentacion()
	{
		return costoPresentacion
	}
}