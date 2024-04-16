//
//  DetailViewController.swift
//  modul_14
//
//  Created by Admin on 06/04/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    var nameText: String?
    var surnameText: String?
    
    lazy var nameLbl1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = model.name
        return label
    }()

    let contactsService = ContactsService()
    
    
    var model: UserInfo

    init(model: UserInfo) {
        self.model = model
        super.init(nibName: nil, bundle: nil)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(nameLbl1)
        view.backgroundColor = .white
        NSLayoutConstraint.activate([
            nameLbl1.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nameLbl1.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
    


    
}


