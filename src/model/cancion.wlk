class Cancion{
	var duracion
	var letra
	var titulo
	
	constructor(_titulo, _duracion, _letra) {
		duracion = _duracion
		letra = _letra
		titulo = _titulo
	}
	method letra(){
		return letra
	}
	method titulo() = titulo
	method duracion(){
		return duracion
	}
	
	method tieneDuracionImpar()
	{
		return duracion.odd()
	}
	
	method contienePalabra(texto)
	{
		return letra.toLowerCase().contains(texto.toLowerCase())
	}
	
	method largoLetra() = letra.words().size()
	
	method esMinimalista() = duracion < 180
	
	method largoTitulo() = titulo.size()
}

class Remix inherits Cancion{
	const multiplicadoDuracion = 3
	
	constructor(cancion) = super(cancion.titulo() + " REMIX", cancion.duracion(), cancion.letra())
	{
		letra = "mueve tu cuelpo baby " + letra + " yeah oh yeah"
		duracion *= multiplicadoDuracion
	}
	
}

class Mashup inherits Cancion{
	constructor(canciones) = super("MASHUP", 0, null)
	{
		duracion = canciones.max({cancion => cancion.duracion()}).duracion()
		
		//Como no repetir codigo abajo?
		letra = canciones.map({cancion => cancion.letra()}).join(" ").trim()		
		titulo = canciones.map({cancion => cancion.titulo()}).join(" y ").trim() + " MASHUP"	
	}
}

/*	Solucion con canciones dinamicas
 
	class DisIsTheFakinRemix
	{
		var cancionOriginal
		const multiplicadoDuracion = 3
		
		constructor(cancion){
			cancionOriginal=cancion
		}	
		
		method letra(){
			return "mueve tu cuelpo baby " + cancionOriginal.letra() + " yeah oh yeah"
		}
		
		method duracion(){
			return cancionOriginal.duracion() * multiplicadoDuracion
		}
		
		
	}
*/