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
        headerLabel.font = .boldSystemFont(ofSize: 24)
        headerLabel.textColor = .link
        //headerLabel.frame = CGRect( x: 30, y: 70, width: 100, height: 50)
        headerLabel.textAlignment = .center
    }

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
        
        
        let customCell = tableView.dequeueReusableCell(withIdentifier: "ProgramTableCell", for: indexPath) as? ProgramTableCell
        customCell?.configure(width: contact)
        
        return customCell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            85
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        headerLabel.frame = CGRect( x: 0, y: 0, width: 0, height: 200)
//        //headerLabel.textAlignment = .center
//
//        return headerLabel
//    }
    

}

extension ProgramViewController: UITableViewDelegate {

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let key = contactsService.getKeys()[indexPath.section]
        let contact = contactsService.getContacts(by: key)[indexPath.row]
        
        //segueToDetailController(with: )
        tableView.deselectRow(at: indexPath, animated: true)
 
        
        
        let customCell = tableView.dequeueReusableCell(withIdentifier: "ProgramTableCell", for: indexPath) as? ProgramTableCell
        customCell?.configure(width: contact)

        //let VC = DetailViewController(model: contact )
        //navigationController?.pushViewController(VC, animated: true)
        //present(VC, animated: true)
        
        
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        
                guard let vc2 = storybord.instantiateViewController(identifier: "DetailViewControllerVC") as? DetailViewController  else  {
                    return
                }
        vc2.nameText = contact.name
        vc2.surnameText = contact.surname
        vc2.phoneNam = contact.phone
                    //show(vc2, sender: nil)
        navigationController?.pushViewController(vc2, animated: true)
        present(vc2, animated: true)

    }
    
//    func segueToDetailController(with user: UserInfo) {
//
//
//        let storybord = UIStoryboard(name: "Main", bundle: nil)
//
//        guard let vc2 = storybord.instantiateViewController(identifier: "DetailViewControllerVC") as? DetailViewController  else  {
//            return
//        }
//        //vc2.nameText = user.name
//        //vc2.surnameText = user.surname
//            //show(vc2, sender: nil)
//        navigationController?.pushViewController(vc2, animated: true)
//    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        85
//    }

}
    

