import pepita.*
import comidas.*
import wollok.game.*

object roque {
	
	
	
	var property comida = ninguna
	var property position = game.at(4,4)
	//Property crea tambien casos del metodo en el que reciba un parametro
	method image() = "jugador.png"
	
	method recogerComida(unaComida) {
			game.removeVisual(unaComida) 
			self.soltarComida(comida)
			comida = unaComida
	}
	
	method alimentar(ave) {
		ave.come(comida) 
		self.soltarComida(comida)
		comida = ninguna
	}
	
	method soltarComida(unaComida) {
		if (comida != ninguna) { 
			unaComida.crearComida()
			//POR QUE SI EN LUGAR DE ENCAPSULARLO LO PONIA ACA NO FUNCIONA???<??>
			}
	}
	
	method decimeTuComida() {	
		game.say(self, comida.nombre())
	}
	
	method hayComida(unaComida) = return unaComida.position() == self.position()
	
	method move(nuevaPosicion) {
		self.position(nuevaPosicion)
		
	}
}
