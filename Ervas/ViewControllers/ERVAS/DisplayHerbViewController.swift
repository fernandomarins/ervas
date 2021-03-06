//
//  DisplayHerbViewController.swift
//  Ervas
//
//  Created by Fernando Augusto de Marins on 28/06/20.
//  Copyright © 2020 Fernando Augusto de Marins. All rights reserved.
//

import UIKit

class DisplayHerbViewController: UIViewController {
    @IBOutlet weak var nome: UILabel?
    @IBOutlet weak var nomeCientifico: UILabel?
    @IBOutlet weak var propriedades: UILabel?
    @IBOutlet weak var locaisAcao: UILabel?
    @IBOutlet weak var funcoes: UITextView?
    @IBOutlet weak var doses: UILabel?
    @IBOutlet weak var funcoesHC: NSLayoutConstraint?
    
    var herb: Erva!
    
    override func viewDidLoad() {
        nome?.text = herb.nome
        nomeCientifico?.text = herb.nomeCientifico
        propriedades?.text = getValuesFromDictionary(dicionario: herb.propriedades as NSDictionary, funcoes: false)
        locaisAcao?.text = getValuesFromDictionary(dicionario: herb.locaisAcao as NSDictionary, funcoes: false)
        funcoes?.text = getValuesFromDictionary(dicionario: herb.funcoes as NSDictionary, funcoes: true)
        funcoesHC?.constant = funcoes!.contentSize.height
        doses?.text = herb.doses
        
        let backButton = UIBarButtonItem(title: "ERVA", style: .plain, target: nil, action: nil)
        backButton.tintColor = .white
        // Trocando nome do back buttom da view que será pushed
        navigationItem.backBarButtonItem = backButton
        
        setSizeToFit()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moreInfo" {
            let vc = segue.destination as! MoreInfoViewController
            vc.herb = herb
        }
    }
    
    func setSizeToFit() {
        let list = [nome, nomeCientifico, propriedades, locaisAcao, doses]
        for list in list {
            list?.lineBreakMode = .byWordWrapping
            list?.numberOfLines = 0
        }
    }
}
