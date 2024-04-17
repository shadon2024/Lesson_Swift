//
//  ViewController.swift
//  modul_15
//
//  Created by Admin on 16/04/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
        table.delegate = self
        table.register(UserTableViewCell.self, forCellReuseIdentifier: UserTableViewCell.reuseIdentifier)
        return table
    }()
    
    var dataSource: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .purple
        
        dataSource = Array(repeating: User(name: Text.name,
                                           lastName: Text.subName,
                                           age: Text.rightText,
                                           avatarImage: UIImage(named: "avatar")), count: 3)
        view.addSubview(tableView)
        
        setupConstraints()
    }

    
    private func setupConstraints() {
        //self.tableView.addSubview(tableView)
//        tableView.snp.makeConstraints { make in
//            make.topMargin.equalTo(tableView.snp.topMargin);
//            make.leftMargin.equalTo(tableView.snp.leftMargin);
//            make.bottomMargin.equalTo(tableView.snp.bottomMargin);
//            make.rightMargin.equalTo(tableView.snp.rightMargin)
//        }
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
     
    

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.reuseIdentifier, for: indexPath) as! UserTableViewCell
        
        let user = dataSource[indexPath.row]
        cell.configureCell(with: user)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        77
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.backgroundColor = .white
    }
}
