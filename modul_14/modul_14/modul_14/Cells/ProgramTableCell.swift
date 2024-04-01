//
//  ProgramTableCell.swift
//  modul_14
//
//  Created by Admin on 01.04.2024.
//

import UIKit

class ProgramTableCell: UITableViewCell {

    private let labelsStack = UIStackView()
    private let nameLabel = UILabel()
    private let surnameLabel = UILabel()
    private let phoneLabel = UILabel()
    
    private let phoneImage = UIImageView()
    
    override var reuseIdentifier: String? {
        return "ProgramTableCell"
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupConstraints()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        [nameLabel, surnameLabel, phoneLabel].forEach { $0.text = nil}
        backgroundColor = .white
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    private func setupConstraints() {
        
        contentView.addSubview(labelsStack)
        labelsStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(
            item: labelsStack,
            attribute: .top,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .top,
            multiplier: 1,
            constant: 16
        ).isActive = true
        
        NSLayoutConstraint(
            item: labelsStack,
            attribute: .leading,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .leading,
            multiplier: 1,
            constant: 16
        ).isActive = true
        
        NSLayoutConstraint(
            item: labelsStack,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .trailing,
            multiplier: 1,
            constant: 16
        ).isActive = true
        
        labelsStack.addSubview(nameLabel)
        labelsStack.addSubview(surnameLabel)
        
        contentView.addSubview(phoneImage)
        
        phoneImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(
            item: phoneImage,
            attribute: .top,
            relatedBy: .equal,
            toItem: labelsStack,
            attribute: .bottom,
            multiplier: 1,
            constant: 16
        ).isActive = true
        
        NSLayoutConstraint(
            item: phoneImage,
            attribute: .leading,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .leading,
            multiplier: 1,
            constant: 16
        ).isActive = true
        
        NSLayoutConstraint(
            item: phoneImage,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .bottom,
            multiplier: 1,
            constant: -16
        ).isActive = true
        
        
        
        
        contentView.addSubview(phoneLabel)
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(
            item: phoneLabel,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: phoneImage,
            attribute: .centerY,
            multiplier: 1,
            constant: 0
        ).isActive = true
        
        NSLayoutConstraint(
            item: phoneLabel,
            attribute: .leading,
            relatedBy: .equal,
            toItem: phoneImage,
            attribute: .trailing,
            multiplier: 1,
            constant: 16
        ).isActive = true
    }
    
    private func setupUI() {
        labelsStack.axis = .vertical
        labelsStack.spacing = 10
        
        nameLabel.font = .boldSystemFont(ofSize: 20)
        nameLabel.textAlignment = .center
        
        surnameLabel.font = .systemFont(ofSize: 17)
        surnameLabel.textAlignment = .center
        
        phoneImage.image = UIImage(systemName: "phone.circle.fill")
    }
    
    func configure(width model: UserInfo) {
        nameLabel.text = model.name
        surnameLabel.text = model.surname
        phoneLabel.text = model.phone
        
        surnameLabel.isHidden = model.surname == nil
    }
    
    
    
}
