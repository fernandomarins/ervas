//
//  EvalutationFormViewController.swift
//  Ervas
//
//  Created by Fernando Augusto de Marins on 07/07/20.
//  Copyright © 2020 Fernando Augusto de Marins. All rights reserved.
//

import Foundation
import UIKit

class EvaluationFormTableViewController: UITableViewController {
    
    //https://github.com/andreatoso/UIScrollView-Programmatically/blob/master/UIScrollView%20Programmatically/ViewController.swift MELHOR TUTORIAL SCROLLVIEW
    
    lazy var mySections: [SectionData] = {
        let section1 = SectionData(title: "Síndromes Bi", opcoes: "Frio (Piora com o Frio, com o gelo, com o repouso, sensação de Frio local)", "Calor (Piora com o Calor, com o Movimento, Calor local, vermelhidão, coceira)", "Umidade (Tez brilhante, urina amarelada, inchaço e dor local, dor fixa)", "Vento (Dores migratória, câimbras, tremores, sensibilidade ao Vento)", "Óssea (Princípio de deformação articular, inchaços persistentes, enfraquecimento generalizado)")
        let section2 = SectionData(title: "Sono", opcoes: "Insônia", "Delírio", "Excesso de sonhos e pesadelos", "Hipersônia")
        let section3 = SectionData(title: "Sede", opcoes: "Pouca sede", "Muita sede")
        let section4 = SectionData(title: "Urina", opcoes: "Turva e/ou começando a escurecer, muita espuma, muitas vezes no banheiro", "Urina escura, escassa, hematúria, areia na urina, urgência miccional, dor e ardência ao urinar", "Polaciúria, incontinência urinária, oligúria, edema, muita espuma, goteja c/ esforço")
        let section5 = SectionData(title: "Intestinos", opcoes: "Evacuações Ressecadas de Princípio a Fim e Escassas (2 em 2 dias ou mais)", "Evacuação rotineira com fezes pastosas, líquidas, quebradiças", "Fezes com tampão ressecado e pastoso a seguir", "Fezes com Mucos")
        let section6 = SectionData(title: "Térmica", opcoes: "Perfil friorento - frio nas mãos e pés, frio na barriga e região lombar, pernas, dorme encolhido", "Perfil calorento - mãos e pés quentes, se descobre para dormir, transpira muito", "Misto - mãos quentes e pés frios, mãos transpiram facilmente")
        let section7 = SectionData(title: "Menstruação", opcoes: "Adianta (8 a 10 dias)", "Atrasa (8 a 10 dias)", "Ora adianta, ora atrasa", "TPM com distensão abdominal, displasia mamária, irritabilidade, amenorréia, dismenorréia, pouco sangramento", "TPM com dismenorréia com sangramento escuro, coágulos, fisgadas na região do ovário no período ovulatório")
        let section8 = SectionData(title: "Corrimentos", opcoes: "Brancos ou transparentes, abundantes", "Amarelados, viscoso, malcheirosos, com pruridos", "Vermelhos, ininterruptos, leve odor", "Escuros, sensação de Frio na barriga e dolorimento lombar")
        let section9 = SectionData(title: "Digestão", opcoes: "Muitos gases, pouco apetite, distensão abdominal, instabilidade nas evacuações, ora com fezes uniformes, ora fezes soltas, sem componente emocional", "Diarréia matinal rotineira", "Muitos gases, perda de apetite, instabilidade nas evacuações, ora com fezes uniformes, ora fezes soltas, apenas quando ocorrem problemas emocionais", "Azia, aftas, queimação, boca e lábios secos", "Dor e sensação de Frio na região epigástrica, melhoradas pelo Calor, ausência de sede, vômito de líquidos claros (tipo água), ruídos na região epigástrica", "Arrotos de mau cheiro, regurgitações ácidas, fezes com muito mal cheiro", "Dor ardente no epigástrio, vômitos de líquidos azedos (Refluxo), dor, inchaço ou fragilidade capilar das gengivas com sangramentos fáceis, mau hálito, enxaqueca frontal", "Dor aguda com sensação de facada, com possível irradiação para a região dorsal, agravada pela pressão local, pela alimentação, evoluindo junto com a magreza, tez do rosto escurecendo, com possível hematêmese ou melena")
        let section10 = SectionData(title: "Sangue", opcoes: "Câimbras, tiques palpebrais, espasmos migratórios pelo corpo, Bruxismo, Enxaqueca Tensional, Trapézio Endurecido", "Tonteira ao se Levantar Rápido, Enxaqueca Difusa ao Final do Dia, Unhas Fracas, Queda de Cabelos, Manchas no Campo Visual, Histórico de Anemia em Exames de Sangue", "Aumento do Apetite no Período Menstrual, Metrorragia que vem diminuindo com o passar dos anos, Fraqueza no Período Menstrual")
        
        return [section1, section2, section3, section4, section5, section6, section7, section8, section9, section10]
    }()
    
