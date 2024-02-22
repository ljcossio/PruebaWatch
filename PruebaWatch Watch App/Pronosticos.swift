//
//  Pronosticos.swift
//  PruebaWatch Watch App
//
//  Created by Luis Cossío on 10/12/23.
//

import Foundation

struct Pronosticos {
    var pronosticos: [String]
    
    init() {
        pronosticos = []
        
        pronosticos.append("Es cierto")
        pronosticos.append("Es decididamente así")
        pronosticos.append("Sin lugar a dudas")
        pronosticos.append("Sí, definitivamente")
        pronosticos.append("Puedes confiar en ello")
        pronosticos.append("Como yo lo veo, sí")
        pronosticos.append("Lo más probable")
        pronosticos.append("Perspectiva buena")
        pronosticos.append("Sí")
        pronosticos.append("Las señales apuntan a que sí")
        pronosticos.append("Respuesta confusa, vuelve a intentarlo")
        pronosticos.append("Vuelve a preguntar más tarde")
        pronosticos.append("Mejor no decirte nada ahora")
        pronosticos.append("No se puede predecir ahora")
        pronosticos.append("Concéntrate y vuelve a preguntar")
        pronosticos.append("No cuentes con ello")
        pronosticos.append("Mi respuesta es no")
        pronosticos.append("Mis fuentes dicen no")
        pronosticos.append("Las perspectivas no son muy buenas")
        pronosticos.append("Muy dudoso")
        pronosticos.append("Sí, pero ...")
    }
    
    func pitonisa() -> String {
        let numero: Int = Int.random(in: 0..<pronosticos.count)
        return pronosticos[numero]
        
    }
}
