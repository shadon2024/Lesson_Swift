//
//  Colors.swift
//  modul_14
//
//  Created by Admin on 08/04/24.
//

import Foundation
import UIKit

extension UIColor {
    convenience  init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        let length = hexSanitized.count
        var rgb: UInt64 = 0
        
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 1.0
        
        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else {return nil}
        
        if length == 6 {
            r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            b = CGFloat(rgb & 0x0000FF) / 255.0
        } else if length == 8 {
            r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
            g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
            b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
            a = CGFloat(rgb & 0x000000FF) / 255.0
        } else {
            return nil
        }
        
        self.init(red: r, green: g, blue: b, alpha: a)
    }
}

let colorHeaderOne = UIColor(hex: "#2F80ED")
let colorViewOne = UIColor(hex: "#E0E0E0")
let colorFontOne = UIColor(hex: "#000000")
let colorCellOne = UIColor(hex: "#F2F2F2")


let colorHeaderTwo = UIColor(hex: "#b3b3b3")
let colorViewTwo = UIColor(hex: "#E0E0E0")
let colorFontTwo = UIColor(hex: "#000000")
let colorCellTwo = UIColor(hex: "#F2F2F2")
let colorButton = UIColor(hex: "#2F80ED")

let colorDate = UIColor(hex: "#333333")
