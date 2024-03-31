//
//  TwoScreenTwo.swift
//  m_13_2
//
//  Created by Admin on 31.03.2024.
//

import UIKit

class TwoScreenTwo: UIViewController {

    let buttonOne = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemRed

        
        setupViews()
        setupConstrains()
    }
    

    private func setupViews()  {
        
        title = "TwoButtonTwo"
        buttonOne.setTitle("TwoButtonTwo", for: .normal)
        buttonOne.setTitleColor(.black, for: .normal)
        buttonOne.addAction(UIAction(handler: { [weak self] _ in
        let alert = self?.createAlert() ?? UIAlertController()
            self?.present(
                alert,
                animated: true,
                completion: nil
            )
            
        }), for: .touchUpInside)
        
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


