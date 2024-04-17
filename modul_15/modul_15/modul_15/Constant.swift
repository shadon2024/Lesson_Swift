//
//  Constant.swift
//  modul_15
//
//  Created by Admin on 17/04/24.
//

import Foundation
import UIKit


enum Fonts {

    static var headerFont: UIFont {
        UIFont.systemFont(ofSize: 16, weight: .semibold)
    }
    
    static var textFont: UIFont {
        UIFont.systemFont(ofSize: 14)
    }
    
    static var rightFont: UIFont {
        UIFont.systemFont(ofSize: 14)
    }
}


enum Text {
    static var name = "Header"
    
    static var subName = "He'll want to use your yacht, and I don't want this thing smelling like fish"
    
    static var rightText = "8m ago"
}

enum Radius {
    static let user: CGFloat = 10
    
}
