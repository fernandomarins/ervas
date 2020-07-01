//
//  Erva.swift
//  Ervas
//
//  Created by Fernando Augusto de Marins on 28/06/20.
//  Copyright © 2020 Fernando Augusto de Marins. All rights reserved.
//

import Foundation

struct Erva {
    var categoria: String
    var id: String
    var nome: String
    var nomeFarmacologico: String
    var nomeCientifico: String
    var parteUtilizada: [String: AnyObject]
    var propriedades: [String: AnyObject]
    var locaisAcao: [String: AnyObject]
    var funcoes: [String: AnyObject]
    var precaucoes: String
    var doses: String
    var toxidez: String
    
    init(erva: NSDictionary) {
        if erva.object(forKey: "categoria") != nil {
            categoria = erva.object(forKey: "categoria") as! String
        } else {
            categoria = ""
        }
        
        if erva.object(forKey: "id") != nil {
            id = erva.object(forKey: "id") as! String
        } else {
            id = ""
        }
        
        if erva.object(forKey: "nome") != nil {
            nome = erva.object(forKey: "nome") as! String
        } else {
            nome = ""
        }
        
        if erva.object(forKey: "nomeFarmacologico") != nil {
            nomeFarmacologico = erva.object(forKey: "nomeFarmacologico") as! String
        }  else {
            nomeFarmacologico = ""
        }
        
        if erva.object(forKey: "nomeCientifico") != nil {
            nomeCientifico = erva.object(forKey: "nomeCientifico") as! String
        } else {
            nomeCientifico = ""
        }
        
        if erva.object(forKey: "parteUtilizada") != nil {
            parteUtilizada = erva.object(forKey: "parteUtilizada") as! [String: AnyObject]
        }  else {
            parteUtilizada = [:]
        }
        
        if erva.object(forKey: "propriedades") != nil {
            propriedades = erva.object(forKey: "propriedades") as! [String: AnyObject]
        }   else {
            propriedades = [:]
        }
        
        if erva.object(forKey: "locaisAcao") != nil {
            locaisAcao = erva.object(forKey: "locaisAcao") as! [String: AnyObject]
        }   else {
            locaisAcao = [:]
        }
        
        if erva.object(forKey: "funcoes") != nil {
            funcoes = erva.object(forKey: "funcoes") as! [String: AnyObject]
        }   else {
            funcoes = [:]
        }
        
        if erva.object(forKey: "precaucoes") != nil {
            precaucoes = erva.object(forKey: "precaucoes") as! String
        }  else {
            precaucoes = ""
        }
        
        if erva.object(forKey: "doses") != nil {
            doses = erva.object(forKey: "doses") as! String
        }  else {
            doses = ""
        }
        
        if erva.object(forKey: "toxidez") != nil {
            toxidez = erva.object(forKey: "toxidez") as! String
        }  else {
            toxidez = ""
        }
        
    }
}

// https://www.avanderlee.com/swift/json-parsing-decoding/
//
//struct Erva: Codable {
//    enum Propriedades: String, Codable {
//        case Amargo, Doce, Salgado, Neutro, Amornante, Refrescante
//    }
//
//    enum LocaisAcao: String, Codable {
//        case Pulmao, Bexiga, Rim, Baco, IntestinoGrosso
//    }
//
//        let nome: String
//        let categoria: Int
//        let id: Int
//        let nomeFarmacologico: String
//        let nomeCientifico: String
//        let parteUtilizada: String
//        let propriedades: Propriedades
//        let locaisAcao: LocaisAcao
//        let funcoes: String
//        let precaucoes: String?
//        let doses: String
//        let toxidez: String?
//}
