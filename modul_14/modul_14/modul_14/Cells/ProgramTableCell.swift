//
//  ProgramTableCell.swift
//  modul_14
//
//  Created by Admin on 01.04.2024.
//

import UIKit

class ProgramTableCell: UITableViewCell {

    private let labelsStack = UIStackView()
    //private let nameLabel = UILabel()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    //private let surnameLabel = UILabel()
    
    private let surnameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    private let phoneLabel = UILabel()
    
    private let emailImg = UIImageView()
    private let cityImg = UIImageView()
    
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
        
        [nameLabel, surnameLabel ].forEach { $0.text = nil}
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
        
        contentView.addSubview(emailImg)
        emailImg.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(
            item: emailImg,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: phoneImage,
            attribute: .centerY,
            multiplier: 1,
            constant: 0
        ).isActive = true
        
        NSLayoutConstraint(
            item: emailImg,
            attribute: .leading,
            relatedBy: .equal,
            toItem: phoneImage,
            attribute: .trailing,
            multiplier: 1,
            constant: 16
        ).isActive = true
        
        contentView.addSubview(cityImg)
        cityImg.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(
            item: cityImg,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: emailImg,
            attribute: .centerY,
            multiplier: 1,
            constant: 0
        ).isActive = true
        
        NSLayoutConstraint(
            item: cityImg,
            attribute: .leading,
            relatedBy: .equal,
            toItem: emailImg,
            attribute: .trailing,
            multiplier: 1,
            constant: 16
        ).isActive = true
    }
    
    private func setupUI() {
        labelsStack.axis = .vertical
        labelsStack.spacing = 10
        
        //nameLabel.font = .systemFont(ofSize: 20)
        nameLabel.textAlignment = .center
        //nameLabel.textAlignment =
        
        //surnameLabel.font = .systemFont(ofSize: 10)
        surnameLabel.textAlignment = .center
        
        phoneImage.image = UIImage(systemName: "phone.fill")
        emailImg.image = UIImage(systemName: "envelope.fill")
        cityImg.image = UIImage(systemName: "building.2.fill")
    }
    
    func configure(width model: UserInfo) {
        nameLabel.text = model.name + " " + (model.surname ?? "")
        //surnameLabel.text = model.surname
        
        surnameLabel.isHidden = model.surname == nil
        
        emailImg.isHidden = model.email == nil
        cityImg.isHidden = model.city == nil
    }
    
    
    
}
