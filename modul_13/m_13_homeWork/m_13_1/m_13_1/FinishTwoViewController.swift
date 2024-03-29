//
//  FinishTwoViewController.swift
//  m_13_1
//
//  Created by Admin on 29.03.2024.
//

import UIKit

class FinishTwoViewController: UIViewController {
    
    @IBOutlet weak var Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstrains()
    }
    
    private func setupViews() {
        
        //Button.setTitle("Button", for: .normal)
        //Button.setTitleColor(.systemBlue, for: .normal)

        Button.addAction(
            UIAction(
                handler: { [weak self] _ in
                    let alert = self?.createAlert() ?? UIAlertController()
                    self?.present(
                        alert,
                        animated: true,
                        completion: nil
                    )
                }),
                for: .touchUpInside
            )
        
        view.addSubview(Button)
    }
    
    private func setupConstrains() {
        Button.translatesAutoresizingMaskIntoConstraints = false
        Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        Button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    private func createAlert() -> UIAlertController {
        let alert = UIAlertController(
            title: "Warning! This is the last screen.",
            message: "Do you want to close it?",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
        //alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        
        return alert
    }
}


