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
	method recibeTaquito() {
	  self.position(game.at(0.max(self.position().x() - 2), self.position().y()))
	}
	method nombre(){return "la pelota"}
}


