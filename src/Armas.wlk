import Personas.*

class Arma {
	method potencia(soldado)
}

class Pistolete inherits Arma {
	const largo
	
	override method potencia(soldado) = if(soldado.edad() > 30) 3 * largo else 2 * largo 
}

class Espadon inherits Arma {
	const peso
	
	override method potencia(soldado) = if(soldado.edad() < 40) peso/2 else 6
}