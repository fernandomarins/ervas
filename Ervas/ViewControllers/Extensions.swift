//
//  Extensions.swift
//  Ervas
//
//  Created by Fernando Augusto de Marins on 01/07/20.
//  Copyright © 2020 Fernando Augusto de Marins. All rights reserved.
//

import Foundation
// https://www.hackingwithswift.com/example-code/strings/how-to-capitalize-the-first-letter-of-a-string
extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
