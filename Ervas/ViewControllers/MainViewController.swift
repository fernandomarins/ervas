//
//  MainViewController.swift
//  Ervas
//
//  Created by Fernando Augusto de Marins on 28/06/20.
//  Copyright © 2020 Fernando Augusto de Marins. All rights reserved.
//

import UIKit
import FirebaseDatabase

class MainViewController: UITableViewController {
    
    // Criando o UISearchController
    // https://www.iosapptemplates.com/blog/ios-programming/uisearchcontroller-swift
    let s = UISearchController(searchResultsController: nil)
    // Array com os valores filtrados
    var filteredHerbs: [Erva] = []
    var ref: DatabaseReference?
    var databaseHandle: DatabaseHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        
        databaseHandle = ref?.child("ervas").observe(.childAdded, with: { (snapshot) in
            
            if let allErvas = snapshot.value as? NSDictionary {
                let erva = Erva(erva: allErvas)
                ErvasList.herbsList.append(erva)
                self.tableView.reloadData()
            }
        })
        
        // 1
        s.searchResultsUpdater = self
        // 2
        s.obscuresBackgroundDuringPresentation = false
        // 3
        s.searchBar.placeholder = "Buscar..."
        
        s.searchBar.sizeToFit()
    
        // 4
        navigationItem.searchController = s
        // 5
        definesPresentationContext = true
        
        navigationItem.searchController = s
                
        navigationItem.title = "MATÉRIA MÉDICA"
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Se estiver filtrando, retornar o array com o filtro ativo
        if isFiltering() {
            return filteredHerbs.count
        }
        return ErvasList.herbsList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
         
        let currentHerb: Erva
        // Se tiver filtrando, retornar o indexPath.row filtrado
        if isFiltering() {
            currentHerb = filteredHerbs[indexPath.row]
        } else {
        // Fetch herb
            currentHerb = ErvasList.herbsList[indexPath.row]
        }
        
        // Configure Cell
        cell.nome?.text = currentHerb.nome
        cell.locaisAcao?.text = getValuesFromDictionary(dicionario: currentHerb.locaisAcao as NSDictionary)
        cell.propriedades.text = getValuesFromDictionary(dicionario: currentHerb.propriedades as NSDictionary)
        
        return cell
    }
    

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(identifier: "detailVC") as! DisplayHerbViewController
        
        let currentHerb: Erva
        // Dar push na view correta
        if isFiltering() {
            currentHerb = filteredHerbs[indexPath.row]
            detailVC.herb = filteredHerbs[indexPath.row]
        } else {
            detailVC.herb = ErvasList.herbsList[indexPath.row]
        }
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func filteredContentForSearchText(search: String) {
        filteredHerbs = ErvasList.herbsList.filter({ (Erva) -> Bool in
            return Erva.nome.lowercased().contains(search.lowercased())
        })
        tableView.reloadData()
    }
    
    func isSearchBarEmpty() -> Bool {
        return s.searchBar.text?.isEmpty ?? true
    }
    
    func isFiltering() -> Bool {
        let seachBarScopeIsFiltering = s.searchBar.selectedScopeButtonIndex != 0
        return s.isActive && (!isSearchBarEmpty()) || seachBarScopeIsFiltering
    }

}

extension MainViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    // Mostra os valores que estão sendo buscados
    filteredContentForSearchText(search: s.searchBar.text!)
  }
}
