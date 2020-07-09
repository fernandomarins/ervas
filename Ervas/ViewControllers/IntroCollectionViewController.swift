//
//  IntroCollectionViewController.swift
//  Ervas
//
//  Created by Fernando Augusto de Marins on 03/07/20.
//  Copyright © 2020 Fernando Augusto de Marins. All rights reserved.
//

import UIKit

//https://www.youtube.com/watch?v=k90V115zqRk

struct CustomData {
    var backgroundImage: UIImage
}

class IntroCollectionViewController: UIViewController {
    
    lazy var date = Date()
    lazy var calendar = Calendar.current
    
    fileprivate let data = [
        CustomData(backgroundImage: #imageLiteral(resourceName: "ervas")),
        CustomData(backgroundImage: #imageLiteral(resourceName: "padrões")),
        CustomData(backgroundImage: #imageLiteral(resourceName: "med")),
        CustomData(backgroundImage: #imageLiteral(resourceName: "elementos")),
        CustomData(backgroundImage: #imageLiteral(resourceName: "ficha"))
    ]
    
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        layout.minimumLineSpacing = 20
        cv.register(CustomCollectionCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    
    fileprivate let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 13)
        label.textColor = .white
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "FITOTERAPIA"
        
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 140).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: view.frame.width * 2).isActive = true
        
        view.addSubview(label)
        label.bottomAnchor.constraint(equalTo: collectionView.topAnchor, constant: -15).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        
        let refreshButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshTime))
        refreshButton.tintColor = .white
        
        navigationItem.rightBarButtonItem = refreshButton
        
        let backButton = UIBarButtonItem(title: "TODOS", style: .plain, target: nil, action: nil)
        backButton.tintColor = .white
        // Trocando nome do back buttom da view que será pushed
        navigationItem.backBarButtonItem = backButton
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // ADICIONAR ALGO PARA MOSTRAR A ESTAÇÃO E O ELEMENTO MAIS UTILIZADO
        refreshTime()
    }
    
    @objc func refreshTime() {
        let hour = calendar.component(.hour, from: date)
        switch hour {
        case 1:
            label.text = "MERIDIANO ATUANTE: FÍGADO"
        case 2:
            label.text = "MERIDIANO ATUANTE: FÍGADO"
        case 3:
            label.text = "MERIDIANO ATUANTE: PULMÃO"
        case 4:
            label.text = "MERIDIANO ATUANTE: PULMÃO"
        case 5:
            label.text = "MERIDIANO ATUANTE: INTESTINO GROSSO"
        case 6:
            label.text = "MERIDIANO ATUANTE: INTESTINO GROSSO"
        case 7:
            label.text = "MERIDIANO ATUANTE: ESTÔMAGO"
        case 8:
            label.text = "MERIDIANO ATUANTE: ESTÔMAGO"
        case 9:
            label.text = "MERIDIANO ATUANTE: BAÇO-PÂNCREAS"
        case 10:
            label.text = "MERIDIANO ATUANTE: BAÇO-PÂNCREAS"
        case 11:
            label.text = "MERIDIANO ATUANTE: CORAÇÃO"
        case 12:
            label.text = "MERIDIANO ATUANTE: CORAÇÃO"
        case 13:
            label.text = "MERIDIANO ATUANTE: INTESTINO DELGADO"
        case 14:
            label.text = "MERIDIANO ATUANTE: INTESTINO DELGADO"
        case 15:
            label.text = "MERIDIANO ATUANTE: BEXIGA"
        case 16:
            label.text = "MERIDIANO ATUANTE: BEXIGA"
        case 17:
            label.text = "MERIDIANO ATUANTE: RIM"
        case 18:
            label.text = "MERIDIANO ATUANTE: RIM"
        case 19:
            label.text = "MERIDIANO ATUANTE: CIRCULAÇÃO-SEXO"
        case 20:
            label.text = "MERIDIANO ATUANTE: CIRCULAÇÃO-SEXO"
        case 21:
            label.text = "MERIDIANO ATUANTE: TRIPLO AQUECEDOR"
        case 22:
            label.text = "MERIDIANO ATUANTE: TRIPLO AQUECEDOR"
        case 23:
            label.text = "MERIDIANO ATUANTE: VESÍCULA BILIAR"
        default:
            label.text = "MERIDIANO ATUANTE: VESÍCULA BILIAR"
        }
    }
}

extension IntroCollectionViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.width/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionCell
        cell.data = data[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.item {
        case 0:
            performSegue(withIdentifier: "toErvas", sender: self)
        case 1:
            performSegue(withIdentifier: "toOrgaos", sender: self)
        case 2:
            performSegue(withIdentifier: "toMeridianos", sender: self)
        case 3:
            performSegue(withIdentifier: "toElements", sender: self)
        case 4:
            performSegue(withIdentifier: "toAvaliacao", sender: self)
        default:
            performSegue(withIdentifier: "toErvas", sender: self)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
    }
}

class CustomCollectionCell: UICollectionViewCell {
    
    var data: CustomData? {
        didSet {
            guard let data = data else { return }
            bg.image = data.backgroundImage
        }
    }
    
    fileprivate let bg: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 12
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        contentView.addSubview(bg)
        
        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bg.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        bg.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
