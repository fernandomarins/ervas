//
//  DisplayHerb.swift
//  Ervas
//
//  Created by Fernando Augusto de Marins on 28/06/20.
//  Copyright © 2020 Fernando Augusto de Marins. All rights reserved.
//

import UIKit

class DisplayHerb: UIViewController {
    @IBOutlet weak var nome: UILabel?
    @IBOutlet weak var nomeFarmacologico: UILabel?
    @IBOutlet weak var nomeCientifico: UILabel?
    @IBOutlet weak var parteUtilizada: UILabel?
    @IBOutlet weak var propriedades: UILabel?
    @IBOutlet weak var locaisAcao: UILabel?
    @IBOutlet weak var funcoes: UITextView?
    @IBOutlet weak var precaucoes: UITextView?
    @IBOutlet weak var doses: UILabel?
    @IBOutlet weak var toxidez: UITextView?
    @IBOutlet weak var funcoesHC: NSLayoutConstraint?
    @IBOutlet weak var preocaucoesHC: NSLayoutConstraint?
    @IBOutlet weak var toxidezHC: NSLayoutConstraint?
    
    var herb: Erva!
    
    override func viewDidLoad() {
        nome?.text = herb.nome
        nomeFarmacologico?.text = herb.nomeFarmacologico
        nomeCientifico?.text = herb.nomeCientifico
        parteUtilizada?.text = herb.parteUtilizada
        propriedades?.text = herb.propriedades
        locaisAcao?.text = herb.locaisAcao
        funcoes?.text = herb.funcoes
        funcoesHC?.constant = funcoes!.contentSize.height
        precaucoes?.text = herb.precaucoes
        preocaucoesHC?.constant = precaucoes!.contentSize.height
        doses?.text = herb.doses
        toxidez?.text = herb.toxidez
        toxidezHC?.constant = toxidez!.contentSize.height
        
        setSizeToFit()
    }
    
    func setSizeToFit() {
        let list = [nome, nomeFarmacologico, nomeCientifico, parteUtilizada, propriedades, locaisAcao, funcoes, precaucoes, doses, toxidez]
        for list in list {
            list?.sizeToFit()
        }
    }
}
