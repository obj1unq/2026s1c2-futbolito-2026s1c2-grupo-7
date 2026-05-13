/** First Wollok example */
import wollok.game.*

object lionel {
	
	var property position = game.at(3,5)
	
	method image() {
		return "lionel-titular.png"
	}

	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}
	method patear() {
	  self.validarPelota(pelota)
	  pelota.moverse()
	}
	method validarPelota(obj) {
		if (!self.mismaPosicion(obj)){
			self.error("No hay pelota para patear")
		}
	}
	method mismaPosicion(obj) {
	  return self.position() == obj.position()
	}
}
object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)	

	method moverse() {
		position = game.at(
			(game.width() - 1).min(position.x() + 3),
			position.y()
		)
	}
	method esPateable() {
	  return true
	}
}
