//
//  NextViewController.swift
//  m_13_2
//
//  Created by Admin on 29.03.2024.
//

import UIKit

class TwoScreenOne: UIViewController {

    let buttonOne = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .cyan
        
        setupViews()
        setupConstrains()
    }
    

    private func setupViews()  {
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Exit", style: .plain, target: nil, action: nil)
        buttonOne.setTitle("TwoButtonOne", for: .normal)
        buttonOne.setTitleColor(.black, for: .normal)
        buttonOne.addAction(UIAction(handler: { [weak self] _ in
            self?.navigationController?.pushViewController( TwoScreenTwo(), animated: true)
            }),
            for: .touchUpInside)
        
        view.addSubview(buttonOne)
        
    }
    
    
    func createAlert() -> UIAlertController {
        let alert = UIAlertController(
            title: "Warning! This is the last screen.",
            message: "Do you want to close it?",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
        return alert
    }
    
    
    private func setupConstrains() {
            buttonOne.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                buttonOne.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                buttonOne.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                buttonOne.heightAnchor.constraint(equalToConstant: 80),
                buttonOne.widthAnchor.constraint(equalToConstant: 300)
            ])
        }
}


