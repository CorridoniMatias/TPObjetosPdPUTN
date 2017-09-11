object lunaPark {
	const capacidadMax = 9290
	method capacidad(fecha) {
		return capacidadMax
	}
}
object laTrastienda {
	const capacidadMaxMenosSabado = 400
	const capacidadMaxSabado = capacidadMaxMenosSabado + 300
	method capacidad(fecha){
		if (self.diaSemanaSabado(fecha)){
			return capacidadMaxSabado
		}else{
			return capacidadMaxMenosSabado
		}
	}
	method diaSemanaSabado (fecha){
		return // no se como averiguar el dia de la semana con la fecha (tanto costaba mirar un calendario?)
}