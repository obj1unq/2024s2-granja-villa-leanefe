import wollok.game.*
import granja.*

// MAIZ
class Maiz {
	const property position
	var property estado = bebe

	method image() { return "corn_" + estado.image() + ".png" }

	method reaccionarARiego() { estado = adulto }
}

object bebe {
	method image() { return "baby" }
}

object adulto {
	method image() { return "adult" }
}

// TRIGO
class Trigo {
	const property position
	var estado = 0

	method image() { return "wheat_" + estado + ".png" }

	method estado() { return estado }

	method reaccionarARiego() {
		estado = if (estado < 3) estado + 1 else 0
	}
}

/*object cero {
	method image() { return "0" }
}

object uno {
	method image() { return "1" }
}

object dos {
	method image() { return "2" }
}

object tres {
	method image() { return "3" }
}*/

// TOMACO
class Tomaco {
	var property position

	method image() {
		return "tomaco.png"
	}

	method reaccionarARiego() {
		const siguiente = game.at(position.x(), position.y()+1)
		granja.validarDentro(siguiente)
		position = siguiente
	}
}