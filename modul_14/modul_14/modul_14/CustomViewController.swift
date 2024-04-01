//
//  CustomViewController.swift
//  modul_14
//
//  Created by Admin on 01.04.2024.
//

import UIKit

class CustomViewController: UIViewController {

    
    
    @IBOutlet weak var tableView: UITableView!
    
    let contactsService = ContactsService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // зарегистрируем в таблицу
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.register(UINib(nibName: "CustomTableCell", bundle: nil), forCellReuseIdentifier: "CustomTableCell")
        tableView.dataSource = self
        
    }
    


}

extension CustomViewController: UITableViewDataSource {
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
        configuration.text = contact.name + " " + (contact.surname ?? "")
        configuration.secondaryText = contact.phone
        
        nativeCell.contentConfiguration = configuration
        
        // получить ячейку
        let customCell = tableView.dequeueReusableCell(withIdentifier: "CustomTableCell", for: indexPath) as? CustomTableCell
        customCell?.configure(width: contact)
        
        if contact.name == "Андрей" {
            customCell?.backgroundColor = .red
        }
        
        
        switch indexPath.section {
        case 0:
            return nativeCell
        default:
            return customCell ?? nativeCell
        }
        
        //return customCell ?? nativeCell
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let key = contactsService.getKeys()[section]
        return key
    }
}
