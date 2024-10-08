import wollok.game.*
import hector.*

object granja {

    const property cultivos = #{}
    
    method cultivoEn(position) {
        return cultivos.find({cultivo => cultivo.position()==position})
    }

    method hayCultivoEn(position) {
        return cultivos.any({cultivo => cultivo.position() == position})
    }

	method validarDentro(position) {
		if (not self.estaDentro(position))
			self.error("No puedo moverme fuera de la granja.")
	}

	method estaDentro(position) {
		return position.x().between(0, game.width() - 1) and position.y().between(0, game.height() - 1)
	}

    method sembrar(semilla) {
        self.validarSiembra(semilla.position())
        cultivos.add(semilla)
        game.addVisual(semilla)
    }

    method validarSiembra(position) {
        if (self.hayCultivoEn(position)) 
            self.error("Ya hay un cultivo en esta posición.")
    }

    method regar(position) {
        self.validarRiego(position)
        self.cultivoEn(position).reaccionarARiego()
    }

    method validarRiego(position) {
        if (not self.hayCultivoEn(position)) 
            self.error("No tengo nada para regar.")
    }

    method cosechar(granjero) {
        const position = granjero.position()
        self.validarCosecha(position)
        const cultivoACosechar = self.cultivoEn(position)
        granjero.agregar(cultivoACosechar)
        game.removeVisual(cultivoACosechar)
        cultivos.remove(cultivoACosechar)
    }

    method validarCosecha(position) {
        if (not self.hayCultivoEn(position))
            self.error("No tengo nada para cosechar.")
        else if (not self.cultivoEn(position).estaListoParaCosecha())
            self.error("La planta no está lista para cosecha.")
    }
}