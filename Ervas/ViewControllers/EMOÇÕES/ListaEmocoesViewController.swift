//
//  ListaEmocoesViewController.swift
//  Ervas
//
//  Created by Fernando Augusto de Marins on 09/07/20.
//  Copyright © 2020 Fernando Augusto de Marins. All rights reserved.
//

import Foundation
import UIKit
class ListaEmocoesViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    var listOfEmotions = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "LISTA DE EMOÇÕES"
        setupScrollView()
        setupViews()
        textField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func setupScrollView(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }
    
    func setupViews(){
        
        contentView.addSubview(textField)
        textField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40).isActive = true
        textField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        textField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -140).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        contentView.addSubview(buttonAdd)
        buttonAdd.trailingAnchor.constraint(equalTo: textField.trailingAnchor, constant: 40).isActive = true
        buttonAdd.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40).isActive = true
        buttonAdd.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        contentView.addSubview(buttonRemove)
        buttonRemove.trailingAnchor.constraint(equalTo: buttonAdd.trailingAnchor, constant: 40).isActive = true
        buttonRemove.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40).isActive = true
        buttonRemove.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        contentView.addSubview(buttonClear)
        buttonClear.trailingAnchor.constraint(equalTo: buttonRemove.trailingAnchor, constant: 40).isActive = true
        buttonClear.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40).isActive = true
        buttonClear.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        contentView.addSubview(label)
        label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20).isActive = true
        label.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.89).isActive = true
        // O último elemento precisa ter a bottomAnchor = contentView.bottomAnchor
        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    @objc func convertToEmotion() -> String {
        if let text = textField.text {
            var emocao = ""
            switch text {
            case "BP1":
                emocao = "REJEIÇÃO"
            case "BP2":
                emocao = "SEGURANÇA"
            case "BP3":
                emocao = "INDIFERENÇA"
            case "BP4":
                emocao = "(DES)APROVAÇÃO"
            case "BP5":
                emocao = "FÉ NO FUTURO"
            case "BP6":
                emocao = "PREOCUPAÇÃO COM O FUTURO"
            case "BP7":
                emocao = "CONSIDERAÇÃO"
            case "BP8":
                emocao = "RECORDAÇÃO"
            case "BP9":
                emocao = "CONFIANÇA"
            case "BP10":
                emocao = "ALIENAÇÃO"
            case "BP11":
                emocao = "SIMPATIA"
            case "BP12":
                emocao = "EMPATIA"
            case "BP13":
                emocao = "RUMINAÇÃO"
            case "BP14":
                emocao = "CINISMO"
            case "BP15":
                emocao = "INVEJA"
            case "E1":
                emocao = "CRÍTICA"
            case "E2":
                emocao = "CONTENTAMENTO"
            case "E3":
                emocao = "NÃO(CONFIABILIDADE)"
            case "E4":
                emocao = "DESAPONTAMENTO"
            case "E5":
                emocao = "PRIVAÇÃO"
            case "E6":
                emocao = "FOME"
            case "E7":
                emocao = "NÁUSEA"
            case "E8":
                emocao = "COBIÇA"
            case "E9":
                emocao = "SIMPATIA"
            case "E10":
                emocao = "EMPATIA"
            case "E11":
                emocao = "HARMONIA"
            case "E12":
                emocao = "DESGOSTO"
            case "E13":
                emocao = "DÚVIDA"
            case "E14":
                emocao = "AMARGURA"
            case "E15":
                emocao = "VAZIO"
            case "P1":
                emocao = "ALEGRIA PLENA"
            case "P2":
                emocao = "DEPRESSÃO"
            case "P3":
                emocao = "FALSO ORGULHO"
            case "P4":
                emocao = "ARROGÂNCIA"
            case "P5":
                emocao = "MODÉSTIA"
            case "P6":
                emocao = "HUMILDADE"
            case "P7":
                emocao = "SINCERIDADE"
            case "P8":
                emocao = "(INTOLERÂNCIA)"
            case "P9":
                emocao = "ARREPENDIMENTO"
            case "P10":
                emocao = "PRECONCEITO"
            case "P11":
                emocao = "DESPREZO"
            case "P12":
                emocao = "DESDÉM"
            case "IG1":
                emocao = "CULPA"
            case "IG2":
                emocao = "ALÍVIO"
            case "IG3":
                emocao = "SOFRIMENTO"
                case "IG4":
                    emocao = "ENTUSIASMO"
                case "IG5":
                    emocao = "INDIFERENÇA"
                case "IG6":
                    emocao = "DEPRESSÃO"
                case "IG7":
                    emocao = "ARREPENDIMENTO"
                case "IG8":
                    emocao = "AUTOMERECIMENTO"
                case "IG9":
                    emocao = "LIBERAÇÃO DE SENTIMENTOS"
                case "IG10":
                    emocao = "(SEM)MISERICÓRDIA"
                case "IG11":
                    emocao = "COMPAIXÃO"
                case "IG12":
                    emocao = "TRISTEZA"
                case "IG13":
                    emocao = "APATIA"
            case "R1":
                emocao = "MEDO"
            case "R2":
                emocao = "ANSIEDADE"
            case "R3":
                emocao = "FOBIA"
            case "R4":
                emocao = "(IN)SEGURANÇA SEXUAL"
            case "R5":
                emocao = "(IN)SEGURANÇA CRIATIVA"
            case "R6":
                emocao = "SUPERSTIÇÃO"
            case "R7":
                emocao = "PARANÓIA"
            case "R8":
                emocao = "NEGLIGÊNCIA"
            case "R9":
                emocao = "IMPRUDÊNCIA"
            case "R10":
                emocao = "(DES)LEALDADE"
            case "R11":
                emocao = "(IN)DECISÃO"
            case "R12":
                emocao = "CAUTELA"
            case "B1":
                emocao = "PAZ"
            case "B2":
                emocao = "PAVOR"
            case "B3":
                emocao = "MEDO"
            case "B4":
                emocao = "ANSIDADE"
            case "B5":
                emocao = "TERROR/PÂNICO"
            case "B6":
                emocao = "RESOLUÇÃO"
            case "B7":
                emocao = "AGITAÇÃO"
            case "B8":
                emocao = "FRUSTRAÇÃO"
            case "B9":
                emocao = "IMPACIÊNCIA"
            case "B10":
                emocao = "DIREÇÃO INTERIOR"
            case "B11":
                emocao = "CONFIANÇA"
            case "B12":
                emocao = "(IN)ADEQUAÇÃO"
            case "B13":
                emocao = "CORAGEM"
            case "F1":
                emocao = "RAIVA/FÚRIA/IRA"
            case "F2":
                emocao = "ANGÚSTIA"
            case "F3":
                emocao = "VINGANÇA"
            case "F4":
                emocao = "RESSENTIMENTO"
            case "F5":
                emocao = "AUTOCONVECIMENTO"
            case "F6":
                emocao = "INDIGNAÇÃO"
            case "F7":
                emocao = "TRANSFORMAÇÃO"
            case "F8":
                emocao = "RESPONSABILIDADE"
            case "F9":
                emocao = "INFELICIDADE"
            case "F10":
                emocao = "FELICIDADE"
            case "F11":
                emocao = "IRRITABILIDADE"
            case "F12":
                emocao = "CONTENTAMENTO"
            case "F13":
                emocao = "HOSTILIDADE"
            case "F14":
                emocao = "AMARGURA"
            case "VB1":
                emocao = "AMOR/RAIVA"
            case "VB2":
                emocao = "FÚRIA/IRA"
            case "VB3":
                emocao = "TOLERÂNCIA"
            case "VB4":
                emocao = "AUTOCONVECIMENTO"
            case "VB5":
                emocao = "INDIGNAÇÃO"
            case "VB6":
                emocao = "ADORAÇÃO"
            case "VB7":
                emocao = "TÉDIO/MOTIVAÇÃO"
            case "VB8":
                emocao = "AFIRMAÇÃO"
            case "VB9":
                emocao = "DESAMPARO"
            case "VB10":
                emocao = "IMPOTÊNCIA"
            case "VB11":
                emocao = "PASSIVIDADE"
            case "VB12":
                emocao = "HUMILDADE"
            case "VB13":
                emocao = "ESCOLHA"
            case "VB14":
                emocao = "ORGULHO"
            case "TA1":
                emocao = "EXALTAÇÃO"
            case "TA2":
                emocao = "DESESPERO"
            case "TA3":
                emocao = "DESÂNIMO"
            case "TA4":
                emocao = "LEVEZA"
            case "TA5":
                emocao = "OPRESSÃO"
            case "TA6":
                emocao = "ISOLAMENTO"
            case "TA7":
                emocao = "HUMILHAÇÃO"
            case "TA8":
                emocao = "SEM ESPERANÇA"
            case "TA9":
                emocao = "SERVIÇO"
            case "TA10":
                emocao = "EQUILÍBRIO"
            case "TA11":
                emocao = "ANIMAÇÃO"
            case "TA12":
                emocao = "SOLIDÃO"
            case "ID1":
                emocao = "ALEGRIA"
            case "ID2":
                emocao = "CHOQUE"
            case "ID3":
                emocao = "PESAR"
            case "ID4":
                emocao = "TRISTEZA"
            case "ID5":
                emocao = "INTERNALIZAÇÃO"
            case "ID6":
                emocao = "(DES)CONSIDERAÇÃO"
            case "ID7":
                emocao = "NERVOSISMO"
            case "ID8":
                emocao = "SUPEREXCITAÇÃO"
            case "ID9":
                emocao = "DESENCORAJAMENTO"
            case "ID10":
                emocao = "ASSIMILAÇÃO"
            case "ID11":
                emocao = "APOIO"
            case "ID12":
                emocao = "MÁGOA"
            case "CS1":
                emocao = "MELANCOLIA"
            case "CS2":
                emocao = "HISTERIA"
            case "CS3":
                emocao = "RELAXAMENTO"
            case "CS4":
                emocao = "RESISTÊNCIA"
            case "CS5":
                emocao = "RENÚNCIA AO PASSADO"
            case "CS6":
                emocao = "TRANQUILIDADE"
            case "CS7":
                emocao = "RESPONSABILIDADE"
            case "CS8":
                emocao = "GENEROSIDADE"
            case "CS9":
                emocao = "CIÚME"
            case "CS10":
                emocao = "REMORSMO"
            case "CS11":
                emocao = "CALMA"
            case "C1":
                emocao = "PERDÃO"
            case "C2":
                emocao = "COMPAIXÃO"
            case "C3":
                emocao = "AUTOCONFIANÇA"
            case "C4":
                emocao = "AUTOESTIMA"
            case "C5":
                emocao = "AUTOMERECIMENTO"
            case "C6":
                emocao = "DÚVIDA"
            case "C7":
                emocao = "INSEGURANÇA"
            case "C8":
                emocao = "SEGURANÇA"
            case "C9":
                emocao = "RAIVA"
            case "C10":
                emocao = "ÓDIO"
            case "C11":
                emocao = "AMOR"
            case "VC1":
                emocao = "AUTO-RESPEITO"
            case "VC2":
                emocao = "SOBRECARGA"
            case "VC3":
                emocao = "ACANHAMENTO"
            case "VC4":
                emocao = "SUCESSO"
            case "VC5":
                emocao = "VERGONHA"
            case "VG1":
                emocao = "EMBARAÇO"
            case "VG2":
                emocao = "(DES)PROTEÇÃO"
            case "VG3":
                emocao = "(DES)HONESTIDADE"
            case "VG4":
                emocao = "(DES)CONFIANÇA"
            case "VG5":
                emocao = "VERDADE"
            default:
                emocao = "NÃO EXISTE"
            }
            
            listOfEmotions.append(emocao)
            label.text = convertArrayToString(array: listOfEmotions)
            textField.text = ""
            
            return emocao
        }
        return ""
    }
    
    // Fazer adicionar a função apertando o enter
    override func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        convertToEmotion()
        
        return true
    }
    
    // Limpar a lista
    @objc func clear() {
        label.text = ""
    }
    
    // Converter Array para String adicionando um parágrafo
    func convertArrayToString(array: Array<String>) -> String {
        var text: String = ""
        for item in array {
            text += "\(item)\n"
        }
        return text
    }
    
    let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.sizeToFit()
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        return label
    }()
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "ÓRGÃO + NÚMERO"
        textField.borderStyle = .none
        textField.backgroundColor = .white
        textField.textColor = .black
        textField.autocorrectionType = .no
        textField.keyboardType = .alphabet
        textField.returnKeyType = .go
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.autocapitalizationType = .allCharacters
        textField.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        return textField
    }()
    
    let buttonAdd: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.FlatColor.Green.PersianGreen
        button.setTitle("+", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(convertToEmotion), for: .touchUpInside)
        return button
    }()
    
    let buttonRemove: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.FlatColor.Green.PersianGreen
        button.setTitle("-", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    let buttonClear: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.FlatColor.Green.PersianGreen
        button.setTitle("C", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(clear), for: .touchUpInside)
        return button
    }()
}
