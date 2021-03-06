import ciudades.*
import wollok.game.*
import comidas.*

object pepita {
	var property energia = 100
	var property ciudad = buenosAires 
	var imagen = "pepita.png"
	var amiga = null

	var property position = game.at(3,3)
	method image() = imagen
	
	method come(comida) {
		energia = energia + comida.energia()
	}
	
	method nuevaAmiga(ave) {
		if (amiga != ave ) {
			game.say(self, "Hola " + ave.nombre() + "!!!!! Hace un hermoso dia hoy!")
			amiga = ave
		}
		
	}
	
	method volaHacia(unaCiudad) {
		if (ciudad == unaCiudad || self.position() == unaCiudad.position() ) 
		{ game.say(self, "Ya estoy en " + unaCiudad.nombre() )	}
		else { self.volaSiPodes(unaCiudad) }
	}
	
	method volaSiPodes(city) {
		if (energia - self.energiaParaVolar(position.distance(city.position())) >= 0)
		{
			self.move(city.position())
			ciudad = city
		}
		else { game.say(self, "Dame comida!!!!" ) }
	}
	
	method volarYcomer(comida) {
		self.move(comida.position())
		game.removeVisual(comida)
		self.engordar()
		//energia += comida.energia()
	}

	method engordar() {
		if (self.energia() > 100) { 
			imagen = "pepita-gorda-raw.png" 
			game.addVisual(self)
		}
	}

	method energiaParaVolar(distancia) = 15 + 5 * distancia

	method move(nuevaPosicion) {
		energia -= self.energiaParaVolar(position.distance(nuevaPosicion))
		self.position(nuevaPosicion)
		//self.hablar()
		//self.comerComerComer() // IF EXISTE LA VISUAL, EJECUTAR ESTO. CASO CONTRARIO TIRA SIEMPRE UN EXCEPTION
	}	
	
	method comerComerComer() {
		if (self.position() == manzana.position()) { game.removeVisual(manzana) }
		if (self.position() == alpiste.position()) { game.removeVisual(alpiste) }
	}
	
	
	
}

object pepona {
	method nombre() = "pepona" 
	method position() = game.at(2,8)
	method image() = "pepona.png"
	
	method colisionasteCon(persona) {
		//persona.alimentar(self)	
	}
}

object pipa {
	method nombre() = "pepona"
	method image() = "pepitaCanchera.png"
	method position() = game.at( 5 , 9 )
	
	method colisionasteCon(persona) {
		//persona.alimentar(self)	
	}
}
