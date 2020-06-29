//
//  MainViewController.swift
//  Ervas
//
//  Created by Fernando Augusto de Marins on 28/06/20.
//  Copyright © 2020 Fernando Augusto de Marins. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {
    
    // Criando o UISearchController
    let s = UISearchController(searchResultsController: nil)
    // Array com os valores filtrados
    var filteredHerbs: [Erva] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addToDataBase()
        
        // 1
        s.searchResultsUpdater = self
        // 2
        s.obscuresBackgroundDuringPresentation = false
        // 3
        s.searchBar.placeholder = "Ervas..."
        
        s.searchBar.sizeToFit()
        s.searchBar.scopeButtonTitles = ["ÓRGÃO"]
    
        // 4
        navigationItem.searchController = s
        // 5
        definesPresentationContext = true
        
        navigationItem.searchController = s
        
        s.searchBar.delegate = self
        
//        tableView.separatorColor = UIColor.FlatColor.Green.PersianGreen
        
//        if let nav = navigationController {
//            nav.navigationBar.barTintColor = UIColor.FlatColor.Green.PersianGreen
//            nav.navigationBar.isTranslucent = true
//            nav.navigationBar.barStyle = .black
//            nav.navigationBar.titleTextAttributes = [
//                .foregroundColor: UIColor.FlatColor.Green.PersianGreen,
//                .font: UIFont(name: "MarkerFelt-Thin", size: 20)!
//            ]
//        }
        navigationItem.title = "MATÉRIA MÉDICA"
        
    }
    
    func addToDataBase() {
        // Adicionando a erva no banco de dados
        addHerbs(name: "MA HUANG - ÉFEDRA", nomeF: "Herba Ephedra", nomeC: "Ephedra sinica Stapf", parte: "Partes aéreas", prop: "Picante, Amarga, Amornante", local: "Bexiga, Pulmão", funcao: "Elimina o Frio Exterior por Sudorificação: Empregada para padrões de Vento-Frio com febre baixa, calafrios, ausência de sudorese, cefaléia e pulso superficial. Particularmente efetiva quando a sudorese é difícil; \n\nElimina Frio, aquece o Pulmão e redireciona o Qi para baixo: Para padrões de penetração de Vento-Frio no Pulmão com tosse, chieira, dispnéia e expectoração clara. Pode ser empregada em casos de Fleuma-Frio gerando tosse e expectoração no Pulmão. Clinicamente indicada em Asma Brônquica; \n\nElimina Frio Patogênico e Abre os Orifícios: Para padrões de Frio obstruindo o nariz com congestão nasal, espirros e coriza aquosa.", precau: "Contra-indicada em uso prolongado.", dose: "2 a 6g em decocção, 500 a 1000 mg", toxidez: "Intoxicação por efedrina causa hipertemia, sudorese, dor epigástrica, náuseas, vômitos, etc, contudo não há relatos de intoxicação com decocção. Herba Ephedra não deve ser usada em pacientes com arritmias agudas, e pacientes com hipertrofia de próstata.")
        
        addHerbs(name: "GUI ZHI - RAMOS DE CANELA", nomeF: "Ramullus Cinnamomii", nomeC: "Cinnamomum cassia Blume", parte: "Ramos", prop: "Picante, Doce, Amornante", local: "Pulmão, Coração, Bexiga", funcao: "Elimina o Frio do Exterior por Sudorificação: Em febre baixa , calafrios, cefaléia e língua com saburra branca. Muito indicada em deficiência do Qi Defensivo (Wei Qi); \n\nRegula O Qi Defensivo (Wei Qi): Para padrões de ataques sucessivos de Frio no exterior, ou quando a doença de Frio não melhora, apesar do paciente estar suando; \n\nAmorna os Canais (Meridianos) e Desfaz Obstruções: Para padrões onde Vento-Frio e Umidade estão obstruindo os Meridianos causando síndrome BI com dores articulares, aversão ao Vento-Frio e dificuldade para mover as juntas; Particularmente efetiva para síndrome BI dos ombros (ombro congelado). Direciona o efeito das ervas para o sistema de Meridianos (Canais) ou para o Exterior; \n\nPromove a Circulação de Qi do Tórax (Zhong Qi) e reforça o Yang do Coração: Para padrões de deficiência do Yang do Coração com palpitações, edema de membros inferiores e dispnéia ou sangue congelado obstruindo o Qi do Coração, como angina pectoris, palpitações e língua purpúrea; \n\nAmorna os Meridianos, Move o Qi e Desfaz os Edemas por Frio: Para edemas por acúmulo do Frio e Umidade.", precau: "Nenhuma.", dose: "6 a 10 g em decocção, 500 a 1000 mg, até 180 gotas", toxidez: "Nenhuma.")
        
        addHerbs(name: "SHENG JIANG - GENGIBRE FRESCO", nomeF: "Rhizoma Zingiberis Recens", nomeC: "Zingiber officinale Rosc", parte: "Raiz fresca", prop: "Picante, Amornante", local: "Pulmão, Estômago, Baço", funcao: "Elimina o Frio do Exterior por Sudorificação: Em febre baixa, aversão ao Frio, coriza aquosa e pouca ou nenhuma sudorese. Indicado em Frio penetrando no Pulmão causando tosse com expectoração branca; \n\nAquece o Aquecedor Médio e Redireciona o Qi para Baixo: E anorexia, digestão lenta, desejo de líquidos quentes, aversão a gelados, dor no estômago e língua com saburra branca. Particularmente indicado se o Frio causa perversão do Qi do Estômago com náuseas, enjôos, vômitos ou regurgitação de fluído claro; \n\nElimina o Vento-Frio e Aquece o Pulmão: Usado para tosse com expectoração mucóide clara, tanto em situações agudas por penetração de Vento-Frio, como em situações crônicas por acúmulo de Fleuma (Muco) no Pulmão; \n\nHarmoniza as Ervas e Desintoxica: Usado nas fórmulas para harmonizar as ervas e em intoxicações. Particularmente indicado em intoxicações por Acônito, Ban Xia (Pinelia) , carne de peixe ou caranguejo estragadas e cogumelos venenosos; \n\nRegula o Nível Defensivo (Wei Qi): Usado em casos de penetração de Qi Patogênico em pacientes com deficiência do Wei Qi, com sudorese contínua junto com agravamento dos sintomas.", precau: "Nenhuma.", dose: "3 a 10g em decocção, até 45 gotas", toxidez: "Nenhuma.")
        
        addHerbs(name: "YAN SUI ZI – COENTRO", nomeF: "Coriandri Fructus", nomeC: "Coriandrum sativum L", parte: "Semente", prop: "Picante, Amornante", local: "Pulmão, Estômago, Intestino Grosso", funcao: " Elimina Vento-Frio do Exterior por Sudorificação: Em febres, calafrios, pouca sudorese, pulso tenso; particularmente indicada em cefaléias, com rigidez de nuca e aversão ao Vento (tipo Torcicolo por ataque de Vento-Frio); \n\nDominaoVento:ComoervaauxiliarparacontrolaroVentoInternoeExterno,emcasosde tremores, tiques nervosos, trismo, bruxismo, espasmos musculares, tétano, rigidez de nuca; \n\nHarmoniza o Fígado e o Baço: Em Agressões da Madeira à Terra, gerando dor abdminal, diarréia com sangue vivo nas fezes, alterações digestivas acompanhadas de cefaléia temporal.", precau: "Nenhuma.", dose: "3 a 10 g; 600 a 1200mg", toxidez: "Nenhuma.")
    }

    
    // Função para criar uma nova erva no banco de dados
    func addHerbs(name: String, nomeF: String, nomeC: String, parte: String, prop: String, local: String, funcao: String, precau: String, dose: String, toxidez: String) {
        var herb1 = Erva()
        herb1.nome = name
        herb1.nomeFarmacologico = nomeF
        herb1.nomeCientifico = nomeC
        herb1.parteUtilizada = parte
        herb1.propriedades = prop
        herb1.locaisAcao = local
        herb1.funcoes = funcao
        herb1.precaucoes = precau
        herb1.doses = dose
        herb1.toxidez = toxidez
        // Adiciona no array principal
        ErvasList.herbsList.append(herb1)
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
        cell.locaisAcao?.text = currentHerb.locaisAcao
        cell.propriedades.text = currentHerb.propriedades
        
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
    
    func filteredContentForSearchText(search: String, scope: String = "Todas") {
        filteredHerbs = ErvasList.herbsList.filter({ (erva: Erva) -> Bool in
            // Colocar aqui os valores a serem buscados, || operador é OR
            let doesCategoryMatch = (scope == "Todas") || (erva.propriedades == scope) || (erva.locaisAcao == scope)

            if isSearchBarEmpty() {
                return doesCategoryMatch
            } else {
                // Returning the doesCategoryMatch AND the properties OR the órgão
                return doesCategoryMatch && erva.propriedades.lowercased().contains(search.lowercased()) ||  erva.locaisAcao.lowercased().contains(search.lowercased())
            }
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
    let searchBar = s.searchBar
    let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
    
    print(scope)
    
    filteredContentForSearchText(search: s.searchBar.text!, scope: scope)
  }
}

extension MainViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filteredContentForSearchText(search: searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
}
