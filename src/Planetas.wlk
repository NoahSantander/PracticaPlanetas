import Personas.*

class Planeta {
	const habitantes = #{}
	var cantMuseos
	var defensa = 2
	var longitudMuralla
	
	method defensa() = defensa
	
	method habitantesDestacados() = habitantes.filter({ habitante => habitante.esDestacada() })
	method delegacionDiplomatica() = self.habitantesDestacados()
	
	method todosHabitantesCultos() = habitantes.all({ habitante => habitante.inteligencia() > 10 })
	method esCulto() = cantMuseos == 2 && self.todosHabitantesCultos()
	
	method potenciaHabitantes() = habitantes.map({ habitante => habitante.potencia() })
	method potenciaReal() = self.potenciaHabitantes().sum()
	
	method construirMurallas(longitud) {
		longitudMuralla += longitud
	}
	
	method fundarMuseo() {
		cantMuseos += 1
	}
	
	method habitanteMasPotente() = habitantes.max({ habitante => habitante.potencia() })
	method potenciaMasPotente() = self.habitanteMasPotente().potencia()
	method potenciaAparente() = self.potenciaMasPotente() * habitantes.size()
	
	method necesitaReforzarse() = 2 * self.potenciaAparente() > self.potenciaReal()
	
	method recibirTributos() {
		habitantes.forEach({ habitante => habitante.darTributo(self) })
	}
	
	method habitanteValioso(habitante) = habitante.valor() > 40
	method habitantesMasValiosos() = habitantes.filter({ habitante => self.habitanteValioso(habitante) })
	
	method darTributo(quienes, planeta) {
		quienes.forEach({ quien => quien.darTributo(planeta) })	
	}
	method apaciguarPlaneta(planeta) {
		self.darTributo(self.habitantesMasValiosos(), planeta)
	}
}
