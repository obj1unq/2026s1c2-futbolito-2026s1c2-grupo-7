/** First Wollok example */
import wollok.game.*
object lionel {
	var property position = game.at(3,5)
	var property imagenActual = "lionel-titular.png"
	method image() {
		return imagenActual
	}
	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}
	method cambiarCamiseta(){
		self.validarCambioDeCamiseta()
		self.cambiar()
	}
	method validarCambioDeCamiseta(){
	  if(self.position().x()!= 0){
		self.error("No se puede cambiar de camiseta,lionel no se encuentra en el borde izquierdo")
	  }
	}
	method cambiar() {
	if(self.esTitular()) {
		imagenActual = "lionel-suplente.png"
	} else {
		imagenActual = "lionel-titular.png"
	}
}
  method esTitular() {
	return imagenActual == "lionel-titular.png"
}
}

object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)	
}
