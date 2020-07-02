//
//  AddViewController.swift
//  Ervas
//
//  Created by Fernando Augusto de Marins on 30/06/20.
//  Copyright © 2020 Fernando Augusto de Marins. All rights reserved.
//

import UIKit
import FirebaseDatabase

class AddViewController: UIViewController {

    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var nomeFTextField: UITextField!
    @IBOutlet weak var nomeCTextField: UITextField!
    @IBOutlet weak var partesTextField: UITextField!
    @IBOutlet weak var propriedadesTextField: UITextField!
    @IBOutlet weak var locaisAcaoTextField: UITextField!
    @IBOutlet weak var funcoesTextField: UITextField!
    @IBOutlet weak var contraIndicacaoTextField: UITextField!
    @IBOutlet weak var dosesTextField: UITextField!
    @IBOutlet weak var toxidadeTextField: UITextField!
    @IBOutlet weak var sentToDataBaseButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var categoriaTextField: UITextField!
    @IBOutlet weak var idTextField: UITextField!
    
    
    var ref: DatabaseReference?
    let pathToDataBase = "ervas"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        subscribeTokeyboardNotification()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unSubscribeTokeyboardNotification()
    }
    
    @IBAction func sentToDataBase(_ sender: Any) {
        
        // Pegando o texto dos textfields
        let partes = separateStrings(partesTextField.text!)
        let propriedades = separateStrings(propriedadesTextField.text!)
        let locais = separateStrings(locaisAcaoTextField.text!)
        let funcoes = separateStrings(funcoesTextField.text!)
        
        // Criando o payload para enviar para o database
        let payLoad = ["nome": nomeTextField.text ?? "", "nomeFarmacologico": nomeFTextField.text ?? "", "nomeCientifico": nomeCTextField.text ?? "", "parteUtilizada": partes, "propriedades": propriedades, "locaisAcao": locais, "funcoes": funcoes, "precaucoes": contraIndicacaoTextField.text ?? "", "doses": dosesTextField.text ?? "", "toxidez": toxidadeTextField.text ?? "", "categoria": categoriaTextField.text ?? "", "id": idTextField.text ?? ""] as [String : Any]
        
        // Enviando para o database, colocando o child como o id
        ref?.child(pathToDataBase).child(idTextField.text!).setValue(payLoad)
        
    }
    
    // Method to return a dictionary with separated values
    private func separateStrings(_ text: String) -> [String: String] {
        // Separando o texto num array
        let separated = text.components(separatedBy: ";")
        var separatedCapitalized = [String]()
        for text in separated {
            // Colocando a primeira letra maiúsculo
            separatedCapitalized.append(text.capitalizingFirstLetter())
        }
        // Dicionário que vai armazenar a informação
        var dic: [String: String] = [:]
        // Vou iterar para adicionar os valores e as chaves em número crescente
        for number in stride(from: 0, to: separated.count, by: 1) {
            dic["parte\(number)"] = separatedCapitalized[number]
        }
        return dic
    }
    
    func subscribeTokeyboardNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func unSubscribeTokeyboardNotification(){
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardWillShow(_ notification :Notification) {
        // Somente levando a view para cima se estiver usando os dois textfields de baixo
        if dosesTextField.isFirstResponder || toxidadeTextField.isFirstResponder {
            view.frame.origin.y = -getKeyboardHight(notification: notification)
        }
    }
    
    @objc func keyboardWillHide(_ notification :Notification){
        view.frame.origin.y = 0
    }
    
    func getKeyboardHight(notification : Notification)->CGFloat{
        let Userinfo = notification.userInfo
        let keyboardSize = Userinfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue
        return keyboardSize.cgRectValue.height
    }

}
