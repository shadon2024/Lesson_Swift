//
//  ViewController.swift
//  m_14
//
//  Created by Admin on 01.04.2024.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var headerLabel: UITableView!
    let contactsService = ContactsService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.dataSource = self
    }


}


extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        let keys = contactsService.getKeys()
        return keys.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = contactsService.getKeys()[section]
        let contacts = contactsService.getContacts(by: key)
        return contacts.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let nativeCell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        let key = contactsService.getKeys()[indexPath.section]
        let contact = contactsService.getContacts(by: key)[indexPath.row]
        
        var configuration = UIListContentConfiguration.cell()
        configuration.text = contact.name + " " + (contact.surname ?? "") //+ " " + (contact.city ?? "")
        configuration.image = (UIImage(systemName: "phone" ))
        //configuration.image = UIImage(systemName: "house")
//        configuration.secondaryText = (
//            (contact.phone ?? "")  + " " + (contact.email ?? "")
//        )
        //configuration.secondaryText = contact.phone.
        //contact.city. = UIImage(systemName: "phone")
        
        nativeCell.contentConfiguration = configuration
        return nativeCell
    }
    
//    func configure(width model: UserInfo)  {
//        name.text = model.name
//        surnameLabel.text = model.surname
//        phoneLabel.text = model.phone
//
//        surnameLabel.isHidden = model.surname == nil
//    }
    
}
