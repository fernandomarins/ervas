//
//  TratamentoViewController.swift
//  Ervas
//
//  Created by Fernando Augusto de Marins on 03/07/20.
//  Copyright © 2020 Fernando Augusto de Marins. All rights reserved.
//

import UIKit

class TratamentoViewController: UIViewController {

    @IBOutlet weak var padraoLabel: UILabel!
    @IBOutlet weak var sinais: UILabel!
    @IBOutlet weak var exemplo: UILabel!
    @IBOutlet weak var tratamento: UILabel!
    
    var padrao: String = ""
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        padraoLabel.text = padrao
        setInfo(padrao: padrao)
    }
    
    func setInfo(padrao: String) {
        switch padrao {
        case "Deficiência da Essência dos Rins":
            sinais.text = "Retardo ou fechamento incompleto da fontanela nas crianças, desenvolvimento físico lento, pouco desenvolvimento do esqueleto, fragilidade óssea, lombalgia, fraqueza dos joelhos, dentes fracos, desenvolvimento cerebral lento, raciocínio e memória fracos, senilidade precoce, surdez, zumbidos, impotência precoce, amenorréia, infertilidade, queda e embranquecimento precoce dos cabelos, pulso profundo e fraco."
            exemplo.text = "Retardo Físico e Mental de Crianças, Infertilidade, Zumbidos, Envelhecimento Precoce, Leucemia, Queda de Cabelo, Dor de Crescimento, Má Formações Congênitas, Baixa Acuidade Visual em crianças, Nefrose, Osteoporose."
            tratamento.text = "Usar plantas do Grupo “Tônicos do Sangue”, “Tônicos do Yin”, “Tônicos do Yang” e “Substâncias Adstringentes”. Estas substâncias possuem a característica de Fortalecerem a ESSÊNCIA."
        case "Deficiência do Yang dos Rins":
            sinais.text = "Tez pálida, temor ao frio, membros frios, apatia, lassitude, dolorimento e frio na região lombar, fraqueza e frio nos joelhos, diminuição da atividade sexual, impotência, infertilidade, espermatorréia, dentes frouxos, surdez, polaciúria, incontinência urinária, oligúria, edema, pulso profundo e fraco, língua pálida, mole."
            exemplo.text = "Neurastenia, Hipofunção Tireoidiana e Adrenal, Diabetes Insípido, Impotência Sexual, Lombalgia, Nefrite Crônica, Incontinência Urinária, Infertilidade, Asma, Enfisema, Edemas, Doenças Cárdio-Respiratórias, Insuficiência Cardíaca, Diarréia Crônica."
            tratamento.text = "Usar plantas do Grupo “Tônicos do Yang” e “Ervas que Aquecem o Interior e Expulsam o Frio”. Estas substâncias possuem a característica de Fortalecerem o YANG DOS RINS E BAÇO- PÂNCREAS."
        case "Deficiência do Yin dos Rins":
            sinais.text = "Rubor Malar, Sede Intensa, Prisão de Ventre Seca, urina escura, palma das mãos e planta dos pés quentes, sensação de muito calor corporal, transpiração noturna intensa, fraqueza nos joelhos e nas costas com dolorimentos e contraturas, Tontura fácil, memória fraca, espermatorréia com sonhos, ejaculação precoce, pulso fino e rápido, língua avermelhada com pouca ou nenhuma saburra, ora língua gretada."
            exemplo.text = "Hipertensão Arterial, Taquicardia, Hipertireoidismo, Diabetes Melitus, Lombalgia, Nefrite Crônica, Distúrbios Menstruais, Tuberculose, Queimação no Rosto, Ondas de Calor, Secura Vaginal, Secura na Pele, Polução Noturna, Sudorese Noturna, Hematúria, Secura na Boca e Garganta."
            tratamento.text = "Usar substâncias do Grupo “Tônicos do Yin” e do Grupo “Tônicos do Sangue”."
        default:
            return
        }
    }

}
