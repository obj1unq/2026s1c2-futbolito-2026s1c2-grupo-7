/** First Wollok example */
import wollok.game.*

object lionel {
	
	var property position = game.at(3,5)
	
	method image() {
		return "lionel-titular.png"
	}
	method posicion(_position){
		position = _position
	}

	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}
	method levantarla(){
		self.validarPosicion(pelota)
		self.levantar(pelota)
	}
	method levantar(objeto){
		objeto.moverArriba()
		self.caidaLibre()
	}
	method validarPosicion(objeto){
		if (not self.mismaPosicion(objeto)){
			self.error("no se puede levantar el " + objeto + " ya que esta en la misma posicion que lionel")
		}
	}
	method mismaPosicion(objeto){
		return self.position() == objeto.position()
	}
	method caidaLibre(){
			game.schedule(2000, {pelota.bajar()} )
	}
	
}



object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)	
	method moverArriba(){
		position = game.at(position.x(), position.y() + 1)
	}
	method posicion(_position){
		position = _position
	}
	method bajar(){
		position = game.at(position.x(), position.y() - 1)
	}
}
