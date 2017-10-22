class Musico{
	var grupo
	var habilidadBase
	var elementoHabilidadExtra
	var albumes = #{}
	
	var formaDeCobro 
	var formaDeInterpretar
	
	const habilidadParaInterpretarBien = 60
	
	constructor(_grupo ,_habilidadBase , _elementoHabilidadExtra, _formaDeInterpretar, _formaDeCobro) {
		grupo = _grupo
		habilidadBase = _habilidadBase
		elementoHabilidadExtra = _elementoHabilidadExtra
		formaDeCobro = _formaDeCobro
		formaDeInterpretar = _formaDeInterpretar
	}
	
	method lanzarSolista() {
		grupo = null
	}
	
	method grupo(_grupo)
	{
		grupo = _grupo
	}
	
	method habilidadExtra()
		
	method habilidad(){
		return habilidadBase + self.habilidadExtra()
	}
	
	method formaDeCobro(_formaDeCobro)
	{
		formaDeCobro = _formaDeCobro
	}
	
	method formaDeInterpretar(_formaDeInterpretar)
	{
		formaDeInterpretar = _formaDeInterpretar
	}
	
	method agregarAlbum(_album)
	{
		albumes.add(_album)
	}
	 
	method esMinimalista()
	{
		return albumes.all({album => album.sonCancionesMinimalistas()})
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
	
	method interpretaBien(cancion){
		return  albumes.any({album => album.poseeCancion(cancion)}) or self.habilidad() > habilidadParaInterpretarBien or formaDeInterpretar.interpretaBien(cancion)
	}
	
	method costoPresentacion(presentacion)
	{
		return formaDeCobro.costoPresentacion(presentacion)
	}
	
	method noCompusoCanciones() = albumes.all({album => album.noContieneCanciones()})
	
	method habilidadBase(cantidad){
		habilidadBase = cantidad
	}
	
	method interpretaBienCanciones(canciones)
	{
		return canciones.filter({cancion => self.interpretaBien(cancion)})
	}
}

class MusicoDeGrupo inherits Musico
{
	override method habilidadExtra(){
		if (grupo != null){
			return elementoHabilidadExtra
		}else{
			return 0
		}
	}
}

class MusicoVocalistaPopular inherits Musico
{
	override method habilidadExtra(){
		if (grupo != null){
			return -20
		}else{
			return 0
		}
	}
}

class MusicoPalabrero
{
	var palabraClave
	
	constructor (_palabraClave)
	{
		palabraClave = _palabraClave	
	} 
	
	method interpretaBien(cancion){
		return cancion.contienePalabra(palabraClave)
	}
}

class MusicoLarguero
{
	var segundos
	
	constructor (_segundos)
	{
		segundos = _segundos	
	} 
	
	method interpretaBien(cancion){
		return cancion.duracion() > segundos
	}
}

object musicoImparero
{
	method interpretaBien(cancion){
		return cancion.tieneDuracionImpar()
	}
}

class CobraSegunCantidadDeMusicos
{
	var cobroSolista
	
	constructor(_cobroSolista)
	{
		cobroSolista = _cobroSolista
	}
	
	method costoPresentacion(presentacion){
		if(presentacion.cantMusicos() == 0)
			return cobroSolista
		else
			return cobroSolista / 2
	}
}

class CobraSegunCapacidadLugar
{
	var cobroPorCapacidad
	var capacidad
	
	constructor(_cobroPorCapacidad, _capacidad)
	{
		cobroPorCapacidad = _cobroPorCapacidad
		capacidad = _capacidad
	}
	
	method costoPresentacion(presentacion){
		if(presentacion.capacidadLugar() > capacidad)
			return cobroPorCapacidad
		else
			return cobroPorCapacidad - 100
	}
}

class CobraSegunInflacion
{
	var cobroHastaFechaLimite
	var proporcional
	var fechaLimite
	
	constructor(_cobroHastaFechaLimite, _fechaLimite, _proporcional)
	{
		cobroHastaFechaLimite = _cobroHastaFechaLimite
		fechaLimite = _fechaLimite
		proporcional = _proporcional
	}
	
	method costoPresentacion(presentacion){
		if(presentacion.fecha() <= fechaLimite)
			return cobroHastaFechaLimite
		else
			return cobroHastaFechaLimite + (cobroHastaFechaLimite * proporcional) / 100
	}
}

object luisAlberto inherits Musico(null, 8, null, null, null){
	var guitarra
	
	override method habilidadExtra()
	{
		return 0
	}
	
	override method habilidad(){
		return 100.min(habilidadBase * guitarra.valor())
	}
	
	override method interpretaBien(cancion){
		return true
	}
	
	override method costoPresentacion(presentacion){		
		if (new Date(30,9,2017) >= presentacion.fecha()) {
			return 1000
		}else{
			return 1200
		}
	}
	
	method guitarra() = guitarra
	
	method guitarra(_guitarra) {
		guitarra = _guitarra
	}
}