//
//  MoreInfoViewController.swift
//  Ervas
//
//  Created by Fernando Augusto de Marins on 28/06/20.
//  Copyright © 2020 Fernando Augusto de Marins. All rights reserved.
//

import UIKit

class MoreInfoViewController: UIViewController {
    
    @IBOutlet weak var precaucoes: UITextView?
    @IBOutlet weak var toxidez: UITextView?
    @IBOutlet weak var preocaucoesHC: NSLayoutConstraint?
    @IBOutlet weak var toxidezHC: NSLayoutConstraint?
    @IBOutlet weak var nomeFarmacologico: UILabel?
    @IBOutlet weak var parteUtilizada: UILabel?

    var herb: Erva!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nomeFarmacologico?.text = herb.nomeFarmacologico
        parteUtilizada?.text = ""//herb.parteUtilizada
        precaucoes?.text = herb.precaucoes
        preocaucoesHC?.constant = precaucoes!.contentSize.height
        
        toxidez?.text = herb.toxidez
        toxidezHC?.constant = toxidez!.contentSize.height

    }

}
