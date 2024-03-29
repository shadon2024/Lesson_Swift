//
//  NextViewController.swift
//  m_13_2
//
//  Created by Admin on 29.03.2024.
//

import UIKit

class NextViewController: UIViewController {

    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .cyan

        setupViews()
        setupConstrains()

    }
    
    private func setupViews() {
        button.setTitle("Tap", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.tintColor = .red
        
        view.addSubview(button)
    }
        
    private func setupConstrains() {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    


    
}


