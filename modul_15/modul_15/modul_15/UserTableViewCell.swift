//
//  UserTableViewCell.swift
//  modul_15
//
//  Created by Admin on 17/04/24.
//

import UIKit

class UserTableViewCell: UITableViewCell {



    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = Radius.user
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Fonts.headerFont
        return label
    }()
    
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Fonts.textFont
        //label.backgroundColor = .red
        return label
    }()
    
    
    private lazy var rightLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Fonts.rightFont
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    override func prepareForReuse() {
        avatarImageView.image = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(with user: User) {
        avatarImageView.image = user.avatarImage
        titleLabel.text = user.name
        subtitleLabel.text = user.lastName
        subtitleLabel.numberOfLines = 0
        rightLabel.text = user.age
        //avatarImageView.layer.cornerRadius = 50
    }
    
    private func setupLayout() {
        
        guard avatarImageView.superview == nil else { return }
        
        let mainStackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        mainStackView.axis = .vertical
        mainStackView.distribution = .fillEqually
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        //mainStackView.alignment = .center
        
        
        contentView.addSubview(avatarImageView)
        contentView.addSubview(mainStackView)
        contentView.addSubview(rightLabel)
        
        NSLayoutConstraint.activate([
            avatarImageView.heightAnchor.constraint(equalToConstant: 50),
            avatarImageView.widthAnchor.constraint(equalToConstant: 50),
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            avatarImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            //mainStackView.leadingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 16),
            mainStackView.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            rightLabel.leadingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            rightLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            //rightLabel.centerYAnchor.constraint(equalTo: mainStackView.centerYAnchor),
            rightLabel.topAnchor.constraint(equalTo: mainStackView.topAnchor, constant: 5)
        ])
        
        
        
    }
    
    
//    private func setupConstraints() {
//        self.tableView.addSubview(tableView)
//                tableView.snp.makeConstraints { make in
//                    make.topMargin.equalTo(tableView.snp.topMargin);
//                    make.leftMargin.equalTo(tableView.snp.leftMargin);
//                    make.bottomMargin.equalTo(tableView.snp.bottomMargin);
//                    make.rightMargin.equalTo(tableView.snp.rightMargin)
//                }
//    }
    
}


extension UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
