import wollok.game.*
import movimiento.*
import granja.*

object hector {
	var property position = game.at(1,1)
	const property image = "player.png"
	const cosechas = #{}
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
}