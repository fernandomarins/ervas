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
    @IBOutlet weak var sinaisShouldChange: UILabel!
    @IBOutlet weak var exemploShouldChange: UILabel!
       
    var shouldChange: Bool = false
    var padrao: String = ""
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        padraoLabel.text = padrao
        if shouldChange {
            sinaisShouldChange.text = "SINTOMATOLOGIA"
            exemploShouldChange.text = "ETIOPATOGENIA"
        } else {
            sinaisShouldChange.text = "SINAIS"
            exemploShouldChange.text = "EXEMPLO DE DOENÇAS OCIDENTAIS"
        }
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
        case "Umidade-Calor na Bexiga":
            sinais.text = "Urina escura, hematúria, cálculos renais, micção freqüente, dificuldade e dor ao urinar, sede aumentada, febre, pulso escorregadio e rápido, língua vermelha, saburra amarela."
            exemplo.text = "Cistite, Prostatite, Cálculos Vesicais, Doenças Inflamatórias da Bexiga e do Trato Urinário, Reações Alérgicas da Região Pubiana e dos Órgãos Sexuais."
            tratamento.text = "Usar Substâncias do Grupo “Ervas que Drenam a Umidade” e “Ervas que Drenam Calor- Umidade”, “Ervas que Eliminam o Calor Intenso” e “Ervas que Eliminam Calor Toxinas”."
        case "Deficiência de Qi do Baço-Pâncreas":
            sinais.text = "Perda de apetite, anorexia, dor e/ou distensão leve aliviadas pela pressão, edema, fezes soltas, atrofia muscular, fraqueza dos membros, cansaço, tez amarelada ou pálida, pulso vazio (fraco), língua mole, saburra fina e branca."
            exemplo.text = "Fraqueza Geral, Anemia, Fraqueza Digestiva Geral, Distensão Abdominal, Gastrite Crônica, Úlcera Gástrica ou Duodenal, Diarréia Crônica, Miastenia, Fragilidade Capilar, Varizes, Hemorróidas, Hemorragia Uterina, Retenção Hídrica."
            tratamento.text = "Usar Substâncias do Grupo “Ervas Tônicas do Qi”, “Ervas que Promovem a Circulação do Qi” e “Ervas Hemostáticas”."
        case "Deficiência de Yang do Baço Pâncreas":
            sinais.text = "Semelhantes aos sinais da Deficiência de Qi do Baço, porém, acrescidos de sintomas de Frio como Extremidades Frias. Temor ao Frio, Dor Abdominal Melhorada pelo Calor ou pela Pressão, Má Digestão, Fezes Líquidas, tendência à Retenção hídrica e Edemas, pulso profundo e fraco, língua inchada e com marcas de dentes."
            exemplo.text = "Úlcera gástrica crônica, enterite crônica, desinteria crônica, edemas, hepatite crônica, cirrose hepática, leucorréias brancas e flúidas, hipotermia."
            tratamento.text = "Usar Substâncias do Grupo “Ervas que Aquecem o Interior e Expelem o Frio”."
        case "Qi do Baço Não Governa Sangue":
            sinais.text = "Sinais de Deficiência de Qi do Baço e/ou Yang do Baço, agregados a sinais de hemorragias principalmente da parte inferior do corpo e enfraquecimento venoso e capilar."
            exemplo.text = "Hemorragia uterina, sangramento hemorroidal, hemofilia, melena, púrpura, varizes, hematomas fáceis."
            tratamento.text = "Utilizar Ervas do Grupo “Ervas Tônicas do Qi”, “Ervas que Aquecem o Interior e Expelem o Frio” e “Ervas Hemostáticas”."
        case "Desmoronamento do Qi do Baço":
            sinais.text = "Sinais de Deficiência de Qi do Baço e/ou Yang do Baço, agregados a sinais de ptoses de ânus, vagina, útero, vesícula biliar e estômago."
            exemplo.text = "Ptoses de órgãos internos."
            tratamento.text = "Utilizar Ervas do Grupo “Ervas Tônicas do Qi” com capacidade de tratar ptoses."
        case "Invasão do Baço pelo Frio e Umidade":
            sinais.text = "Letargia, perda de apetite e paladar, sensação de peso nos membros e na cabeça, opressão torácica, estufamento abdominal. Estes sinais podem estar acompanhados de: secreções abundantes e turva, como urina escura e turva, leucorréia, diarréia, viscosidade nos olhos, pigarro fluído na garganta, erupções líquidas na pele, com retenção ou gotejamento de urina, pulso escorregadio."
            exemplo.text = "Gastroenterites Crônicas, Desinterias e Hepatites em estágios avançados, Leucorréia Fluída Branca ou Transparente, Enjôos Freqüentes, etc."
            tratamento.text = "Utilizar Substâncias do Grupo “Ervas que Aquecem o Interior e Expulsam o Frio” e “Ervas Tônicas do Qi”."
        case "Umidade-Calor Acumulada no Baço":
            sinais.text = "Perda de apetite, letargia, sensação de peso nos membros e na cabeça, febrícula, urina escassa e levemente amarelada, icterícia. Gosto amargo na boca, língua levemente avermelhada, saburra gordurosa, amarelada, pulso escorregadio e rápido. Se não houver obstrução ao fluxo de Bile, os sintomas e tratamento serão direcionados ao “Fogo no Estômago. E se houver obstrução ao fluxo de Bile, os sintomas e tratamento serão direcionados ao “Calor e Umidade no Fígado e Vesícula Biliar”."
            exemplo.text = "Gastroenterites Crônicas e Recentes, Hepatite Aguda, Colescitite e Cirrose."
            tratamento.text = "Utilizar os Grupos de Substâncias “Ervas que Eliminam Calor Intenso (Para tratar o Fogo no Estômago)” e “Ervas que Drenam o Calor e a Umidade (Para tratar a Umidade-Calor no Fígado e Vesícula Biliar)”."
        case "Mucosidade Turva Estorva a Cabeça":
            sinais.text = "Este padrão é uma evolução da Umidade que vai gradualmente se condensando e se transformando em Mucosidade, com sinais de tontura, peso na cabeça, congestão torácica, náuseas, vômitos, pulso escorregadio, língua com saburra grossa e gordurosa. A MUCOSIDADE nasce no sistema digestivo através da condensação gradual da UMIDADE. Ela sofre complicações na medida em que outros órgãos entram na Desarmonia, principalmente ESTÔMAGO e FÍGADO. È importantíssimo também definir todos os Padrões de Desarmonia envolvidos, uma vez que são patologias graves e que demandam uma averiguação ampla de sinais para se chegar a um tratamento eficiente."
            exemplo.text = "Hipertensão arterial, Epilepsia, Desmaios, AVC, Insanidade."
            tratamento.text = "O tratamento consiste em transformar a MUCOSIDADE-CALOR ou a MUCOSIDADE-FRIO do organismo através dos grupos: “Ervas que Eliminam a Fleugma-Calor” e “Ervas que Eliminam a Fleugma-Frio”."
        case "Retenção de Líquidos no Estômago Devido ao Frio":
            sinais.text = "Dor e sensação de Frio na região epigástrica agravadas pelo Frio e melhoradas pelo Calor, ausência de sede, vômitos após a ingestão de alimentos, vômitos de líquidos claros, ruídos na região epigástrica, pulso profundo e fraco, língua pálida, revestimento lingual branco, úmido e/ou gorduroso."
            exemplo.text = "Gases, náuseas e enjôos sem causa específica, excesso de barulhos no estômago, gastralgias, gastrite crônica."
            tratamento.text = "Utilizar o Grupo “Ervas que Aquecem o Interior e Expelem o Frio”."
        case "Retenção de Líquidos no Estômago":
            sinais.text = "Perda de apetite, distensão e dor na região epigástrica, arrotos de mau cheiro, regurgitação ácida, fezes soltas ou constipação intestinal, fezes de mau cheiro, pulso escorregadio, língua com revestimento grosso e gorduroso."
            exemplo.text = "Digestão lenta, prisão de ventre, gastrite crônica, halitose."
            tratamento.text = "Utilizar substâncias do Grupo “Ervas que Aliviam a Estagnação de Alimentos e Ervas Aromáticas que Transformam a Umidade”."
        case "Deficiência de Yin do Estômago":
            sinais.text = "Perda de apetite, boca e lábios secos, vômito de líquido espesso, constipação intestinal, pulso fino e rápido, língua vermelha sem revestimento, ora, língua gretada com sulco central."
            exemplo.text = "Gastrite nervosa, digestão lenta, prisão de ventre, secura nos lábios."
            tratamento.text = "Tonificar o Yin do Estômago com o Grupo de “Ervas Tônicas do Yin”."
        case "Fogo no Estômago":
            sinais.text = "Dor ardente no epigástrio, sede com preferência por bebidas geladas, vômitos de alimentos indigestos ou de líquidos azedos; inchaço, ulceração, dor e sangramento das gengivas, mau hálito, constipação intestinal, pulso rápido, escorregadio, língua avermelhada, saburra grossa, seca e amarelada."
            exemplo.text = "Gastrite nervosa, hérnia de hiato, úlcera, aftas, azia, periodontites, odontalgias, halitose."
            tratamento.text = "Tonificar o Yin do Estômago com o Grupo de “Ervas Tônicas do Yin” e Retirar o Calor ou Fogo com o Grupo “Ervas que Eliminam o Calor Intenso”."
        case "Estagnação de Sangue no Estômago":
            sinais.text = "Dor aguda com sensação de facada, ora irradiando para a região dorsal; esta dor piora pela pressão, pela alimentação; ainda magreza, tez do rosto escurecida, hematêmese e melena, pulso escorregadio, tenso, língua púrpura, pontos avermelhados nos lados, saburra fina e amarelada."
            exemplo.text = "Gastralgia Fixa, Úlceras, Câncer Gástrico."
            tratamento.text = "Utilizar o Grupo de “Ervas que Promovem a Circulação de Sangue”, “Ervas Hemostáticas” e o Grupo de “Ervas que Eliminam Calor e Toxinas”."
        case "Estagnação de Qi do Fígado":
            sinais.text = "Depressão, frustração, irritação, raiva, distensão e fraqueza nos hipocôndrios, nos lados do tórax, lamentação, sensação de opressão na garganta, pouco apetite, má digestão, náusea, arrotos, regurgitação e vômito azedo, dor no epigástrio, distensão e dor abdominal, borborigmos, evacuações com fezes soltas, icterícia, gosto amargo, vômito amarelado, sinais de TPM (tensão pré-menstrual), como distensão abdominal, inchaço e dolorimento mamário, irritabilidade ou depressão no período, menstruação irregular, amenorréia ou dismenorréia, menstruação escassa, infertilidade, pulso tenso, língua com sinais variáveis, púrpura ou levemente púrpura."
            exemplo.text = "Depressão, Indigestão, Colescitite, Mastite, Alopecia, Displasia Mamária, TPM, Dismenorréia, Tensão Nervosa, Hiperidrose, Globus Histericus, Carcinomas."
            tratamento.text = "Circular o Qi do Fígado com o grupo de “Ervas que Promovem a Circulação de Qi” e com “Ervas de todos os Grupos com Capacidade de Movimentar o Qi do Fígado”."
        case "Estagnação de Frio no Meridiano do Fígado":
            sinais.text = "Dor e distensão no abdome inferior, nos testículos e no escroto, que são aliviados pelo calor moderado, pulso profundo, tenso e lento, língua pálida, saburra branca."
            exemplo.text = "Varicocele, hidrocele, retração e fisgadas no testículos, hérnias inguinais, dismenorréia, corrimento crônico branco ou transparente, anospermia."
            tratamento.text = "Eliminar o Frio da Região com “Ervas que Aquecem o Interior e Expulsam o Frio” e Circular o Qi do Fígado com “Ervas que Promovem a Circulação de Qi”."
        case "Estagnação de Sangue no Fígado":
            sinais.text = "Cólicas menstruais intensas, fluxo escuro com coágulos durante a menstruação, dor em pontada na região pubiana e ovários, manchas arroxeadas no trajeto do Fígado, veias azuladas e em relevo nas têmporas, enxaqueca com pontadas, língua com manchas ou pontos purpúricos, pulso intermitente."
            exemplo.text = "Endometriose, Miomas, Dismenorréia, Enxaqueca, Úlceras Varicosas, Hepatomegalia e Esplenomegalia relacionadas à Hepatite Crônica."
            tratamento.text = "Mover (Circular) o Sangue do Fígado com o Grupo de “Ervas que Promovem a Circulação de Sangue” e tratar outros Padrões envolvidos na Desarmonia."
        case "Deficiência de Sangue no Fígado":
            sinais.text = "Rosto pálido, sem brilho, emagrecimento, tontura, queda de cabelo, dormências, espasmos, tremores, olhos sem vida, visão cansada, visão embaraçada, manchas no campo visual, fraqueza muscular ou musculatura rígida, unhas pálidas, finas e quebradiças, amenorréia, menstruação que vem diminuindo ao longo do tempo, pulso fraco e irregular, língua pálida, com pouco ou nenhum revestimento."
            exemplo.text = "Anemia, Esgotamento Nervoso, Hipertensão, Palpitações, Hepatite, Hepatite Crônica, Amenorréia, Leucemia, Miopia e Outros Distúrbios Oculares, Queda de Cabelo, Câimbras."
            tratamento.text = "Tonificar o Sangue (Xue) com o Grupo “Ervas Tônicas do Sangue”."
        case "Elevação de Yang do Fígado":
            sinais.text = "Palmas das mãos e plantas dos pés quentes, insônia, olhos sem vida, manchas no campo visual, tontura, boca seca, enxaqueca pulsátil, frontal, temporal e/ou no ápice, zumbidos, raiva e irritabilidade moderada, entorpecimentos, espasmos, tremores, pulso tenso e rápido, língua vermelha com pouco revestimento."
            exemplo.text = "Hipertensão, Hipertensão durante a gravidez, Cefaléias, Enxaquecas, Distúrbios emocionais como Raiva, Irritabilidade, Vertigem, Zumbido, TPM, Hipertireoidismo, Seqüelas de AVC, Contraturas de Trapézio."
            tratamento.text = "Reduzir, Acalmar ou Suavizar o Yang do Fígado, com o Grupo de “Ervas que Eliminam o Calor Intenso”, “Ervas que Eliminam o Calor e a Umidade”, “Substâncias que Acalmam o Espírito e Nutrem o Coração” e “Substâncias Anticonvulsivas que Controlam o Vento do Fígado”."
        case "Fogo Crescente no Fígado":
            sinais.text = "Sede intensa, constipação, urina escura, face e olhos vermelhos, insônia, possibilidade de hemorragias, enxaquecas fortes, zumbido ou surdez repentina, raiva violenta, gosto amargo constante, regurgitação azeda freqüente, enjôos, dores no hipocôndrio, pulso tenso, rápido e cheio, língua vermelha, revestimento amarelo grosso."
            exemplo.text = "Hipertensão Arterial, Sangramento Uterino Anormal, Enxaqueca, Conjuntivites, Glaucoma, Otites, Doença de Meniére, Hemorragias Digestivas por Ulceração pós Gastrite Nervosa, Comportamento Violento, herpes zoster."
            tratamento.text = "Sedar o Fogo do Fígado com o Grupo “Ervas que Eliminam o Calor Intenso e Ervas que Eliminam o Calor e a Umidade”."
        case "Agitação do Vento no Fígado":
            sinais.text = "Calor Intenso, Febre Alta, Rigidez nos Tendões, Opistótono, Hemiplegia, Adormecimentos, Tremores, Fasciculações, Espasmos na Cabeça e Extremidades, Coma, Delírio, Convulsões, Perda Repentina da Consciência, Distúrbios Mentais, visão Embaçada, Zumbido Súbito, Tontura, Afasia, Pulso Tenso, Rápido e/ou irregular, Língua Arroxeada, Vermelha ou Pálida, Revestimento Seco e Amarelado."
            exemplo.text = "Doenças Febris como Encefalite B, Malária, Varíola, Meningite, AVC e Seqüelas, Epilepsia, Paralisia Facial, Labirintite, Bruxismo, Insolação, Tiques Palpebrais, tremores Migratórios."
            tratamento.text = "Suavizar e/ou Sedar o Vento do Fígado com os Grupos “Ervas que Eliminam o Calor Intenso, Ervas que Eliminam Calor e Toxinas, Ervas Anticonvulsivas que Controlam o Vento do Fígado e Ervas Tônicas do Sangue”."
        case "Umidade-Calor no Fígado e Vesícula Biliar":
            sinais.text = "Sensação de plenitude e dor no tórax e nos hipocôndrios, icterícia, gosto amargo, tez brilhante, perda de apetite, náusea, vômito azedo, vômito azedo, distensão abdominal, possível febre, sede, urina escura, pulso rápido, escorregadio, língua vermelha, úmida e brilhante."
            exemplo.text = "Icterícia, Hepatite, Colecistite, Colelitíase, Leucorréia Amarelada, Conjuntivite, Otite Purulenta, Pequenos Furúnculos na Cabeça, Terçol, Acnes na Testa e Têmporas."
            tratamento.text = "Drenar o Calor e a Umidade com o Grupo de “Ervas que Eliminam o Calor e a Umidade”."
        case "Qi da Vesícula Biliar Deficiente":
            sinais.text = "Indecisão, Timidez, Medo, Irritabilidade, Vertigem, Visão Embaçada, Boca Amarga, Náuseas, Digestão Lenta, Língua com Revestimento Amarelo Fino, Pulso Escorregadio."
            exemplo.text = "Indecisão, Digestão Lenta (Empachamento), Timidez."
            tratamento.text = "Fortalecer o Qi da Vesícula Biliar com o Grupo de “Ervas Que Promovem a Circulação de Qi e Ervas de Outros Grupos com a Capacidade de Movimentar o Qi do Fígado e da Vesícula Biliar”."
        case "Qi do Coração Deficiente":
            sinais.text = "Face Pálida, Respiração Curta, Dispnéia aos esforços, suor espontâneo que se acentua com o esforço, palpitações, letargia, pulso fraco e língua pálida."
            exemplo.text = "Palpitações, Neuroses, Cansaço Fácil com Sudorese Espontânea."
            tratamento.text = "Tonificar o Qi do Coração com o Grupo de “Ervas Tônicas do Qi”."
        case "Yang do Coração Deficiente":
            sinais.text = "Semelhantes aos sinais da Deficiência de Qi do Coração (Face Pálida, Respiração Curta, Dispnéia aos esforços, suor espontâneo que se acentua com o esforço, palpitações, letargia), porém indicando um agravamento deste primeiro, pois surgem os sinais de Frio (Indicando Consumo Profundo do Yang Corporal), do tipo Temor ao Frio, Membros Frios, Edemas, pulso fraco, profundo, língua pálida, úmida e mole."
            exemplo.text = "Arritmias, Insuficiência Cardíaca, Arterioesclerose Coronária, Angina Pectoris, Hipocinesias Ventriculares, Fraqueza Geral, Nervosismo, Síndrome do Pânico, Comoção Violenta (Choque)."
            tratamento.text = "Tonificar o Yang do Coração com o Grupo de “Ervas Tônicas do Qi e Ervas que Aquecem o Interior e Expelem o Frio”."
        case "Sangue do Coração Estagnante":
            sinais.text = "Dor em Golpes ou Opressão na Região do Coração, Com Possível Irradiação Para o Braço Esquerdo,Face Púrpura ou Enegrecida, Cianose Labial ou nas Unhas, palpitações, Cansaço, Dispnéia, Extremidades Frias, Pulso Irregular, Tenso, Língua Púrpura ou com Pontos Púrpuros."
            exemplo.text = "Angina Pectoris, Infarto do Miocárdio, Cianose Labial e das Extremidades, Hipercolesterolemia."
            tratamento.text = "Movimentar o Sangue do Coração com o Grupo de “Ervas que Promovem a Circulação de Sangue”."
        case "Sangue do Coração Deficiente":
            sinais.text = "Tez pálida e sem vida, vertigem, insônia, sonho atormentado com sonhos, memória fraca, inquietação, ansiedade, ficar facilmente com medo, palpitações, pulso fraco e língua pálida."
            exemplo.text = "Insônia, Ansiedade, Amnésia, Hipertireoidismo, Anemia, Desnutrição Grave e Neuroses Depressivas tipo a Depressão Pós-Parto seguida de hemorragia durante ou após o parto."
            tratamento.text = "Tonificar o Sangue do Coração com o Grupo de “Ervas Tônicas do Sangue” e Acalmar o Shen com o Grupo “Ervas que Nutrem o Coração e Acalmam o Espírito”."
        case "Yin do Coração Deficiente":
            sinais.text = "Sinais gerais de Yin Deficiente no Corpo como Febre Baixa ou Sensação de Corpo Febril, Transpiração excessiva à noite, região malar corada, sensação de calor nas palmas e solas, boca seca, pulso Vazio, Rápido, Língua Seca, Vermelha, sem saburra. Além disso sinais específicos do Coração como a Palpitação, Insônia, Sono agitado com Sonhos ou Pesadelos, inquietação ou afobação, ansiedade e irritabilidade."
            exemplo.text = "Arritmias, Taquicardias, Hipertensão, Hipertireoidismo, Neuroses, Ansiedade, TOC (Transtorno Obsessivo Compulsivo)."
            tratamento.text = "Tonificar o Yin Geral e do Coração com o Grupo de “Ervas Tônicas do Yin” e Acalmar o Shen com Grupo “Substâncias que Acalmam o Espírito”."
        case "Fogo Crescente no Coração":
            sinais.text = "Inquietação, Verborragia, Irritabilidade, insônia, sensação de calor, face vermelha e quente, sede, gosto amargo, urina escura, dor e/ou hematúria, ulceração na boca e na língua, pulso cheio, rápido, língua vermelha, principalmente na ponta, rachadura no centro da língua, saburra amarela."
            exemplo.text = "Glossite, Hipertireoidismo, Hematúria, Insônia, Verborragia, Delírio Verbal por Insanidade, TOC (Transtorno Obsessivo Compulsivo)."
            tratamento.text = "Refrescar e Acalmar o Fogo do Coração, com o Grupo de “Ervas que Eliminam o Calor Intenso e o Grupo de Substâncias que Acalmam o Espírito”."
        case "Mucosidade-Fogo Agitando o Coração":
            sinais.text = "Insanidade, fala incoerente e agressiva, comportamento violento, riso e choro sem motivo, ora perda da consciência, não reconhecer as pessoas, olhar fixo."
            exemplo.text = "Histeria, Epilepsia, Distúrbio Bi-Polar (Fase Yang do Distúrbio), Insanidade, Seqüelas de AVC..."
            tratamento.text = "Eliminar a Mucosidade Calor (Fogo) e Abrir os orifícios do Coração com os Grupos “Ervas que Eliminam a Mucosidade-Calor” e o Grupo “Ervas Aromáticas que Abrem os Orifícios”."
        case "Mucosidade-Frio Estorvando o Coração":
            sinais.text = "Resmungar, afasia, depressão, introversão, fixar os olhos em paredes, estupor letárgico, ruídos na garganta, perda repentina na consciência, pulso lento, escorregadio, língua com revestimento branco gorduroso."
            exemplo.text = "Afasia, Retardo Mental em Crianças, Retardo da Fala em Crianças, Seqüelas de AVC, Distúrbio do Humor Bipolar (fase Yin), Síndrome do Pânico."
            tratamento.text = "Eliminar a Mucosidade Frio com o Grupo “Ervas que Transformam a Fleugma-Frio” e Abrir os Orifícios do Coração com o Grupo “Ervas Aromáticas que Abrem os Orifícios”."
        case "Qi do Intestino Delgado Obstruído":
            sinais.text = "Dor violenta no abdômen, sem passagem de gases ou fezes, vômito de material fecal, pulso tenso, cheio, língua com saburra amarela gordurosa."
            exemplo.text = "Obstrução intestinal Aguda, Cólicas abdominais com ou sem Vômitos de Alimentos."
            tratamento.text = "Movimentar o Qi do Intestino Delgado com os Grupos de “Ervas que Aliviam a Estagnação de Alimentos” e “Laxativos Suaves e/ou Ervas que Purgam o Calor”."
        case "Calor Excessivo no Intestino Delgado":
            sinais.text = "Sinais de Fogo no Coração (agitação, ansiedade, rosto vermelho, insônia, delírio verbal, etc.) somados a sinais urinários (disúria, hematúria, queimação, ardência e dor na uretra)."
            exemplo.text = "Hematúria, Cistites Recidivantes acompanhadas de Insônia, Agitação."
            tratamento.text = "Retirar Calor dos Aquecedores Superior, Médio e Inferior com o Grupo “Ervas que Eliminam o Calor Intenso” e Acalmar o Shen com o Grupo “Substâncias que Acalmam o Espírito”."
        case "Deficiência de Qi no Pulmão":
            sinais.text = "Tosse e voz fraca, falta de vontade de falar, respiração curta e fraca agravadas pelo esforço, asma, catarro abundante, transparente e aquoso, fadiga, palidez, transpiração espontânea diurna, resistência diminuída a Xie Qi do tipo Vento-Frio, pulso fraco, língua pálida com revestimento fino branco."
            exemplo.text = "Bronquite, Asma, Tuberculose Pulmonar, Enfisema, Resfriado Comum, Alergias, Baixa Imunidade."
            tratamento.text = "Tonificar o Qi do Pulmão utilizando o Grupo de “Ervas Tônicas do Qi” e o Grupo de “Ervas Sudoríficas Amornantes”."
        case "Deficiência de Yin do Pulmão":
            sinais.text = "Sintomas de Deficiência de Yin Geral (sensação febril, transpiração noturna, sensação de calor nas palmas e plantas, malar corado, emagrecimento), tosse seca e improdutiva ou com catarro escasso e viscoso, às vezes com raivos de sangue, irritação e/ou secura na garganta, voz rouca e baixa, secura e descamação na pele, fissuras nasal, hemorragia nasal e pulmonar (Fogo no Pulmão)."
            exemplo.text = "Bronquite Crônica, Bronquiectasia, Faringite Crônica, Tuberculose Pulmonar, Psoríase, Urticária, Envelhecimento Precoce da Pele, Calos nas Cordas, Afonia por Esforço."
            tratamento.text = "Tonificar o Yin do Pulmão utilizando o Grupo “Ervas Tônicas do Yin”."
        case "Secura no Pulmão":
            sinais.text = "Os Sinais deste Padrão e também o Tratamento são quase idênticos ao do Padrão de Desarmonia anterior (Deficiência de Yin dos Rins). A Diferença é que o Padrão de Desarmonia “Secura no Pulmão” pode ocorrer sem a presença obrigatória da Deficiência de Yin do Pulmão ou do Yin Geral, bastando apenas que o clima favorece. Sendo portanto uma Síndrome Externa."
        case "Invasão do Pulmão pelo Vento-Frio":
            sinais.text = "Irritação ou incômodo na garganta, tosse aguda com catarro claro, abundante, calafrios e temor ao Frio, pulso lento e superficial, língua com saburra fina e branca."
            exemplo.text = "Resfriado Comum, Calafrios."
            tratamento.text = "Utilizar o Grupo de “Ervas Sudoríficas Amornantes (Para Expelir Vento-Frio) ou Ervas Sudoríficas Refrescantes (Para Expelir Vento-Calor)”."
        case "Invasão do Pulmão pelo Vento-Calor":
            sinais.text = "Garganta vermelha, inflamada, sede e tosse aguda com catarro abundante e amarelo, febre, pulso rápido e superficial, língua com saburra amarela e fina."
            exemplo.text = "Fases Agudas ou na Agudização de Doenças Crônicas do tipo Resfriado Comum, Pneumonia, Bronquite, Amigdalite, Faringite."
            tratamento.text = "Utilizar o Grupo de “Ervas Sudoríficas Amornantes (Para Expelir Vento-Frio) ou Ervas Sudoríficas Refrescantes (Para Expelir Vento-Calor)”."
        case "Retenção de Mucosidade no Pulmão":
            sinais.text = "Tosse ou Asma com catarro abundante, ruídos na garganta, congestão torácica, ora perda de apetite, náuseas e vômitos, pulso escorregadio, língua com saburra grossa. Além disso, pode haver sinais de Calor ou Frio, dependendo do Padrão ter tido sua origem em Umidade-Frio ou Umidade-Calor."
            exemplo.text = "Bronquite Crônica, Asma Brônquica, Enfisema, Bronquiectasia."
            tratamento.text = "Expelir ou Drenar a Mucosidade do Pulmão com os Grupos “Ervas que Expelem a Fleuma-Calor e/ou Ervas que Expelem a Fleuma-Frio e Ervas que Aliviam a Tosse e a Dispnéia”."
        case "Abcesso Intestinal - Intestino Grosso":
            sinais.text = "Este Padrão origina-se do comer irregularmente, misturando Frio e Calor no abdômen, e excesso de atividade logo após alimentar-se. A Umidade-Calor pode ir se acumulando no Intestino, obstruindo a Circulação de Qi e Sangue, podendo formar o Abscesso Intestinal (Apendicite Aguda)."
            exemplo.text = "Apendicite Aguda."
            tratamento.text = "Drenar a Umidade-Calor e Toxinas com os Grupos “Ervas que Eliminam Calor-Umidade e Ervas que Eliminam Calor-Toxinas”."
        case "Umidade-Calor Invadindo o Intestino Grosso":
            sinais.text = "Diarréia de início agudo, com tenesmo e necessidade urgente de defecar, fezes com cheiro putrefado, às vezes, com pus ou sangue, sensação de ardência no ânus, pode haver sede, acompanhada de urina escassa e escura, febre e outros sintomas de Calor, pulso escorregadio e rápido, língua vermelha com revestimento amarelo e gorduroso."
            exemplo.text = "Desinteria Bacteriana, Gastroenterites Agudas, Hepatite."
            tratamento.text = "Utilizar o Grupo “Ervas que Eliminam Calor e Umidade e Ervas que Promovem a Circulação de Qi”."
        case "Prisão de Ventre e Diarréia - Intestino Grosso":
            sinais.text = "A Prisão de Ventre na M.T.C está relacionada ao Calor que pode ser originado de diversos órgãos e à Deficiência de Sangue. Portanto o Tratamento deste sinal precisa obedecer a um Padrão de Desarmonia diagnosticado para se obter efeitos mais sólidos. O mesmo ocorre com a Diarréia, que pode ser originada de uma Estagnação de Qi do Fígado, Invasão de Frio ao Estômago, Deficiência de Yang do Baço, Deficiência de Yang dos Rins, precisando que se faça um Diagnóstico com Diferenciação de Síndromes."
            tratamento.text = "Consiste em Fazer a Diferenciação das Síndromes, para se chegar a um Padrão de Desarmonia. Para a Diarréia-Fria: Usaremos o Grupo “Ervas que Aquecem o Interior e Expelem o Frio”. E para a Prisão de Ventre, usaremos os Grupos “Laxativos Suaves, Laxativos Drásticos e Laxativos que Purgam o Calor”, associados à “Ervas Tônicas do Yin e/ou Ervas Tônicas do Sangue”."
        case "Síndrome Bi-Frio":
            sinais.text = "Dores intensas, agravadas pelo Frio, melhoradas pelo Calor, geralmente unilateral, não migratória, região da dor é fria à palpação, movimentos limitados, pulso tenso, língua com saburra branca."
            exemplo.text = "Artrite reumatóide, dor Ciática, dor articular, lombalgia, lombalgia de gestante, reumatismo, ombro congelado."
            tratamento.text = "Aquecer e Favorecer o Fluxo de Qi e Sangue na região para aliviar a Dor, usando o Grupo de “Ervas Anti-reumáticas que Expelem Vento e Umidade“ e “Ervas que Aquecem o Interior e Expulsam o Frio.”"
        case "Síndrome Bi-Calor":
            sinais.text = "Sinais inflamatórios locais, com dor e calor local, vermelhidão em uma ou várias articulações, a dor piora com a palpação, possível febre e sede aumentadas, pulso rápido, língua vermelha, sem saburra ou com saburra amarela."
            exemplo.text = "Dores com sinais inflamatórios (edema, hiperemia, calor local), piora com o movimento, gota, fibromialgia generalizada, reumatismo, artrite aguda, artroses."
            tratamento.text = "Eliminar a Dor com o Grupo “Ervas Anti-Reumáticas que Expelem o Vento-Umidade” e Tonificar o Yin e o Xue (Sangue) com o Grupo “Ervas Tônicas do Yin e Ervas Tônicas do Sangue”."
        case "Síndrome Bi-Umidade":
            sinais.text = "Dor fixa, com sensação de peso, inchaço de músculos e articulações, parestesias; a dor piora com o Frio e a Chuva; pulso lento, língua com saburra branca e úmida."
            exemplo.text = "Artrite Reumatóide, bursite, edemas de membros inferiores com peso e/ou dor, processos dolorosos com edemas."
            tratamento.text = "Eliminar a dor com o Grupo “Ervas que Eliminam o Vento e a Umidade” e o Grupo de “Ervas que Eliminam a Umidade”."
        case "Síndrome Bi-Vento":
            sinais.text = "Dores migratórias, variando de articulações ou grupos musculares; em casos agudos pode aparecer febre, aversão ao Vento, pulso rápido e superficial."
            exemplo.text = "Parestesias, dores migratórias, paraplegias, hemiplegias, neuralgias, seqüelas de AVC, reumatismos ou artrites com sinais de deficiências."
            tratamento.text = "Eliminar a Dor e o Vento com o Grupo “Ervas Anti-Reumáticas que Eliminam o Vento e a Umidade” e o Grupo “Substâncias Anti-Convulsivas que Controlam o Vento do Fígado”."
        case "Síndrome Bi-Óssea":
            sinais.text = "É um agravamento de qualquer um dos 4 Padrões Bi anteriores (Frio, Calor, Umidade e/ou Vento). O bloqueio persistente das articulações gera retenção de fluídos corpóreos que se transformam em Mucosidade. Está obstrução pode atingir Vasos Sanguíneos e órgãos (gerando Necrose). A Mucosidade dificultando a circulação e nutrição local, vai gerando atrofia muscular, inchaço, deformidade de ossos e articulações."
            exemplo.text = "Artrite Reumatóide, Espondilite Anquilosante, Artroses."
            tratamento.text = "Deve ser feito o diagnóstico dos Padrões Bi envolvidos (geralmente todos os descritos anteriormente), fazendo-se uma somatória das principais substâncias de cada Patenteado, ou então começando com um Patenteado mais efetivo para o Padrão mais evidente no estágio atual da desarmonia."
        case "Vazio de Qi":
            sinais.text = "Esse Padrão expressa uma diminuição da atividade fisiológica do Zang-Fu. Vertigens, ofuscação das vistas, respiração curta embaraçando a conversa, esgotamento físico e mental, transpiração espontânea. Todos esses sintomas são agravados pelo esforço. Língua pálida, pulso vazio e sem força."
            exemplo.text = "As causas principais do Vazio de Qi: a senilidade, desregramento alimentar, as doenças graves de longa duração que vão exaurindo o Qi da pessoa. A Desarmonia é causada por insuficiência de Qi -> Yang Qi (Energia Original, dos Rins e Baço): Diminuição da atividade fisiológica normal (falta Qi para gerar movimento, vitalidade), astenia (falta Qi para gerar movimento, vitalidade). Wei Qi (Energia de Defesa, Pulmões): Os poros cutâneos não se podem fechar (não há Qi para gerar contração e fechamento), daí há transpiração espontânea, respiração curta que embaraça a conversa (Zhong Qi não está sendo formado). Yong Qi (Energia de Nutrição, Baço e Pulmões): A língua pálida (falt Qi para impulsionar o Xue até a língua), o pulso vazio, sem força (o Qi não movimenta bem o Xue, nem tonifica os vasos)”."
            tratamento.text = "Tonificar a Energia (Qi), utilizando “Ervas Tônicas do Qi”."
        default:
            return
        }
    }

}
