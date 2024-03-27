//
//  Constans.swift
//  m_12
//
//  Created by Admin on 27.03.2024.
//

import UIKit

enum Constans {
    
    enum Text {
        static let text1 = Bundle.main.localizedString(forKey: "Apple", value: "", table: "Localizable")
        static let text2 = Bundle.main.localizedString(forKey: "Banana", value: "", table: "Localizable")
        static let text3 = Bundle.main.localizedString(forKey: "Peach, pear", value: "", table: "Localizable")
    }
    
    enum Fonts {
        static var ui40Regular: UIFont? {
            UIFont(name: "Inter-Regular", size: 30)
        }
        
        static var ui16Medium: UIFont? {
            UIFont(name: "Inter-Medium", size: 16)
        }
        
        static var ui16Semi: UIFont? {
            UIFont(name: "Inter-SemiBold", size: 16)
        }
        
        
        static var systemHeadingFruits: UIFont {
            UIFont.systemFont(ofSize: 40, weight: .regular)
        }

        static var systemTextFruits: UIFont {
            UIFont.systemFont(ofSize: 30)
        }
    }
    
    enum Colors {
        
        static var brownColor: UIColor? {
            UIColor(named: "BrownColor")
        }
        
        static var grayColor: UIColor? {
            UIColor(named: "GrayColor")
        }
        
        static var violetColor: UIColor? {
            UIColor(named: "VioletColor")
        }
    }
    
    enum Icon {
        static let icon = UIImage(named: "icon")
    }

}

