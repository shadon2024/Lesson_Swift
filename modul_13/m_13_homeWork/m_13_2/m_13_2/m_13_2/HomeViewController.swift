//
//  ViewController.swift
//  m_13_2
//
//  Created by Admin on 29.03.2024.
//

import UIKit

class HomeViewController: UIViewController {

    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Tap Me", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue

        setupViews()
        setupConstrains()
        configureUI()

    }
    private func setupViews() {
    }
    private func setupConstrains() {
    }
    
    func configureUI() {
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 80),
            button.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    @objc func didTapButton() {
        self.navigationController?.pushViewController(NextViewController(), animated: true)
    }

    
}

//class OneViewController: UIViewController {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .red
//
//    }
//}
//
//class TwoViewController: UIViewController {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .blue
//
//    }
//}
//
//class ThreeViewController: UIViewController {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .green
//
//    }
//}

//extension ViewController {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .red
//        
//    }
//}


