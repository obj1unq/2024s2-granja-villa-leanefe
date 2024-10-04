import wollok.game.*

object granja {

	method validarDentro(position) {
		if (not self.estaDentro(position))
			self.error("No puedo moverme fuera de la granja")
	}

	method estaDentro(position) {
		return position.x().between(0, game.width() - 1) and position.y().between(0, game.height() - 1)
	}

    method validarSembrado(position) {
        if (self.hayPlanta(position)) 
            self.error("Ya hay una planta sembrada acá")
    }

    method hayPlanta(position) {
        return game.getObjectsIn(position).any({obj => obj.esPlanta()})
    }

}