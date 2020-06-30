//
//  AddViewController.swift
//  Ervas
//
//  Created by Fernando Augusto de Marins on 30/06/20.
//  Copyright © 2020 Fernando Augusto de Marins. All rights reserved.
//

import UIKit

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
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        subscribeTokeyboardNotification()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unSubscribeTokeyboardNotification()
    }
    
    func subscribeTokeyboardNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func unSubscribeTokeyboardNotification(){
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardWillShow(_ notification :Notification) {
        if funcoesTextField.isFirstResponder || contraIndicacaoTextField.isFirstResponder || dosesTextField.isFirstResponder || toxidadeTextField.isFirstResponder {
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

extension UIViewController: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
