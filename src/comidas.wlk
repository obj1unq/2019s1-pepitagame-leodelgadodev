import wollok.game.*

object manzana {
	method image() = "manzana.png"
	method position() = game.at(4,5)
	method nombre() = "manzana"
	method energia() = 80
	
	
	

	method crearComida() {
		game.addVisualIn(self, game.at(1.randomUpTo(8).truncate(0),1.randomUpTo(8).truncate(0)))
			game.whenCollideDo(self, {entrenador => entrenador.recogerComida(self)})
	}	
}

object ninguna {
	method nombre() = "No tengo comida ):"
	method energia() = 0
}

object alpiste {
	method nombre() = "alpiste"
	method image() = "alpiste.png"
	method position() = game.at(5,5)
	method energia() = 9999
	
	
	method crearComida() {
		
		
		game.addVisualIn(self, game.at(1.randomUpTo(8).truncate(0), 1.randomUpTo(8).truncate(0)))
			game.whenCollideDo(self, {entrenador => entrenador.recogerComida(self)})
	}	
}
