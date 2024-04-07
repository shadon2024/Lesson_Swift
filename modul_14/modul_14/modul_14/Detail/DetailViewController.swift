//
//  DetailViewController.swift
//  modul_14
//
//  Created by Admin on 06/04/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var iconImg: UIImageView!
    @IBOutlet private weak var nameLbl: UILabel!
    @IBOutlet private weak var surnameLbl: UILabel!
    @IBOutlet private weak var phoneNumber: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var birthday: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var idUser: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var icon =  UIImageView()
    var nameText: String?
    var surnameText: String?
    var phoneNam: String?
    
//    lazy var nameLbl1: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        //label.text = model.name
//        return label
//    }()

    let contactsService = ContactsService()
    
    
//    var model: UserInfo
//
//    init(model: UserInfo) {
//        self.model = model
//        super.init(nibName: nil, bundle: nil)
//
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        iconImg.image = UIImage(named: "")
        nameLbl.text = nameText
        surnameLbl.text = surnameText
        phoneNumber.text = phoneNam

//        view.addSubview(nameLbl1)
//        view.backgroundColor = .white
//        NSLayoutConstraint.activate([
//            nameLbl1.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            nameLbl1.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//        ])
        
    }
    


    
}


