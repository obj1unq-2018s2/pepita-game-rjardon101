import ciudades.*
import roque.*

object pepita {
	var property energia = 100
	var property ciudad = null 

	var property posicion = game.at(3,3)
	
	method imagen() {
	   return (
	   	if(self.energia() < 10) {
	   		"pepitaTriste.png"
	   	}
	   	
	   	else (
	   	  if(self.energia() > 100) {
	   	  	"pepita2.png"
	   	  }
	   	  
	   	  else "pepita.png"	
	   	)  	
	   )
	}

	method come(comida) {
		energia = energia + comida.energia()
	}
	
	method energiaParaVolar(distancia) = 15 + 5 * distancia

	method move(nuevaPosicion) {
		energia -= self.energiaParaVolar(posicion.distance(nuevaPosicion))
		self.posicion(nuevaPosicion)
	}	
	
	
	method distanciaA(unaCiudad) = unaCiudad.posicion().distance(self.posicion())
	
	method volaHacia(unaCiudad) {
		if(self.energia()< self.energiaParaVolar(self.distanciaA(unaCiudad))) {
			game.say( self, "dame de comer primero")
		}
		
		else (
			if (ciudad != unaCiudad) {
			self.move(unaCiudad.posicion())
			ciudad = unaCiudad
		}
		else (if (ciudad == unaCiudad) {
			game.say(self, "ya estoy ahí")
		}	
		)	
		)
		
	}

	
	method teEncontro(algo) {
		self.come(algo.comida())
		game.addVisualIn(algo.comida(),game.at(1.randomUpTo(10),1.randomUpTo(10)))
		roque.comida(null)
	}
	


}
