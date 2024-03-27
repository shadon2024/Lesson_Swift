//
//  Constans.swift
//  modul_12
//
//  Created by Admin on 27.03.2024.
//

import UIKit

enum Constans {
    enum Colors {
        static var greenPrimary: UIColor? {
            UIColor(named: "GreenPrimary")
        }
        
        static var greenSecondary: UIColor? {
            UIColor(named: "GreenSecondary")
        }
    }
    
    enum Fonts {
        static var ui30Semi: UIFont? {
            UIFont(name: "Inter-SemiBold", size: 30)
        }
        
        static var systemHeading: UIFont {
            UIFont.systemFont(ofSize: 30, weight: .semibold)
        }
        
        static var systemText: UIFont {
            UIFont.systemFont(ofSize: 16)
        }
    }
    
    enum Text {
        static let heading = Bundle.main.localizedString(forKey: "Heading", value: "", table: "Localizable")
        static let text1 = Bundle.main.localizedString(forKey: "Text1", value: "", table: "Localizable")
        static let text2 = Bundle.main.localizedString(forKey: "Hello, world", value: "", table: "Localizable")
    }
    
    enum Image {
        static let play = UIImage(named: "play")
    }
}
