//
//  CustomViewController.swift
//  m_14
//
//  Created by Admin on 03/04/24.
//

import UIKit

class CustomViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let contactsService = ContactsService()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.register(UINib(nibName: "CustomTableCell", bundle: nil), forCellReuseIdentifier: "CustomTableCell")
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomTableViewCell")
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
        let customCell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell
        customCell?.configure(width: contact)
        return customCell ?? nativeCell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let key = contactsService.getKeys()[section]
        return key
    }

}
