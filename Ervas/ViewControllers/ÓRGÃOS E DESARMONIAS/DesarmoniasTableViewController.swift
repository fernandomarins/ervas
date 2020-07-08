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
    var isQiXueJinYe: Bool?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "DESARMONIAS"
        
        let backButton = UIBarButtonItem(title: "DESARMONIAS", style: .plain, target: nil, action: nil)
        backButton.tintColor = .white
        // Trocando nome do back buttom da view que será pushed
        navigationItem.backBarButtonItem = backButton
        
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
        cell.textLabel?.numberOfLines = 0

        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        desarmoniaSelected = desarmonias[indexPath.row]
        performSegue(withIdentifier: "toTratamento", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tratamentoVC = segue.destination as? TratamentoViewController
        if isQiXueJinYe! {
            tratamentoVC?.shouldChange = true
        } else {
            tratamentoVC?.shouldChange = false
        }
        tratamentoVC?.padrao = desarmoniaSelected
    }
    
    // Retorna um array contendo as desarmonias dependendo do orgao selecionado
    func setDesarmonias(orgao: String) -> [String] {
        var listaDesarmonias: [String] = []
        let defRins = ["Deficiência da Essência dos Rins", "Deficiência do Yang dos Rins", "Deficiência do Yin dos Rins"]
        let defBexiga = ["Umidade-Calor na Bexiga"]
        let defBP = ["Deficiência de Qi do Baço-Pâncreas", "Deficiência de Yang do Baço Pâncreas", "Qi do Baço Não Governa Sangue", "Desmoronamento do Qi do Baço", "Invasão do Baço pelo Frio e Umidade", "Umidade-Calor Acumulada no Baço", "Mucosidade Turva Estorva a Cabeça"]
        let defEstomago = ["Retenção de Líquidos no Estômago Devido ao Frio", "Retenção de Líquidos no Estômago", "Deficiência de Yin do Estômago", "Fogo no Estômago", "Estagnação de Sangue no Estômago"]
        let defFigado = ["Estagnação de Qi do Fígado", "Estagnação de Frio no Meridiano do Fígado", "Estagnação de Sangue no Fígado", "Deficiência de Sangue no Fígado", "Elevação de Yang do Fígado", "Fogo Crescente no Fígado", "Agitação do Vento no Fígado", "Umidade-Calor no Fígado e Vesícula Biliar"]
        let defVB = ["Qi da Vesícula Biliar Deficiente"]
        let defCoracao = ["Qi do Coração Deficiente", "Yang do Coração Deficiente", "Sangue do Coração Estagnante", "Sangue do Coração Deficiente", "Yin do Coração Deficiente", "Fogo Crescente no Coração", "Mucosidade-Fogo Agitando o Coração", "Mucosidade-Frio Estorvando o Coração"]
        let defID = ["Qi do Intestino Delgado Obstruído", "Calor Excessivo no Intestino Delgado"]
        let defPulmao = ["Deficiência de Qi no Pulmão", "Deficiência de Yin do Pulmão", "Secura no Pulmão", "Invasão do Pulmão pelo Vento-Frio", "Invasão do Pulmão pelo Vento-Calor", "Retenção de Mucosidade no Pulmão"]
        let defIG = ["Abcesso Intestinal - Intestino Grosso", "Umidade-Calor Invadindo o Intestino Grosso", "Prisão de Ventre e Diarréia - Intestino Grosso"]
        let defSindromes = ["Síndrome Bi-Frio", "Síndrome Bi-Calor", "Síndrome Bi-Umidade", "Síndrome Bi-Vento", "Síndrome Bi-Óssea"]
        let defXueQiJinYe = ["Vazio de Qi", "Demoronamento de Qi", "Estagnação de Qi", "Qi Contracorrente ou Insubmissa", "Vazio de Xue", "Estagnação de Xue", "Calor no Xue", "Deficiência de Jin Ye", "Estagnação do Jin Ye"]
        switch orgao {
        case "Rins":
            listaDesarmonias = defRins
        case "Bexiga":
            listaDesarmonias = defBexiga
        case "Baço-Pâncreas":
            listaDesarmonias = defBP
        case "Estômago":
            listaDesarmonias = defEstomago
        case "Fígado":
            listaDesarmonias = defFigado
        case "Vesícula Biliar":
            listaDesarmonias = defVB
        case "Coração":
            listaDesarmonias = defCoracao
        case "Intestino Delgado":
            listaDesarmonias = defID
        case "Pulmão":
            listaDesarmonias = defPulmao
        case "Intestino Grosso":
            listaDesarmonias = defIG
        case "Síndromes Bi":
            listaDesarmonias = defSindromes
        case "Qi, Xue e Jin Ye":
            listaDesarmonias = defXueQiJinYe
        default:
            listaDesarmonias = [""]
        }
        return listaDesarmonias
    }

}
