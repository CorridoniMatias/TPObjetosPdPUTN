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
	
	method contienePalabra(texto)
	{
		return letra.toLowerCase().contains(texto.toLowerCase())
	}
	
	method largoLetra() = letra.words().size()
	
	method esMinimalista() = duracion < 180
}

class Remix inherits Cancion
{
	const multiplicadoDuracion = 3
	
	constructor(cancion) = super(cancion.duracion(), cancion.letra())
	{
		letra = "mueve tu cuelpo baby " + letra + " yeah oh yeah"
		duracion *= multiplicadoDuracion
	}
	
}

class Mashup inherits Cancion
{
	constructor(canciones) = super(0, null)
	{
		duracion = canciones.max({cancion => cancion.duracion()})
		letra = canciones.map({cancion => cancion.letra()}).join(" ").trim()		
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