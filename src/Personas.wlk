import Armas.*

class Persona {
	const edad
	const edadDestacada = #{25, 35}
	const potencia = 20
	
	method edad() = edad
	
	method potencia() = potencia
	method esDestacada() = edadDestacada.contains(edad)
	method inteligencia() = if(edad.between(20, 40)) 2 else 8
	
	method darTributo(planeta) {}
	
	method valor() = self.potencia() + self.inteligencia()
}

class Atleta inherits Persona {
	var masaMuscular = 4
	var cantTecnicasConocidas = 2
	
	override method potencia() = potencia + masaMuscular * cantTecnicasConocidas
	override method esDestacada() = super() || cantTecnicasConocidas > 5
	
	method entrenarDias(dias) {
		masaMuscular += dias/5
	}
	
	method aprenderTecnica() {
		cantTecnicasConocidas += 1
	}
	
	override method darTributo(planeta) {
		planeta.construirMurallas(2)
	}
}

class Docente inherits Persona {
	var cantCursosDados = 0
	
	override method inteligencia() = super() + 2 * cantCursosDados
	override method esDestacada() = cantCursosDados > 3
	
	override method darTributo(planeta) {
		planeta.fundarMuseo()
	}
	
	override method valor() = super() + 5
}

class Soldado inherits Persona {
	const coleccionDeArmas = []
	
	method potenciaTotalArmas() = coleccionDeArmas.sum({ arma => arma.potencia(self) })
	override method potencia() = super() + self.potenciaTotalArmas() 
	
	override method darTributo(planeta) {
		planeta.construirMurallas(5)
	}
}