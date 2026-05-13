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
	

	/*
- **Taquito**: Hacer Lionel de un pase atrás al apretar la tecla *t*: La pelota 
se mueve 2 posiciones a la izquierda. (o lo máximo que se pueda mover)
  Tip: usar el método max de los números entre el x actual de la pelota - 2 y 0.
  Validar que la pelota se encuentre en la misma posición que Lionel. */
	method taquito(){
		self.validarPosicion(pelota)
		pelota.recibeTaquito()
		}	
	method validarPosicion(objeto){
		if(not self.estaObjeto(objeto)){
			self.error("no tengo "+ objeto.nombre() +" cerca")
		}
	}
	method estaObjeto(objeto){return objeto.position() == self.position()}	
}
object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)	
	method recibeTaquito() {
	  self.position(game.at(0.max(self.position().x() - 2), self.position().y()))
	}
	method nombre(){return "la pelota"}
}


