object lunaPark {
	const capacidadMax = 9290
	
	method capacidad(fecha) {
		return capacidadMax
	}
}

object laTrastienda {
	const capacidadMaxMenosSabado = 400
	const capacidadMaxSabado = capacidadMaxMenosSabado + 300
	
	method capacidad(fecha) {
		if (fecha.dayOfWeek() == 6) { // en la definicion de wollok.lang.Date dice que 6 es sabado (para ver mas apretar ctrl y hacer click sobre wollok.lang.Date arriba)
			return capacidadMaxSabado
		}else{
			return capacidadMaxMenosSabado
		}
	}
}