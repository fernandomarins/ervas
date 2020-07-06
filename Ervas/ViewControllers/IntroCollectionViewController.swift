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
    var title: String
    var backgroundImage: UIImage
}

class IntroCollectionViewController: UIViewController {
    
    fileprivate let data = [
        CustomData(title: "ERVAS", backgroundImage: #imageLiteral(resourceName: "fotoerva")),
        CustomData(title: "PADRÕES", backgroundImage: #imageLiteral(resourceName: "fotoelementos1")),
        CustomData(title: "MERIDIANOS", backgroundImage: #imageLiteral(resourceName: "fotoerva"))
        //CustomData(title: "ELEMENTOS", backgroundImage: #imageLiteral(resourceName: "fotoelementos1"))
    ]
    
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        layout.minimumLineSpacing = 20
        cv.register(CustomCollectionCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "FITOTERAPIA"
        
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: view.frame.width * 2).isActive = true
        
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
        cell.data = self.data[indexPath.item]
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
            text.text = data.title
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
    
    fileprivate let text: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont(font: .SFUIDisplay, weight: .bold, size: 18)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        contentView.addSubview(bg)
        contentView.addSubview(text)
        
        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bg.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        bg.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        let margins = contentView.layoutMarginsGuide
        text.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        text.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -5).isActive = true
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
