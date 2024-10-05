import wollok.game.*
import granja.*

// MAIZ
class Maiz {
	const property position
	var estado = bebe

	method image() { return "corn_" + estado.image() + ".png" }

	method estado() { return estado }

	method reaccionarARiego() { estado = adulto }

	method estaListoParaCosecha() { return estado == adulto }

	method precio() { return 150 }
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

	method estaListoParaCosecha() { return estado >= 2 }

	method precio() { return (estado - 1) * 100 }
}

// TOMACO
class Tomaco {
	var property position

	method image() {
		return "tomaco.png"
	}

	method reaccionarARiego() {
		const siguiente = game.at(position.x(), position.y()+1)
		granja.validarDentro(siguiente)
		granja.validarSiembra(siguiente)
		position = siguiente
	}

	method estaListoParaCosecha() { return true }

	method precio() { return 80 }
}