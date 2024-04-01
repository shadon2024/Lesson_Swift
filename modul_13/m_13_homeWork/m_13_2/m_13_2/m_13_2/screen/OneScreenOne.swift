//
//  ButtonViewController.swift
//  m_13_2
//
//  Created by Admin on 30.03.2024.
//

import UIKit

class OneScreenOne: UIViewController {

    let buttonOne = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstrains()
    }
    

    private func setupViews()  {
        
        //title = "Start"
        //view.backgroundColor = .white
        
        //navigationItem.backBarButtonItem = UIBarButtonItem(title: "Custom", style: .plain, target: nil, action: nil)
        
        buttonOne.setTitle("OneButton", for: .normal)
        buttonOne.setTitleColor(.black, for: .normal)
        
        buttonOne.addAction(UIAction(handler: { [weak self] _ in
            
            // self?.navigationController.pushViewController(ViewController(),
            //self?.navigationController?.pushViewController( AlertViewController(), animated: true)
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
        //alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))

        return alert
    }
    
    
    
    private func setupConstrains() {
            //view.addSubview(buttonOne)
            buttonOne.translatesAutoresizingMaskIntoConstraints = false
    
    
            NSLayoutConstraint.activate([
                buttonOne.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                buttonOne.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                buttonOne.heightAnchor.constraint(equalToConstant: 80),
                buttonOne.widthAnchor.constraint(equalToConstant: 300)
            ])
        }
    
    
    
//        @objc func didTapButton() {
//            self.navigationController?.pushViewController( createAlert(), animated: true)
//        }


}


