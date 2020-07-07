//
//  MainViewController.swift
//  Ervas
//
//  Created by Fernando Augusto de Marins on 28/06/20.
//  Copyright © 2020 Fernando Augusto de Marins. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ErvasViewController: UITableViewController {
    
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
        
        // Uncomment a próxima linha quando tiver lançado o aplicativo, para sumir o botão de adicionar erva
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(openPadroes))
        
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
        
        let backButton = UIBarButtonItem(title: "MATÉRIA MÉDICA", style: .plain, target: nil, action: nil)
        backButton.tintColor = .white
        // Trocando nome do back buttom da view que será pushed
        navigationItem.backBarButtonItem = backButton
        
    }
    
    // MARK: DELEGATE METHODS
    
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
        cell.locaisAcao?.text = getValuesFromDictionary(dicionario: currentHerb.locaisAcao as NSDictionary, funcoes: false)
        cell.categoria.text = displayCategory(erva: currentHerb)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(identifier: "detailVC") as! DisplayHerbViewController
        
        let currentHerb: Erva?
        // Dar push na view correta
        if isFiltering() {
            currentHerb = filteredHerbs[indexPath.row]
            detailVC.herb = filteredHerbs[indexPath.row]
        } else {
            detailVC.herb = ErvasList.herbsList[indexPath.row]
        }
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    // MARK: CUSTOM METHODS
    
    // Método para mostrar a categoria das ervas
    func displayCategory(erva: Erva) -> String {
        var categoria = ""
        switch erva.categoria {
        case "01":
            categoria = "Ervas Sudoríficas Amornantes"
        case "02":
            categoria = "Ervas Sudoríficas Refrescantes"
        case "03":
            categoria = "Ervas que Transformam a Fleuma-Calor"
        case "04":
            categoria = "Ervas que Transformam a Fleuma-Frio"
        case "05":
            categoria = "Ervas que Aliviam a Tosse e a Dispnéia"
        case "06":
            categoria = "Ervas que Eliminam o Calor Intenso"
        case "07":
            categoria = "Ervas que Refrescam o Calor no Sangue"
        case "08":
            categoria = "Ervas que Eliminam o Calor e Drenam a Umidade"
        case "09":
            categoria = "Ervas que Eliminam Calor e Toxinas"
        case "10":
            categoria = "Ervas que Drenam o Calor de Verão"
        case "11":
            categoria = "Ervas que Drenam a Umidade"
        case "12":
            categoria = "Ervas Anti-Reumáticas que Eliminam o Vento e a Umidade"
        case "13":
            categoria = "Ervas que Aquecem o Interior e Expulsam o Frio"
        case "14":
            categoria = "Ervas Aromáticas que Transformam a Umidade"
        case "15":
            categoria = "Ervas que Aliviam a Estagnação de Alimentos"
        case "16":
            categoria = "Laxativos Suaves"
        case "17":
            categoria = "Laxativos que Purgam o Calor"
        case "18":
            categoria = "Laxativos Drásticos"
        case "19":
            categoria = "Ervas que Promovem a Circulação de Qi (Energia)"
        case "20":
            categoria = "Ervas Hemostáticas"
        case "21":
            categoria = "Ervas que Promovem a Circulação de Sangue"
        case "22":
            categoria = "Ervas Aromáticas que Abrem Orifícios"
        case "23":
            categoria = "Substâncias que Acalmam o Espírito"
        case "24":
            categoria = "Ervas que Nutrem o Coração e Acalmam o Espírito"
        case "25":
            categoria = "Substâncias Anticonvulsivas que Controlam o Vento do Fígado"
        case "26":
            categoria = "Ervas Tônicas do Qi"
        case "27":
            categoria = "Ervas Tônicas do Sangue"
        case "28":
            categoria = "Ervas Tônicas do Yang"
        case "29":
            categoria = "Ervas Tônicas do Yin"
        case "30":
            categoria = "Substâncias Adstringentes que Previnem as Perdas"
        case "31":
            categoria = "Ervas que Expelem Parasitos"
        case "32":
            categoria = "Substâncias para Uso Externo"
        default:
            categoria = ""
        }
        return categoria
    }
    
    // Filtrar as ervas
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

extension ErvasViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    // Mostra os valores que estão sendo buscados
    filteredContentForSearchText(search: s.searchBar.text!)
  }
}
