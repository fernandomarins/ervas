//
//  ElementsViewController.swift
//  Ervas
//
//  Created by Fernando Augusto de Marins on 07/07/20.
//  Copyright © 2020 Fernando Augusto de Marins. All rights reserved.
//

import UIKit

struct ElementsData {
    var backgroundImage: UIImage
}

class ElementsViewController: UIViewController {
    
    // Array contendo as células que serão adicionadas
    fileprivate let data = [
        ElementsData(backgroundImage: #imageLiteral(resourceName: "foogo")),
        ElementsData(backgroundImage: #imageLiteral(resourceName: "terraa")),
        ElementsData(backgroundImage: #imageLiteral(resourceName: "metall")),
        ElementsData(backgroundImage: #imageLiteral(resourceName: "águaa")),
        ElementsData(backgroundImage: #imageLiteral(resourceName: "madeiraa")),
        ElementsData(backgroundImage: #imageLiteral(resourceName: "emocoes"))
    ]
    
    // Criando a collection view programatically
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        layout.minimumLineSpacing = 20
        cv.register(ElementCollectionCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "ELEMENTOS"
        
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // Importante adicionar as constraints
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: view.frame.width * 2).isActive = true
        
        //            let refreshButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshTime))
        //            refreshButton.tintColor = .white
        
        //            navigationItem.rightBarButtonItem = refreshButton
        
        let backButton = UIBarButtonItem(title: "TODOS", style: .plain, target: nil, action: nil)
        backButton.tintColor = .white
        // Trocando nome do back buttom da view que será pushed
        navigationItem.backBarButtonItem = backButton
    }
}

extension ElementsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.width/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ElementCollectionCell
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
        default:
            performSegue(withIdentifier: "toEmocoes", sender: self)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
    }
}

class ElementCollectionCell: UICollectionViewCell {
    
    // Adicionado para setar a imagem
    var data: ElementsData? {
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
