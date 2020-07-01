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
    
    var receivedHerbs: [Erva] = []
    
    var ref: DatabaseReference?
    var databaseHandle: DatabaseHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        
        databaseHandle = ref?.child("ervas").observe(.childAdded, with: { (snapshot) in
            
            let allErvas = snapshot.value as? NSDictionary
            var erva = Erva(erva: allErvas!)
            
            print("Erviiinha \(erva)")
            print("All eeeervas \(allErvas)")
//            // take data from the snapshot and add it to ErvasList.herbsList
//            // snapshot.children.allObjects[0] access the first value
//            let Erva = snapshot.value
//            ErvasList.herbsList.append(Erva.init())
        })
        
//        addToDataBase()
        
        // How to display all data
//        ref?.child("database").observeSingleEvent(of: .value, with: { (snapshot) in
//            var erva = Erva()
//            if let data = snapshot.children.allObjects as? Dictionary {
//
//            }
//            for value in snapshot.children.allObjects as? Dictionary {
//                erva.nome = value
//            if let data = snapshot.children.allObjects as? NSDictionary {
//            if let data = snapshot.value as? NSDictionary {
//                print(data.allValues)
                
//                var _ = data.allValues
//                for (value) in data.allValues {
//                    if let valores = data.object(forKey: "ervas") {
//                        for valor in valores {
//
//                        }
//                    }
//                    erva.nome = allData.object(forKey: "nome") as! String
//                    print(value.value) // printa os valores que quero
//                    self.receivedHerbs.append(erva)
//                    self.receivedHerbs.updateValue(value as? String, forKey: data.allKeys(for: value))
//                }
//            }
//            }
//        }
        
//        print(receivedHerbs)
        
        // 1
        s.searchResultsUpdater = self
        // 2
        s.obscuresBackgroundDuringPresentation = false
        // 3
        s.searchBar.placeholder = "Buscar..."
        
        s.searchBar.sizeToFit()

//        s.searchBar.scopeButtonTitles = ["SABOR OU ÓRGÃO"]
    
        // 4
        navigationItem.searchController = s
        // 5
        definesPresentationContext = true
        
        navigationItem.searchController = s
        
//        s.searchBar.delegate = self
        
        navigationItem.title = "MATÉRIA MÉDICA"
        
    }
    
