//
//  Extensions.swift
//  Ervas
//
//  Created by Fernando Augusto de Marins on 01/07/20.
//  Copyright © 2020 Fernando Augusto de Marins. All rights reserved.
//

import Foundation
import UIKit
// https://www.hackingwithswift.com/example-code/strings/how-to-capitalize-the-first-letter-of-a-string
extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}

extension UIViewController: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension UIViewController {
    // Getting values from the dictionary and turning into a string to display in the cell
    func getValuesFromDictionary(dicionario: NSDictionary, funcoes: Bool) -> String {
        let dados = dicionario.allValues as! [String]
        if funcoes {
            return dados.joined(separator: " \n\n")
        } else {
            return dados.joined(separator:", ")
        }
    }
}
