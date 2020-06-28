//
//  MainViewController.swift
//  Ervas
//
//  Created by Fernando Augusto de Marins on 28/06/20.
//  Copyright © 2020 Fernando Augusto de Marins. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addHerbs(name: "MA HUANG - ÉFEDRA", nomeF: "Herba Ephedra", nomeC: "Ephedra sinica Stapf", parte: "Partes aéreas", prop: "Picante, Amarga, Amornante", local: "Bexiga, Pulmão", funcao: "Elimina o Frio Exterior por Sudorificação: Empregada para padrões de Vento-Frio com febre baixa, calafrios, ausência de sudorese, cefaléia e pulso superficial. Particularmente efetiva quando a sudorese é difícil; \n\nElimina Frio, aquece o Pulmão e redireciona o Qi para baixo: Para padrões de penetração de Vento-Frio no Pulmão com tosse, chieira, dispnéia e expectoração clara. Pode ser empregada em casos de Fleuma-Frio gerando tosse e expectoração no Pulmão. Clinicamente indicada em Asma Brônquica; \n\nElimina Frio Patogênico e Abre os Orifícios: Para padrões de Frio obstruindo o nariz com congestão nasal, espirros e coriza aquosa.", precau: "Contra-indicada em uso prolongado", dose: "2 a 6g em decocção, 500 a 1000 mg", toxidez: "Intoxicação por efedrina causa hipertemia, sudorese, dor epigástrica, náuseas, vômitos, etc, contudo não há relatos de intoxicação com decocção. Herba Ephedra não deve ser usada em pacientes com arritmias agudas, e pacientes com hipertrofia de próstata")
    }
    
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
        ErvasList.herbsList.append(herb1)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ErvasList.herbsList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
         
        // Fetch Fruit
        let erva = ErvasList.herbsList[indexPath.row]
         
        // Configure Cell
        cell.textLabel?.text = erva.nome
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(identifier: "detailVC") as! DisplayHerb
        detailVC.herb = ErvasList.herbsList[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }


}

