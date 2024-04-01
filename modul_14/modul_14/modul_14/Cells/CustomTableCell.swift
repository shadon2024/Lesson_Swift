//
//  CustomTableCell.swift
//  modul_14
//
//  Created by Admin on 01.04.2024.
//

import UIKit

class CustomTableCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var surnameLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!

    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        [nameLabel, surnameLabel, phoneLabel].forEach { $0?.text = nil}
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
    
    func configure(width model: UserInfo)  {
        nameLabel.text = model.name
        surnameLabel.text = model.surname
        phoneLabel.text = model.phone
        
        surnameLabel.isHidden = model.surname == nil
    }
    
    
}
