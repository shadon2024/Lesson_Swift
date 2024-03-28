//
//  FinishViewController.swift
//  modul_13
//
//  Created by Admin on 28.03.2024.
//

import UIKit

class FinishViewController: UIViewController {
    
    let alertButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //print("viewDidLoad")
        setupViews()
        setupConstrains()
        //view.backgroundColor = .systemGreen
    }
    
    private func setupViews() {
        title = "Finish"
        view.backgroundColor = .white
        

        
        alertButton.setTitle("Alert", for: .normal)
        alertButton.setTitleColor(.black, for: .normal)
        
        alertButton.addAction(
            UIAction(
                handler: { [weak self] _ in
                    let alert = self?.createAlert() ?? UIAlertController()
                    self?.present(
                        alert,
                        animated: true,
                        completion: nil
                    )
                    // self?.navigationController?.popViewController(animated: true)
                }),
                for: .touchUpInside
            )
        
        view.addSubview(alertButton)
    }
    
    private func setupConstrains() {
        alertButton.translatesAutoresizingMaskIntoConstraints = false
        alertButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        alertButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
//    deinit {
//        print("deinit")
//    }
    
    
    private func createAlert() -> UIAlertController {
        let alert = UIAlertController(
            title: "Do you learn Swift?",
            message: "It's recomended you to learn Swift before continuing.",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        
        //self.persent(alert, animated: true)
        
        return alert
    }
    

}

//extension FinishViewController {
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        print("viewWillAppear")
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        print("viewDidAppear")
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        print("viewWillDisappear")
//    }
//
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//        print("viewDidDisappear")
//    }
//
//    override func loadView() {
//        super.loadView()
//        print("loadView")
//    }
//
//
//}