//    func addToDataBase() {
//        // Adicionando a erva no banco de dados
//        addHerbs(name: "MA HUANG - ÉFEDRA", nomeF: "Herba Ephedra", nomeC: "Ephedra sinica Stapf", parte: "Partes aéreas", prop: "Picante, Amarga, Amornante", local: "Bexiga, Pulmão", funcao: "Elimina o Frio Exterior por Sudorificação: Empregada para padrões de Vento-Frio com febre baixa, calafrios, ausência de sudorese, cefaléia e pulso superficial. Particularmente efetiva quando a sudorese é difícil; \n\nElimina Frio, aquece o Pulmão e redireciona o Qi para baixo: Para padrões de penetração de Vento-Frio no Pulmão com tosse, chieira, dispnéia e expectoração clara. Pode ser empregada em casos de Fleuma-Frio gerando tosse e expectoração no Pulmão. Clinicamente indicada em Asma Brônquica; \n\nElimina Frio Patogênico e Abre os Orifícios: Para padrões de Frio obstruindo o nariz com congestão nasal, espirros e coriza aquosa.", precau: "Contra-indicada em uso prolongado.", dose: "2 a 6g em decocção, 500 a 1000 mg", toxidez: "Intoxicação por efedrina causa hipertemia, sudorese, dor epigástrica, náuseas, vômitos, etc, contudo não há relatos de intoxicação com decocção. Herba Ephedra não deve ser usada em pacientes com arritmias agudas, e pacientes com hipertrofia de próstata.")
//
//        addHerbs(name: "GUI ZHI - RAMOS DE CANELA", nomeF: "Ramullus Cinnamomii", nomeC: "Cinnamomum cassia Blume", parte: "Ramos", prop: "Picante, Doce, Amornante", local: "Pulmão, Coração, Bexiga", funcao: "Elimina o Frio do Exterior por Sudorificação: Em febre baixa , calafrios, cefaléia e língua com saburra branca. Muito indicada em deficiência do Qi Defensivo (Wei Qi); \n\nRegula O Qi Defensivo (Wei Qi): Para padrões de ataques sucessivos de Frio no exterior, ou quando a doença de Frio não melhora, apesar do paciente estar suando; \n\nAmorna os Canais (Meridianos) e Desfaz Obstruções: Para padrões onde Vento-Frio e Umidade estão obstruindo os Meridianos causando síndrome BI com dores articulares, aversão ao Vento-Frio e dificuldade para mover as juntas; Particularmente efetiva para síndrome BI dos ombros (ombro congelado). Direciona o efeito das ervas para o sistema de Meridianos (Canais) ou para o Exterior; \n\nPromove a Circulação de Qi do Tórax (Zhong Qi) e reforça o Yang do Coração: Para padrões de deficiência do Yang do Coração com palpitações, edema de membros inferiores e dispnéia ou sangue congelado obstruindo o Qi do Coração, como angina pectoris, palpitações e língua purpúrea; \n\nAmorna os Meridianos, Move o Qi e Desfaz os Edemas por Frio: Para edemas por acúmulo do Frio e Umidade.", precau: "Nenhuma.", dose: "6 a 10 g em decocção, 500 a 1000 mg, até 180 gotas", toxidez: "Nenhuma.")
//
//        addHerbs(name: "SHENG JIANG - GENGIBRE FRESCO", nomeF: "Rhizoma Zingiberis Recens", nomeC: "Zingiber officinale Rosc", parte: "Raiz fresca", prop: "Picante, Amornante", local: "Pulmão, Estômago, Baço", funcao: "Elimina o Frio do Exterior por Sudorificação: Em febre baixa, aversão ao Frio, coriza aquosa e pouca ou nenhuma sudorese. Indicado em Frio penetrando no Pulmão causando tosse com expectoração branca; \n\nAquece o Aquecedor Médio e Redireciona o Qi para Baixo: E anorexia, digestão lenta, desejo de líquidos quentes, aversão a gelados, dor no estômago e língua com saburra branca. Particularmente indicado se o Frio causa perversão do Qi do Estômago com náuseas, enjôos, vômitos ou regurgitação de fluído claro; \n\nElimina o Vento-Frio e Aquece o Pulmão: Usado para tosse com expectoração mucóide clara, tanto em situações agudas por penetração de Vento-Frio, como em situações crônicas por acúmulo de Fleuma (Muco) no Pulmão; \n\nHarmoniza as Ervas e Desintoxica: Usado nas fórmulas para harmonizar as ervas e em intoxicações. Particularmente indicado em intoxicações por Acônito, Ban Xia (Pinelia) , carne de peixe ou caranguejo estragadas e cogumelos venenosos; \n\nRegula o Nível Defensivo (Wei Qi): Usado em casos de penetração de Qi Patogênico em pacientes com deficiência do Wei Qi, com sudorese contínua junto com agravamento dos sintomas.", precau: "Nenhuma.", dose: "3 a 10g em decocção, até 45 gotas", toxidez: "Nenhuma.")
//
//        addHerbs(name: "YAN SUI ZI – COENTRO", nomeF: "Coriandri Fructus", nomeC: "Coriandrum sativum L", parte: "Semente", prop: "Picante, Amornante", local: "Pulmão, Estômago, Intestino Grosso", funcao: " Elimina Vento-Frio do Exterior por Sudorificação: Em febres, calafrios, pouca sudorese, pulso tenso; particularmente indicada em cefaléias, com rigidez de nuca e aversão ao Vento (tipo Torcicolo por ataque de Vento-Frio); \n\nDominaoVento:ComoervaauxiliarparacontrolaroVentoInternoeExterno,emcasosde tremores, tiques nervosos, trismo, bruxismo, espasmos musculares, tétano, rigidez de nuca; \n\nHarmoniza o Fígado e o Baço: Em Agressões da Madeira à Terra, gerando dor abdminal, diarréia com sangue vivo nas fezes, alterações digestivas acompanhadas de cefaléia temporal.", precau: "Nenhuma.", dose: "3 a 10 g; 600 a 1200mg", toxidez: "Nenhuma.")
//
//        addHerbs(name: "FANG-FENG", nomeF: "Ledebouriellae Radix", nomeC: "Ledebouriella seseloides Woll", parte: "Raiz", prop: "Picante, Doce, Suave, Amornante", local: "Pulmão, Baço, Fígado, Bexiga", funcao: " Elimina Vento-Frio do Exterior por Sudorificação: Em febres, calafrios, pouca sudorese, pulso tenso; particularmente indicada em cefaléias, com rigidez de nuca e aversão ao Vento (tipo Torcicolo por ataque de Vento-Frio); \n\nDomina o Vento: como erva auxiliar para controlar o Vento Interno e Externo, em casos de tremores, tiques nervosos, trismo, bruxismo, espasmos musculares, tétano, rigidez de nuca; \n\nHarmoniza o Fígado e o Baço: Em Agressões da Madeira à Terra, gerando dor abdminal, diarréia com sangue vivo nas fezes, alterações digestivas acompanhadas de cefaléia temporal.", precau: "Nenhuma", dose: "3 a 10 g; 600 a 1200mg", toxidez: "Nenhuma.")
//    }
//
//
//    // Função para criar uma nova erva no banco de dados
//    func addHerbs(name: String, nomeF: String, nomeC: String, parte: String, prop: String, local: String, funcao: String, precau: String, dose: String, toxidez: String) {
//        var herb1 = Erva()
//        herb1.nome = name
//        herb1.nomeFarmacologico = nomeF
//        herb1.nomeCientifico = nomeC
//        herb1.parteUtilizada = parte
//        herb1.propriedades = prop
//        herb1.locaisAcao = local
//        herb1.funcoes = funcao
//        herb1.precaucoes = precau
//        herb1.doses = dose
//        herb1.toxidez = toxidez
//        // Adiciona no array principal
//        ErvasList.herbsList.append(herb1)
//    }
    
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
//        cell.nome?.text = currentHerb.nome
//        cell.locaisAcao?.text = currentHerb.locaisAcao
//        cell.propriedades.text = currentHerb.propriedades
        
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
