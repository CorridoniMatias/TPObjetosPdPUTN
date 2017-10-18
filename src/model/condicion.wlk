class Condicion {
	var mensaje
	var lambda
	constructor(_lambda, _mensaje){
		mensaje = _mensaje
		lambda = _lambda
	}
	
	method verificar(musico){
		if(! lambda.apply(musico)){
			throw new Exception (mensaje)
		}
	}
}