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
		return letra.contains(texto)
	}
}