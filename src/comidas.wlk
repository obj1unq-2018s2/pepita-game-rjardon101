object manzana {
	const property imagen = "manzana.png"
	method energia() = 80
	method teEncontro(algo) {
		algo.recogerComida(self)
	}

}

object alpiste {
	const property imagen = "alpiste.png"
	method energia() = 5
	method teEncontro(algo) {
		algo.recogerComida(self)
	}
	

	
}
