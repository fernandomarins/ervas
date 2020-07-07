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
//    let scrollView = UIScrollView()
//    let contentView = UIView()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupScrollView()
//        setupViews()
//    }
//
//    func setupScrollView() {
//        scrollView.translatesAutoresizingMaskIntoConstraints = false
//        contentView.translatesAutoresizingMaskIntoConstraints = false
//
//        view.addSubview(scrollView)
//        scrollView.addSubview(contentView)
//
//        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
//        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//
//        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
//        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
//        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
//        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
//    }
//
//    func setupViews() {
//        contentView.addSubview(label1)
//        label1.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
//        label1.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
//        label1.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 4/5).isActive = true
//
//        contentView.addSubview(label2)
//        label2.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
//        label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 25).isActive = true
//        label2.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 4/5).isActive = true
//        label2.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
//    }
//
//    let sindromesBI: UILabel = {
//        let label = UILabel()
//        label.text = "Síndromes BI:"
//        label.numberOfLines = 0
//        label.sizeToFit()
//        label.textColor = .white
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    let sindromeBiFrio: UISwitch = {
//        let button = UISwitch()
//
//    }()
//
//    let label2: UILabel = {
//        let label = UILabel()
//        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborumLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborumLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.............."
//        label.numberOfLines = 0
//        label.sizeToFit()
//        label.textColor = .white
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
    
    lazy var mySections: [SectionData] = {
        let section1 = SectionData(title: "Síndromes BI", opcoes: "Frio", "Calor", "Umidade", "Vento", "Óssea")
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
    
    var checked = [IndexPath]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsMultipleSelection = true
        tableView.allowsMultipleSelectionDuringEditing = true
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
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            checked.append(indexPath)
            cell.accessoryType = .checkmark
        }
    }
    
//    func find(value searchValue: IndexPath, in array: [String]) -> Int? {
//        for (index, value) in array.enumerated() {
//            if value == searchValue {
//                return index
//            }
//        }
//        return nil
//    }
//    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        if let cell = tableView.cellForRow(at: indexPath) {
//            find(value: indexPath, in: <#T##[String]#>)
//            cell.accessoryType = .none
//        }
//    }
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
