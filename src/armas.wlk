import guerreros.*

object fuerzaOscura {
	var property valor = 5
	
	method eclipse() { self.valor(self.valor()*2) }
}

class ArmaBasica{
	method valor(guerrero){ return 3 }
	
	method precio(guerrero){return self.valor(self)*5}
	
	method esEspejo(){ return false} //@ Un asquete
}

object collarDivino{
	var perlas = 0
	
	method perlas (cantidadDePerlas){ perlas = cantidadDePerlas }
	
	method precio(guerrero){return perlas*2}
	
	method valor(guerrero){ return perlas }
	
	method esEspejo(){ return false} //@ Un asquete
}


class Mascara{
	var indiceOscuridad
	
	var property minimo = 4
	
	constructor(nuevoIndiceOscuridad){
		if(nuevoIndiceOscuridad<=1 && nuevoIndiceOscuridad>=0){indiceOscuridad = nuevoIndiceOscuridad}
		else {self.error("el indice de oscuridad debe estar entre 0 y 1")}
	}
	method valor(guerrero){ return minimo.max((fuerzaOscura.valor()/2)*indiceOscuridad) }
	
	method esEspejo(){ return false} //@ Un asquete
}


class Armadura{
	var valorBase
	
	var refuerzo //cota ó bendicion ó hechizo
	
	constructor(nuevoValorBase,nuevoRefuerzo){
		valorBase= nuevoValorBase
		self.refuerzo(nuevoRefuerzo)
	}
	method refuerzo(nuevoRef){ refuerzo = nuevoRef }
	
	method precio(guerrero){return refuerzo.precio(valorBase,guerrero)}
	
	method valor(guerrero){ return valorBase + refuerzo.poder(guerrero) }
	
	method esEspejo(){ return false } //@ Un asquete
}

object espejo{
	method valor(guerrero){ return guerrero.valorMejorArtefacto() }
	
	method precio(guerrero) {return 90}
	
	method esEspejo(){ return true } //@ Un asquete
}

object bendicion{
	method poder(guerrero){ return guerrero.nivelHechiceria() }
	
	method precio(valorBase,guerrero){return valorBase} 
}//@debe haber forma de que te diga quien usa la armadura sin poner rolando

object hechizo{
	method poder(guerrero){ return guerrero.poderHechizoPreferido() }
	
	method precio(valorBase,guerrero){return valorBase + self.poder(guerrero)}
}//@lo mismo de bendicion

class CotaDeMalla{
	var unidadLucha
	constructor(nuevaUnidad){
		unidadLucha= nuevaUnidad
	}
	method poder(guerrero){ return unidadLucha }
	
	method precio(valorBase,guerrero){return unidadLucha/2}
}

object nada{
	method poder(guerrero){ return 0 }
	
	method precio(valorBase,guerrero){return 2}
	
	method valor(guerrero){ return 0 }
	}
///////////