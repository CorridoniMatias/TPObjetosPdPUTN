
class Album {

	var titulo
	var canciones = #{}
	var fechaLanzamiento
	var unidadesEnVenta
	var unidadesVendidas

	constructor(_titulo, _lanzamiento, _unidadesEnVenta, _unidadesVendidas)
	{
		titulo = _titulo
		unidadesEnVenta = _unidadesEnVenta
		unidadesVendidas = _unidadesVendidas
		fechaLanzamiento = _lanzamiento
	}
	 
	method agregarCancion(cancion){
		canciones.add(cancion)
	}
	
	method sonCancionesMinimalistas()
	{
		return canciones.all({cancion => cancion.esMinimalista()})
	}
	
	method cancionesConPalabra(palabra)
	{
		return canciones.filter({cancion => cancion.contienePalabra(palabra)})
	}
	
	method duracion() = canciones.sum({cancion => cancion.duracion()})

	method cancionMasLarga() = canciones.max({cancion => cancion.largoLetra()})
	
	method bienVendido() = unidadesVendidas / unidadesEnVenta > 0.75
	
	method poseeCancion(cancion) = canciones.contains(cancion)

}