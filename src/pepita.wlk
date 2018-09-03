import ciudades.*

object pepita {
	var property energia = 100
	var property ciudad = buenosAires 

	var property posicion = game.at(3,3)
	method imagen() = "pepita.png"

	method come(comida) {
		energia = energia + comida.energia()
	}
	
	method volaHacia(unaCiudad) {
		if (ciudad != unaCiudad) {
			self.move(unaCiudad.posicion())
			ciudad = unaCiudad
		}
		
	}

	method energiaParaVolar(distancia) = 15 + 5 * distancia

	method move(nuevaPosicion) {
		energia -= self.energiaParaVolar(posicion.distance(nuevaPosicion))
		self.posicion(nuevaPosicion)
	}	
	
	//el metodo funciona pero el mensaje no desaparece una vez que se mueve de ahí
	method estaEn(unaCiudad) {
		if(self.posicion() != unaCiudad.posicion() ) {
			self.volaHacia(unaCiudad)
		} 
		else game.say(self, "ya estoy ahí")
	}
	
	
	//no me salió
	method distance(unaCiudad) = unaCiudad.posicion()
		
	method pepitaNoPuedeRecorrer(distancia) {
		if(self.energiaParaVolar(distancia) < self.energia()) {
			game.say(self, "dame de comer primero!")
		}
	}
	
	// como hago para que pepita coma solo UNA VEZ
	method teEncontro(algo) {
		self.come(algo.comida())
		game.addVisualIn(algo.comida(),game.at(1.randomUpTo(10),1.randomUpTo(10)))
	}

}
