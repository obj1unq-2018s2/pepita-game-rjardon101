import comidas.*

object roque {
	var property comida = null
	var property posicion = game.at(6,4)
	
	method imagen() = "roque.png"
		
	method recogerComida(unaComida) {
	 		comida = unaComida
			game.removeVisual(unaComida)	
	}
	
	method encuentra(algo) {
		algo.teEncontro(self)
	}

}

		