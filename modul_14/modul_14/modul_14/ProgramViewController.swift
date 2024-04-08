//
//  ProgramViewController.swift
//  modul_14
//
//  Created by Admin on 01.04.2024.
//

import UIKit

class ProgramViewController: UIViewController {

    private let tableView = UITableView(frame: .zero, style: .insetGrouped)
    private let labelContainer = UIView()
    private let headerLabel = UILabel()
    let contactsService = ContactsService()
    


    
    var infoUser: [UserInfo] = []
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")

        tableView.register(ProgramTableCell.self, forCellReuseIdentifier: "ProgramTableCell")

        tableView.dataSource = self
        tableView.delegate = self
        
        setupConstraints()
        setupViews()

    }
    
    private func setupConstraints() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(
            item: tableView,
            attribute: .top,
            relatedBy: .equal,
            toItem: view,
            attribute: .top,
            multiplier: 1,
            constant: 0
        ).isActive = true
        
        NSLayoutConstraint(
            item: tableView,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: view,
            attribute: .bottom,
            multiplier: 1,
            constant: 0
        ).isActive = true
        
        
        NSLayoutConstraint(
            item: tableView,
            attribute: .leading,
            relatedBy: .equal,
            toItem: view,
            attribute: .leading,
            multiplier: 1,
            constant: 0
        ).isActive = true
        
        NSLayoutConstraint(
            item: tableView,
            attribute: .right,
            relatedBy: .equal,
            toItem: view,
            attribute: .right,
            multiplier: 1,
            constant: 0
        ).isActive = true
        
        
        tableView.tableHeaderView = labelContainer
        labelContainer.frame = CGRect(x: 0, y: 0, width: 200, height: 70)
        
        
        labelContainer.addSubview(headerLabel)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(
            item: headerLabel,
            attribute: .top,
            relatedBy: .equal,
            toItem: headerLabel.superview,
            attribute: .top,
            multiplier: 1,
            constant: 0
        ).isActive = true
        
        
        
        NSLayoutConstraint(
            item: headerLabel,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: headerLabel.superview,
            attribute: .bottom,
            multiplier: 1,
            constant: -20
        ).isActive = true
        
        NSLayoutConstraint(
            item: headerLabel,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: headerLabel.superview,
            attribute: .centerX,
            multiplier: 1,
            constant: 0
        ).isActive = true
        
    }
    
    private func setupViews() {
        headerLabel.text = "Контакты"
        headerLabel.font = Fonts.contactFont
        headerLabel.textColor = colorHeaderOne
        headerLabel.textAlignment = .center
    }

    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showVC" {
//            if let vc = segue.destination as? DetailViewController,
//               let indexPath = tableView.indexPathForSelectedRow {
//                let key = contactsService.getKeys()[indexPath.section]
//                let contact = contactsService.getContacts(by: key)[indexPath.row]
//                // vc.info = contact
//                // error: Value of type 'DetailViewController' has no member 'info'
//                vc.nameText = contact.name
//            }
//        }
//    }
}


extension ProgramViewController: UITableViewDataSource {
    
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
        
        let key = contactsService.getKeys()[indexPath.section]
        let contact = contactsService.getContacts(by: key)[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProgramTableCell", for: indexPath) as? ProgramTableCell else {
            return UITableViewCell()
        }
        cell.configure(width: contact)
        //cell.frame = CGRect(x: 0, y: 100, width: 0, height: 100)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (90.0)
    }

}

extension ProgramViewController: UITableViewDelegate {

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let key = contactsService.getKeys()[indexPath.section]
        let contact = contactsService.getContacts(by: key)[indexPath.row]

        tableView.deselectRow(at: indexPath, animated: true)

        let customCell = tableView.dequeueReusableCell(withIdentifier: "ProgramTableCell", for: indexPath) as? ProgramTableCell
        customCell?.configure(width: contact)

        let storybord = UIStoryboard(name: "Main", bundle: nil)

        guard let VC2 = storybord.instantiateViewController(identifier: "DetailViewControllerVC") as? DetailViewController  else  {
            return
        }

        VC2.icon.image =  UIImage(named: contact.imageName)
        VC2.nameText = contact.name
        VC2.surnameText = contact.surname
        VC2.phoneNam = contact.phone
        VC2.emailUs = contact.email
        VC2.birthdayUs = contact.birthDateString
        VC2.cityUs = contact.city
        VC2.userId = contact.id
        VC2.dateLbl = contact.infoCreationDate
        VC2.twoSurname = contact.name + " " + (contact.surname ?? "")
        VC2.twoPhone = contact.phone

        navigationController?.pushViewController(VC2, animated: true)
        present(VC2, animated: true)

    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        let info = infoUser[indexPath.row]
//        // error: Thread 1: Fatal error: Index out of range
//
//        self.performSegue(withIdentifier: "showVC", sender: info)
//    }
    
}
    

