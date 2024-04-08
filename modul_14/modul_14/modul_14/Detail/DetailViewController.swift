//
//  DetailViewController.swift
//  modul_14
//
//  Created by Admin on 06/04/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet private weak var iconImg: UIImageView!
    @IBOutlet private weak var nameLbl: UILabel!
    @IBOutlet private weak var surnameLbl: UILabel!
    @IBOutlet private weak var phoneNumber: UILabel!
    @IBOutlet private weak var email: UILabel!
    @IBOutlet private weak var birthday: UILabel!
    @IBOutlet private weak var city: UILabel!
    @IBOutlet private weak var idUser: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    
    @IBOutlet private weak var twoNameSurname: UILabel!
    @IBOutlet private weak var twoPhoneNumber: UILabel!
    
    
    
    @IBOutlet weak var bacicInformation: UILabel!
    
    @IBOutlet weak var twoContact: UILabel!
    
    @IBOutlet weak var infoDate: UILabel!
    
    
    @IBAction func buttonCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    var icon = UIImageView()
    var nameText: String?
    var surnameText: String?
    var phoneNam: String?
    var emailUs: String?
    var birthdayUs: String?
    var cityUs: String?
    var userId: String?
    var dateLbl: String?
    
    var twoName: String?
    var twoSurname: String?
    var twoPhone: String?

    let contactsService = ContactsService()
    
    
    var model: UserInfo?
//
//    init(model: UserInfo) {
//        self.model = model
//        super.init(nibName: nil, bundle: nil)
//
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupFont()
    }
    

    func setupViews() {
        iconImg.image = UIImage(named: "icon1")
        nameLbl.text = nameText
        surnameLbl.text = surnameText
        phoneNumber.text = phoneNam
        email.text =  emailUs
        birthday.text =  birthdayUs
        city.text =  cityUs
        idUser.text =  userId
        dateLabel.text =  dateLbl
        
        twoNameSurname.text = nameText
        twoPhoneNumber.text = twoPhone
        view.backgroundColor = colorViewOne
    }

    func setupFont() {
        nameLbl.font = Fonts.nameFont
        surnameLbl.font = Fonts.surnameFont
        phoneNumber.font = Fonts.infoFont
        email.font = Fonts.infoFont
        birthday.font = Fonts.infoFont
        city.font = Fonts.infoFont
        idUser.font = Fonts.idFont
        dateLabel.font = Fonts.dateFont
        twoNameSurname.font = Fonts.surnameFont
        twoPhoneNumber.font = Fonts.twoPhoneFont
        
        bacicInformation.font = Fonts.informationFont
        bacicInformation.textColor = colorFontTwo
        
        twoContact.font = Fonts.informationFont
        twoContact.textColor = colorFontTwo
        
        infoDate.font = Fonts.dateFont
        infoDate.textColor = colorFontTwo
    }
}



