//
//  DesarmoniasTableViewController.swift
//  Ervas
//
//  Created by Fernando Augusto de Marins on 03/07/20.
//  Copyright © 2020 Fernando Augusto de Marins. All rights reserved.
//

import UIKit

class DesarmoniasTableViewController: UITableViewController {
    
    var desarmonias = [String]()
    var orgao: String = ""
    var desarmoniaSelected: String = ""
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        desarmonias.append(contentsOf: setDesarmonias(orgao: orgao))
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return desarmonias.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "desarmoniaCell", for: indexPath)
        
        cell.textLabel?.text = desarmonias[indexPath.row]

        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        desarmoniaSelected = desarmonias[indexPath.row]
        performSegue(withIdentifier: "toTratamento", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tratamentoVC = segue.destination as? TratamentoViewController
        tratamentoVC?.padrao = desarmoniaSelected
    }
    
    // Retorna um array contendo as desarmonias dependendo do orgao selecionado
    func setDesarmonias(orgao: String) -> [String] {
        var listaDesarmonias: [String] = []
        let defRins = ["Deficiência da Essência dos Rins", "Deficiência do Yang dos Rins", "Deficiência do Yin dos Rins"]
        switch orgao {
        case "Rins":
            listaDesarmonias = defRins
        default:
            listaDesarmonias = [""]
        }
        return listaDesarmonias
    }

}
