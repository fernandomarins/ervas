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
    
    let avaliacaoTableView = UITableView()
    
    let arrayTest = ["Teste", "Teste", "Teste"]
    
    override func loadView() {
        super.loadView()
        setupTableView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setupTableView()
        
        avaliacaoTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        avaliacaoTableView.dataSource = self
        avaliacaoTableView.delegate = self
        
        let button = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(dismissVC))
        button.tintColor = .white
        
        navigationItem.rightBarButtonItem = button
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayTest.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = arrayTest[indexPath.row]
        return cell
    }
    
    @objc func dismissVC() {
        dismiss(animated: true, completion: nil)
    }
    
    // Setar table view
    func setupTableView() {
        view.addSubview(avaliacaoTableView)
        avaliacaoTableView.backgroundColor = .white
        avaliacaoTableView.translatesAutoresizingMaskIntoConstraints = false
        avaliacaoTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = false
        avaliacaoTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = false
        avaliacaoTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = false
        avaliacaoTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = false
    }
}
