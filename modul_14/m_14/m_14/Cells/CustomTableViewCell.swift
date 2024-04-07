//
//  CustomTableViewCell.swift
//  m_14
//
//  Created by Admin on 03/04/24.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var phoneImage: UIImageView!
    @IBOutlet weak var emailImage: UIImageView!
    @IBOutlet weak var cityImage: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        [nameLabel, surnameLabel].forEach { $0?.text = nil}
        backgroundColor = .white
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
     
    func configure(width model: UserInfo) {
//        nameLabel.text = model.name
//        surnameLabel.text = model.surname
//
//        surnameLabel.isHidden = model.surname == nil
//
//        phoneImage.isHidden = model.phone == nil
//        emailImage.isHidden = model.email == nil
//        cityImage.isHidden = model.city == nil
        
    }

}
