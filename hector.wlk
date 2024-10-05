import wollok.game.*
import movimiento.*
import granja.*

object hector {
	var property position = game.at(1,1)
	const property image = "player.png"
	const property cosechas = #{}
	var oro = 0

	method oro() {
		return oro
	}

	method mover(direccion) {
		const destino = direccion.siguiente(position)
		granja.validarDentro(destino)
		position = destino
	}

	method sembrar(semilla) {
		granja.sembrar(semilla)
	}

	method regar() {
		granja.regar(self.position())
	}

	method cosechar() {
		granja.cosechar(self)
	}

	method agregar(planta) {
		cosechas.add(planta)
	}

	method inventario() {
		return "Tengo " + oro + " monedas, y " + cosechas.size() + " plantas para vender."
	}

	method vender() {
		oro += cosechas.sum({planta => planta.precio()})
		cosechas.clear()
	}
}