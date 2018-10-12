import guerreros.*

object fuerzaOscura {
	var property valor = 5
	
	method eclipse() { self.valor(self.valor()*2) }
}

class Logos{
	var nombre
	
	var multiplicador
	
	constructor(nuevoNombre,nuevoMultiplicador){
		nombre= nuevoNombre
		
		multiplicador= nuevoMultiplicador
	}
	
	method esPoderoso(guerrero){ return self.poder(guerrero) > 15 }
	
	method precio(guerrero){return self.poder(self)}

	method poder(guerrero){ return nombre.size()*multiplicador }
	
	method nombre(nuevoNombre){ nombre= nuevoNombre }
}

object hechizoBasico {
	method poder (guerrero) { return 10 }
	
	method esPoderoso(guerrero){ return false }
	
	method precio(guerrero){return 10}
}

/////////////
class LibroHechizos{
	var hechizos = []
	constructor(nuevosHechizos){
		self.hechizos(nuevosHechizos)
	}
	method filtrarLibros(nuevosHechizos){
		if (nuevosHechizos.contains(self)){ 
			nuevosHechizos.remove(self)
			return self.filtrarLibros(nuevosHechizos)
			}
		else return nuevosHechizos
	}
	method cantidadDeHechizos(){return hechizos.size()}
	
	method monedasPoderosas(guerrero){return hechizos.filter({hechizo=> hechizo.esPoderoso(guerrero)}).sum({hechizo=> hechizo.poder(guerrero)})}
	
	method precio(guerrero){return self.cantidadDeHechizos()*10+ self.monedasPoderosas(guerrero)}
	
	method hechizos(nuevosHechizos){ hechizos.addAll(self.filtrarLibros(nuevosHechizos))} 
	
	method poder(guerrero){ return hechizos.filter({hechizo=>hechizo.esPoderoso(guerrero)}).sum({hechizo=>hechizo.poder(guerrero)}) }
}
object espejo{ // el espejo tiene que seguir siendo unico a diferencia del libro
	method valor(guerrero){ return guerrero.valorMejorArtefacto() }
	
	method precio(guerrero){return 90}
	
	method esEspejo(){ return true } //@ Un asquete
}
