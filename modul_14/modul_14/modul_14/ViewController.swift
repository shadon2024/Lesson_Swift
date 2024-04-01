//
//  ViewController.swift
//  modul_14
//
//  Created by Admin on 31.03.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var headerLable: UILabel!
    
    // экземпляр класса
    let contactsService = ContactsService()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // id
        tableView.register( UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
    }

    
    func showAlertInfo(width title: String, message: String?) {
        
        let alertVc = UIAlertController (
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let action = UIAlertAction(title: "OK", style: .default)
        
        alertVc.addAction(action)
        self.present(alertVc, animated: true)
    }

}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // get Keys
        let keys = contactsService.getKeys()
        return keys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // количчество секции
        
        let key = contactsService.getKeys()[section]
        let contacts = contactsService.getContacts(by: key)
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //indexPath.section // index секции
        //indexPath.row     // index строки string
        
        let nativeCell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        let key = contactsService.getKeys()[indexPath.section]
        let contact = contactsService.getContacts(by: key)[indexPath.row]
        
        var configuration = UIListContentConfiguration.cell()
        configuration.text = contact.name + " " + (contact.surname ?? "")
        configuration.secondaryText = contact.phone
        
//        switch indexPath.row {
//        case 1:
//            nativeCell.backgroundColor = .systemGreen
//        default:
//            break
//        }
//
//        switch indexPath.section {
//        case 1:
//            configuration.textProperties.font = .italicSystemFont(ofSize: 15)
//        default:
//            break
//        }
        
        
        nativeCell.contentConfiguration = configuration
        return nativeCell
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let key = contactsService.getKeys()[section]
        return key
    }
    
    // удаления контактов
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        switch editingStyle {
        case .delete:
            let key = contactsService.getKeys()[indexPath.section]
            let contact = contactsService.getContacts(by: key)[indexPath.row]
            
            contactsService.removeContact(contact)
            
            if contactsService.getContacts(by: key).isEmpty {
                tableView.deleteSections([indexPath.row], with: .automatic)
            } else {
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            
        default:
            break
        }
    }
    
}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.backgroundColor = .link
        
        // пользователь отображался в ячейке
        let key = contactsService.getKeys()[indexPath.section]
        let contact = contactsService.getContacts(by: key)[indexPath.row]
        
        showAlertInfo(
            width: contact.name + " " + (contact.surname ?? ""),
            message: contact.phone)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.backgroundColor = .darkGray
    }
}
