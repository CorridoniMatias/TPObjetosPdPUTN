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
	
	method largoLetra() = letra.split(" ").size()
	
	method esMinimalista() = duracion < 180
}