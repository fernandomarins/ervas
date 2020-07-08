//
//  OrgaosTableViewController.swift
//  Ervas
//
//  Created by Fernando Augusto de Marins on 03/07/20.
//  Copyright © 2020 Fernando Augusto de Marins. All rights reserved.
//

import UIKit

class OrgaosTableViewController: UITableViewController {
    
    let arrayOfOrgaos = ["Qi, Xue e Jin Ye", "Rins", "Bexiga", "Baço-Pâncreas", "Estômago", "Fígado", "Vesícula Biliar",
    "Coração", "Intestino Delgado", "Pulmão", "Intestino Grosso", "Síndromes Bi"]
    
    var orgaoSelected: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ÓRGÃOS"
        
        let backButton = UIBarButtonItem(title: "ÓRGÃOS", style: .plain, target: nil, action: nil)
        backButton.tintColor = .white
        // Trocando nome do back buttom da view que será pushed
        navigationItem.backBarButtonItem = backButton
    }

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
        if orgaoSelected == "Qi, Xue e Jin Ye" {
            desarmoniasVC?.isQiXueJinYe = true
        } else {
            desarmoniasVC?.isQiXueJinYe = false
        }
        desarmoniasVC?.orgao = orgaoSelected
    }

}
