object fender{
	method valor(){
		return 10
	}
}

object gibson{
	
	var sana = true
	
	method valor(){
		if (sana){
			return 15
		}else{
			return 5
		}
	}
	
	method romperse(){
		sana = false
	}
}