    var checked = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsMultipleSelection = true
        tableView.allowsMultipleSelectionDuringEditing = true
        
        title = "FORMULÁRIO"
        
        let finish = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        finish.tintColor = .white
        
        navigationItem.rightBarButtonItem = finish
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        deselectAllItems()
        checked = []
    }
    
    @objc func done() {
        let vc = storyboard?.instantiateViewController(identifier: "ResultadosVC") as! ResultadosViewController
        vc.diagnosticos = checked
        presentOnRoot(with: vc)
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return mySections.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return mySections[section].title
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySections[section].numberOfItems
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = mySections[indexPath.section][indexPath.row]
        
        
        cell.selectionStyle = .none
        if let selectedRows = tableView.indexPathsForSelectedRows,
            selectedRows.contains(indexPath) {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        cell.textLabel?.numberOfLines = 0
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            switch indexPath {
            case [0, 0]:
                checked.append("Síndrome Bi-Frio")
            case [0, 1]:
                checked.append("Síndrome Bi-Calor")
            case [0, 2]:
                checked.append("Síndrome Bi-Umidade")
            case [0, 3]:
                checked.append("Síndrome Bi-Vento")
            case [0, 4]:
                checked.append("Síndrome Bi-Ósseo")
            case [1, 0]:
                checked.append("Deficiência de Xue e Yin do Coração e/ou Fogo")
            case [1, 1]:
                checked.append("Fogo Crescente no Coração")
            case [1, 2]:
                checked.append("Deficiência de Yin e/ou Xue do Coração")
            case [1, 3]:
                checked.append("Deficiência de Yang do Baço e/ou Rins")
            case [2, 0]:
                checked.append("Umidade-Frio no Baço")
            case [2, 1]:
                checked.append("Calor nos 3 Aquecedores e/ou Deficiência de Yin dos Rins")
            case [3, 0]:
                checked.append("Frio-Umidade no Baço e Rins")
            case [3, 1]:
                checked.append("Umidade-Calor na Bexiga")
            case [3, 2]:
                checked.append("Deficiência de Yang dos Rins")
            case [4, 0]:
                checked.append("Deficiência de Sangue do Fígado, Deficiência de Yin dos Rins e Intestinos e/ou Geral")
            case [4, 1]:
                checked.append("Deficiência de Yang do Baço")
            case [4, 2]:
                checked.append("Deficiência de Qi do Baço")
            case [4, 3]:
                checked.append("Calor-Umidade nos Intestinos - Importante Aprofundar nos Sinais")
            case [5, 0]:
                checked.append("Deficiência de Yang dos Rins")
            case [5, 1]:
                checked.append("Deficiência de Yin dos Rins)")
            case [5, 2]:
                checked.append("Estagnação do Qi do Fígado")
            case [6, 0]:
                checked.append("Deficiência de Yang do Baço")
            case [6, 1]:
                checked.append("Estagnação de Qi e Sangue do Fígado e Deficiência de Yang do Baço")
            case [6, 2]:
                checked.append("Estagnação de Qi e Sangue do Fígado e Deficiência de Yang do Baço e Rim")
            case [6, 3]:
                checked.append("Estagnação ou Depressão do Qi do Fígado")
            case [6, 4]:
                checked.append("Estagnação de Sangue do Fígado")
            case [7, 0]:
                checked.append("Deficiência de Yang do Baço e Acúmulo de Umidade")
            case [7, 1]:
                checked.append("Umidade-Calor na Bexiga e Genitais")
            case [7, 2]:
                checked.append("Calor-Umidade no Fígado e Vesícula Biliar")
            case [7, 3]:
                checked.append("Deficiência de Yang do Rim")
            case [8, 0]:
                checked.append("Deficiência de Qi do Baço")
            case [8, 1]:
                checked.append("Deficiência de Yang do Baço e do Rim")
            case [8, 2]:
                checked.append("Estagnação do Qi do Fígado")
            case [8, 3]:
                checked.append("Deficiência do Yin do Estômago")
            case [8, 4]:
                checked.append("Retenção de Líquidos no Estômago Devido ao Frio")
            case [8, 5]:
                checked.append("Retenção de Alimentos no Estômago")
            case [8, 6]:
                checked.append("Fogo no Estômago")
            case [8, 7]:
                checked.append("Estagnação de Sangue no Estômago")
            case [9, 0]:
                checked.append("Agitação do Vento do Fígado por Deficiência de Sangue")
            case [9, 1]:
                checked.append("Deficiência de Sangue do Fígado")
            case [9, 0]:
                checked.append("Deficiência de Sangue do Fígado")
            default:
                checked.append("")
            }
            cell.accessoryType = .checkmark
            
        }
        
    }
    
    // Method to find a value within an array
    func find(value searchValue: String, in array: [String]) -> Int? {
        for (index, value) in array.enumerated() {
            if value == searchValue {
                return index
            }
        }
        return nil
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            // Unwrap the text from cell
            if let textToRemove = cell.textLabel?.text! {
                
                var text = ""
                // Converter o texto para o padrão
                switch textToRemove {
                case "Frio (Piora com o Frio, com o gelo, com o repouso, sensação de Frio local)":
                    text = "Frio (Piora com o Frio, com o gelo, com o repouso, sensação de Frio local)"
                case "Calor (Piora com o Calor, com o Movimento, Calor local, vermelhidão, coceira)":
                    text = "Calor (Piora com o Calor, com o Movimento, Calor local, vermelhidão, coceira)"
                case "Umidade (Tez brilhante, urina amarelada, inchaço e dor local, dor fixa)":
                    text = "Umidade (Tez brilhante, urina amarelada, inchaço e dor local, dor fixa)"
                case "Vento (Dores migratória, câimbras, tremores, sensibilidade ao Vento)":
                    text = "Vento (Dores migratória, câimbras, tremores, sensibilidade ao Vento)"
                case "Ósseo (Princípio de deformação articular, inchaços persistentes, enfraquecimento generalizado)":
                    text = "Ósseo (Princípio de deformação articular, inchaços persistentes, enfraquecimento generalizado)"
                case "Insônia":
                    text = "Deficiência de Xue e Yin do Coração e/ou Fogo"
                case "Delírio":
                    text = "Fogo Crescente no Coração"
                case "Excesso de sonhos e pesadelos":
                    text = "Deficiência de Yin e/ou Xue do Coração"
                case "Hipersônia":
                    text = "Deficiência de Yang do Baço e/ou Rins"
                case "Pouca sede":
                    text = "Muita sede"
                case "Turva e/ou começando a escurecer, muita espuma, muitas vezes no banheiro":
                    text = "Frio-Umidade no Baço e Rins"
                case "Urina escura, escassa, hematúria, areia na urina, urgência miccional, dor e ardência ao urinar":
                    text = "Umidade-Calor na Bexiga"
                case "Polaciúria, incontinência urinária, oligúria, edema, muita espuma, goteja c/ esforço":
                    text = "Deficiência de Yang dos Rins"
                case "Evacuações Ressecadas de Princípio a Fim e Escassas (2 em 2 dias ou mais)":
                    text = "Deficiência de Sangue do Fígado, Deficiência de Yin dos Rins e Intestinos e/ou Geral"
                case "Evacuação rotineira com fezes pastosas, líquidas, quebradiças":
                    text = "Deficiência de Yang do Baço"
                case "Fezes com tampão ressecado e pastoso a seguir":
                    text = "Deficiência de Qi do Baço"
                case "Fezes com Mucos":
                    text = "Calor-Umidade nos Intestinos – Importante Aprofundar nos Sinais"
                case "Perfil friorento - frio nas mãos e pés, frio na barriga e região lombar, pernas, dorme encolhido":
                    text = "Deficiência de Yang dos Rins"
                case "Perfil calorento - mãos e pés quentes, se descobre para dormir, transpira muito":
                    text = "Deficiência de Yin dos Rins"
                case "Misto - Mãos quentes e pés frios, mãos transpiram facilmente":
                    text = "Estagnação do Qi do Fígado"
                case "Adianta (8 a 10 dias)":
                    text = "Deficiência de Yang do Baço"
                case "Atrasa (8 a 10 dias)":
                    text = "Estagnação de Qi e Sangue do Fígado e Deficiência de Yang do Baço"
                case "Ora adianta, ora atrasa":
                    text = "Estagnação de Qi e Sangue do Fígado e Deficiência de Yang do Baço e Rim"
                case "TPM com distensão abdominal, displasia mamária, irritabilidade, amenorréia, dismenorréia, pouco sangramento":
                    text = "Estagnação ou Depressão do Qi do Fígado"
                case "TPM com dismenorréia com sangramento escuro, coágulos, fisgadas na região do ovário no período ovulatório":
                    text = "Estagnação de Sangue do Fígado"
                case "Brancos ou transparentes, abundantes":
                    text = "Deficiência de Yang do Baço e Acúmulo de Umidade"
                case "Amarelados, viscoso, malcheirosos, com pruridos":
                    text = "Umidade-Calor na Bexiga e Genitais"
                case "Vermelhos, ininterruptos, leve odor":
                    text = "Calor-Umidade no Fígado e Vesícula Biliar"
                case "Escuros, sensação de Frio na barriga e dolorimento lombar":
                    text = "Deficiência de Yang do Rim"
                case "Muitos gases, pouco apetite, distensão abdominal, instabilidade nas evacuações, ora com fezes uniformes, ora fezes soltas, sem componente emocional":
                    text = "Deficiência de Qi do Baço"
                case "Diarréia matinal rotineira":
                    text = "Deficiência de Yang do Baço e do Rim"
                case "Muitos gases, perda de apetite, instabilidade nas evacuações, ora com fezes uniformes, ora fezes soltas, apenas quando ocorrem problemas emocionais":
                    text = "Estagnação do Qi do Fígado"
                case "Azia, aftas, queimação, boca e lábios secos":
                    text = "Deficiência do Yin do Estômago"
                case "Dor e sensação de Frio na região epigástrica, melhoradas pelo Calor, ausência de sede, vômito de líquidos claros (tipo água), ruídos na região epigástrica":
                    text = "Retenção de Líquidos no Estômago Devido ao Frio"
                case "Arrotos de mau cheiro, regurgitações ácidas, fezes com muito mal cheiro":
                    text = "Retenção de Alimentos no Estômago"
                case "Dor ardente no epigástrio, vômitos de líquidos azedos (Refluxo), dor, inchaço ou fragilidade capilar das gengivas com sangramentos fáceis, mau hálito, enxaqueca frontal":
                    text = "Fogo no Estômago"
                case "Dor aguda com sensação de facada, com possível irradiação para a região dorsal, agravada pela pressão local, pela alimentação, evoluindo junto com a magreza, tez do rosto escurecendo, com possível hematêmese ou melena":
                    text = "Estagnação de Sangue no Estômago"
                case "Câimbras, tiques palpebrais, espasmos migratórios pelo corpo, Bruxismo, Enxaqueca Tensional, Trapézio Endurecido":
                    text = "Agitação do Vento do Fígado por Deficiência de Sangue"
                case "Tonteira ao se Levantar Rápido, Enxaqueca Difusa ao Final do Dia, Unhas Fracas, Queda de Cabelos, Manchas no Campo Visual, Histórico de Anemia em Exames de Sangue":
                    text = "Deficiência de Sangue do Fígado"
                case "Aumento do Apetite no Período Menstrual, Metrorragia que vem diminuindo com o passar dos anos, Fraqueza no Período Menstrual":
                    text = "Deficiência de Sangue do Fígado"
                default:
                    text = ""
                }
                
                // Unwrap the index
                if let indexToRemove = find(value: text, in: checked) {
                    // Remove at index
                    checked.remove(at: indexToRemove)
                }
            }
            
            // Uncheck the cell
            cell.accessoryType = .none
        }
    }
}

struct SectionData {
    let title: String
    let opcoes : [String]
    
    var numberOfItems: Int {
        return opcoes.count
    }
    
    subscript(index: Int) -> String {
        return opcoes[index]
    }
}

extension SectionData {
    //  Putting a new init method here means we can
    //  keep the original, memberwise initaliser.
    init(title: String, opcoes: String...) {
        self.title = title
        self.opcoes  = opcoes
    }
}
