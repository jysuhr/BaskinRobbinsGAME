//
//  Colors.swift
//  SimpleGame_package
//
//  Created by 서준영 on 8/18/24.
//

import UIKit

extension UIColor {
    convenience init(hex: String) {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if hexString.hasPrefix("#") {
            hexString.remove(at: hexString.startIndex)
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgbValue)
        
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

/**
 색상 인스턴스 선언
 */
extension ViewController {
    var bgColor1: UIColor{
        return UIColor(hex: "#B7C5EA")
    }
    var laColor1: UIColor{
        return UIColor(hex: "#FFFFFF")
    }
    var btColor1: UIColor{
        return UIColor(hex: "#6B5CFF")
    }
}

extension BaskinViewController {
    var bgColor2: UIColor{
        return UIColor(hex: "#EAD3B7")
    }
    var laColor1: UIColor{
        return UIColor(hex: "#FFFFFF")
    }
    var laColor2: UIColor{
        return UIColor(hex: "#9CE371")
    }
    var laColor3: UIColor{
        return UIColor(hex: "#F3DD18")
    }
    var laColor4: UIColor{
        return UIColor(hex: "#E57566")
    }
    var laColor5: UIColor{
        return UIColor(hex: "#CD2008")
    }
    var numColor1: UIColor{
        return UIColor(hex: "#296BCE")
    }
    var numColor2: UIColor{
        return UIColor(hex: "#4078CB")
    }
    var numColor3: UIColor{
        return UIColor(hex: "#FFFFFF")
    }
    var playColor: UIColor{
        return UIColor(hex: "#8C7A1E")
    }
    var playColorDis: UIColor{
        return UIColor(hex: "#39380F")
    }
}
