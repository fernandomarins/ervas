//
//  OrgaosTableViewController.swift
//  Ervas
//
//  Created by Fernando Augusto de Marins on 03/07/20.
//  Copyright © 2020 Fernando Augusto de Marins. All rights reserved.
//

import UIKit

class OrgaosTableViewController: UITableViewController {
    
    let arrayOfOrgaos = ["Rins", "Bexiga", "Baço-Pâncreas", "Estômago", "Fígado", "Vesícula Biliar",
    "Coração", "Intestino Delgado", "Pulmão", "Intestino Grosso"]
    
    var orgaoSelected: String = ""

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayOfOrgaos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellOrgao", for: indexPath)
        
        cell.textLabel?.text = arrayOfOrgaos[indexPath.row]

        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        orgaoSelected = arrayOfOrgaos[indexPath.row]
        performSegue(withIdentifier: "toDesarmonias", sender: self)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let desarmoniasVC = segue.destination as? DesarmoniasTableViewController
        desarmoniasVC?.orgao = orgaoSelected
    }

}
