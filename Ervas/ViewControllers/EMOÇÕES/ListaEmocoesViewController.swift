//
//  ListaEmocoesViewController.swift
//  Ervas
//
//  Created by Fernando Augusto de Marins on 09/07/20.
//  Copyright © 2020 Fernando Augusto de Marins. All rights reserved.
//

import Foundation
import UIKit
class ListaEmocoesViewController: UIViewController {

    let scrollView = UIScrollView()
    let contentView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "LISTA DE EMOÇÕES"
        setupScrollView()
        setupViews()
        textField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
        
    func setupScrollView(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }
    
    func setupViews(){
        
        contentView.addSubview(textField)
        textField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40).isActive = true
        textField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        textField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -140).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        contentView.addSubview(buttonAdd)
        buttonAdd.trailingAnchor.constraint(equalTo: textField.trailingAnchor, constant: 40).isActive = true
        buttonAdd.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40).isActive = true
        buttonAdd.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        contentView.addSubview(buttonRemove)
        buttonRemove.trailingAnchor.constraint(equalTo: buttonAdd.trailingAnchor, constant: 40).isActive = true
        buttonRemove.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40).isActive = true
        buttonRemove.heightAnchor.constraint(equalToConstant: 40).isActive = true

        contentView.addSubview(buttonClear)
        buttonClear.trailingAnchor.constraint(equalTo: buttonRemove.trailingAnchor, constant: 40).isActive = true
        buttonClear.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40).isActive = true
        buttonClear.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        contentView.addSubview(label)
        label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20).isActive = true
        label.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.89).isActive = true
        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    @objc func convertToEmotion() -> String {
        if let text = textField.text {
            var emocao = ""
            switch text {
            case "BP1":
                emocao = "REJEIÇÃO"
            default:
                emocao = "REJEIÇÃO"
            }
            
            print(emocao)
            return emocao
        }
        
        return ""
    }
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborumLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborumLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum..............co laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborumLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.............."
        label.numberOfLines = 0
        label.sizeToFit()
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        return label
    }()
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "ÓRGÃO + NÚMERO"
        textField.borderStyle = .none
        textField.backgroundColor = .white
        textField.textColor = .black
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.alphabet
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.autocapitalizationType = .allCharacters
        textField.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        return textField
    }()
    
    let buttonAdd: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.FlatColor.Green.PersianGreen
        button.setTitle("+", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(convertToEmotion), for: .touchUpInside)
        return button
    }()
    
    let buttonRemove: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.FlatColor.Green.PersianGreen
        button.setTitle("-", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    let buttonClear: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.FlatColor.Green.PersianGreen
        button.setTitle("C", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
}
