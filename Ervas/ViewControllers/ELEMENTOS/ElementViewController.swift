//
//  ElementViewController.swift
//  Ervas
//
//  Created by Fernando Augusto de Marins on 08/07/20.
//  Copyright © 2020 Fernando Augusto de Marins. All rights reserved.
//

import Foundation
import UIKit

class ElementViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    var element: String = ""
    var info = ""

    override func viewDidLoad() {
        super.viewDidLoad()
                
        setupScrollView()
        setupViews()
        
        title = element.uppercased()
        
//        let closeButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(closeVC))
//        closeButton.tintColor = .white
//
//        navigationItem.rightBarButtonItem = closeButton
    }
    
//    @objc func closeVC() {
//        dismiss(animated: true, completion: nil)
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        label1.text = displayElement(element: element)
    }
    
    func displayElement(element: String) -> String {
        switch element {
        case "FOGO - MOVIMENTO":
            info = "A essência SHEN é responsável pelo movimento das energias. Forma o elemento fogo, que é capaz de aquecer, ativar, transformar e clarear o ambiente.\n\nO shen aquece o organismo e organiza o elemento energético responsável pela transferência e captação de aspectos emocionais para o corpo físico.\n\nO fogo constrói a capacidade de interação com as pessoas; cria o fogo da paixão; nos ajuda a ser comunicativos, verbalizar o que se pensa, o que se quer; aprimora a convivência com a fala; relaciona-se com a capacidade de se aproximar; ligado à dopamina (principal substância neuroquímica relacionado ao prazer); sexualidade.\n\nCALOR - LINGUAGEM E LÍNGUA (papilas gustativas é da terra) - SANGUE E VASOS SANGUÍNEOS - CABELO - AMARGO\n\nQUESTÕES:\n\nAMOR E CALOR HUMANO - INSTABILIDADE EMOCIONAL - PROXIMIDADE E INTIMIDADE - ALEGRIA - CLAREZA E CONFUSÃO\n\nESTAÇÃO COGNITIVA: movimenta as energias e promove a sensibilidade e a extroversão das ideias por meio da elocução.\n\nESTAÇÃO PSÍQUICA: identifica padrões de instabilidade e estabilidade e produz a euforia e o amor fraterno.\n\nMODELO DE MANIFESTAÇÃO E O TEMPERAMENTO: em desequilíbrio, a essência Shén constrói estados emocionais ansiosos. A instabilidade consciencial não permite a fixação do raciocínio, o que estimula a produção de um modelo de manifestação emocional exagerado e eufórico. A maturidade consciencial estabiliza o psiquismo, o que permite a construção de um modelo de manifestação racional otimista."
        case "TERRA - ESTRUTURA":
            info = "A essência YI é responsável pelo atração e agregação das energias. A terra é capaz de estabilizar, solidifica e estruturar o cenário para os outro elementos. O BP e o E conferem o yin qi para o corpo.\n\nA terra nos dá a capacidade da estabilização, de controlar o movimento das energias. Quando você pensa, você mobiliza uma quantidade de energia. A terra é o pensamento, a ponderação, gerando a capacidade da concentração. Se você tem muita terra, atrai energias demais, podendo engordar. Quando não consegue atrair as energias, não consegue se concentrar. Comanda a fome e a saciedade, a formação dos músculos (se come muita proteína) e a gordura (se come muito carboidrato). O zhi organiza as ideias e alimenta o intelecto.\n\nUMIDADE - BOCA E PALADAR - MÚSCULOS E CARNE - GORDURA - DOCE\n\nQUESTÕES:\n\nSENTIR-SE APOIADO (PROTEGIDO) - NUTRIR-SE - SENTIR-SE CENTRADO E ESTÁVEL - TER CLAREZA MENTAL - SER COMPREENDIDO\n\nESTAÇÃO COGNITIVA: apreende a informação e permite a reflexão, a memorização e o aprendizado.\n\nESTAÇÃO PSÍQUICA: identifica modelos de perfeição e imperfeição e produz a preocupação e a afetuosidade.\n\nMODELO DE MANIFESTAÇÃO E O TEMPERAMENTO: em desequilíbrio, a essência Yi gera a preocupação. Isso porque, há imperfeição nas reflexões e análises. A experiência adquirida amadurece o psiquismo e promove tranquilidade à atividade cognitiva, que consegue produzir um modelo de manifestação justo e inteligente."
        case "METAL - DIREÇÃO":
            info = "A essência PO é responsável pelo troca e intercâmbio das energias. O metal é capaz de fornecer cadência às energias e atribuir função à estrutura dos elementos. O P e o IG limpam o organismo por meio da captação do yang qi e eliminação da energia turva (xie qi).\n\nO metal conduz energia, de um polo ao outro. O magnésio faz o transporte do interno e externo na célula. Ele impulsiona a troca de energia entre as pessoas pela palavra, pela conversa. Assimila o que recebe e leva para o íntimo. Ajuda com a renovação de idéias.\n\nA insatisfação prende o intestino grosso, porque a pessoa está prendendo coisas.\n\nSECURA - NARIZ E OLFATO - PELE E NARIZ - PÊLOS - PICANTE\n\nQUESTÕES:\n\nRECONHECIMENTO - APROVAÇÃO - SENTIR-SE COMPLETO - SENTIR-SE ADEQUADO NO MUNDO - ENCONTRAR INSPIRAÇÃO\n\nESTAÇÃO COGNITIVA: associa as informações durante a introspecção e providencia o entendimento.\n\nESTAÇÃO PSÍQUICA: identifica as sensações de satisfação e insatisfação e produz a tristeza e a gratidão.\n\nMODELO DE MANIFESTAÇÃO E O TEMPERAMENTO: em desequilíbrio, a essência Po produz a tristeza, devido à insatisfação constante. Esse padrão intoxica a atividade psíquica, criando um modelo de manifestação negativo e pessimista. A maturidade consciencial permite a associação de ideias, construindo um modelo de manifestação racional satisfeito e positivo."
        case "ÁGUA - FORÇA":
            info = "A essência ZHI é responsável pelo impulso inicial das energias. A água confere a capacidade de conceber a vida, memorizar o passado, escoar os nutrientes, eliminar os excessos e determinar o caminho.\n\nA essência zhi consegue organizar a energia responsável pela transferência das informações conscienciais para o corpo físico (Jing qi).\n\nSe você está inseguro, você estimula o rim a produzir os hormônios de fuga, ou seja, começa a gerar o desequilíbrio neste elemento.\n\nFRIO - OUVIDOS E AUDIÇÃO - OSSOS, MEDULA ÓSSEA E CABELOS (COR) - DENTE - SALGADO\n\nQUESTÕES:\n\nNECESSIDADE DE ESTAR SEGURO - CONFIANÇA - IMPULSO - RECEBER NOTÍCIA TRANQUILIZADORA - EXCITAÇÃO NO PERIGO\n\nESTAÇÃO COGNITIVA: impulsiona e direciona a motivação inicial para a construção de ideias.\n\nESTAÇÃO PSÍQUICA: identifica as sensações de segurança e insegurança e produz o medo e a coragem.\n\nMODELO DE MANIFESTAÇÃO E O TEMPERAMENTO: a essência Zhi é responsável por caracterizar internamente o medo. Esta emoção é produzida por meio da sensação de insegurança, que, por sua vez, é gerada pela ameaça. Porém, a maturidade consciencial organizada pela confiança permite a construção de um modelo de manifestação seguro e sereno."
        case "MADEIRA - OBJETIVO":
            info = "A essência HUN é responsável pelo organização das energias. A ordenação da essência Hun qualifica a propriedade, a coerência e promove o desenvolvimento do elemento madeira, que nos ajuda a buscar a liberdade a independência. Se a raiz da madeira estiver numa base de terra instável, haverá desequilíbrio. O F e a VB regula a fisiologia e regenera o sangue. O F influencia o sono, por influenciar a pineal (que gera a melatonina).\n\nOs atributos: intuição decisão, planejamento e execução. Para tomar uma boa decisão é necessária uma terra boa. A madeira é gerada da água e precisa da terra para ficar forte. Precisa de independência e liberdade, precisa estar conectado à Mente Cósmica. A madeira nutre o lobo pré-frontal.\n\nVENTO - OLHOS, VISÃO E LÁGRIMAS - LIGAMENTOS E TENDÕES - UNHAS - AZEDO\n\nQUESTÕES:\n\nLIMITES - PODER - SER CORRETO - CRESCIMENTO PESSOAL - DESENVOLVIMENTO\n\nESTAÇÃO COGNITIVA: organiza as informações intuitivas e constrói o discernimento.\n\nESTAÇÃO PSÍQUICA: identifica a coerência e incoerência e produz a raiva e o altruísmo.\n\nMODELO DE MANIFESTAÇÃO E O TEMPERAMENTO: em desequilíbrio, a essência Hun produz a raiva, devido à análise incoerente dos fatos. Esse padrão desorganiza a atividade cognitiva e produz um modelo de manifestação emocional furioso. A maturidade consciencial permite a cognição formatar um modelo de manifestação discernido e organizado."
        default:
            info = ""
        }
        return info
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
        contentView.addSubview(label1)
        label1.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        label1.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        label1.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9).isActive = true
        label1.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
//        contentView.addSubview(label2)
//        label2.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
//        label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 25).isActive = true
//        label2.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 3/4).isActive = true
//        label2.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    let label1: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborumLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborumLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.............."
        label.numberOfLines = 0
        label.sizeToFit()
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        return label
    }()
    
    let label2: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
        label.numberOfLines = 0
        label.sizeToFit()
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}
