//
//  ColorizeButton.swift
//  Colorize
//
//  Created by aymane hachcham on 4/28/21.
//

import Foundation
import UIKit

class ColorizeButton: UIButton {
    
    let screenSize = UIScreen.main.bounds

    convenience init(title: String, backColor: UIColor, iconName: String) {
        self.init()
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: screenSize.height/45)
        
        let buttonIcon = UIImage(named: iconName)?.resized(newSize: CGSize(width: 30, height: 30))
        self.setImage(buttonIcon, for: .normal)
        self.backgroundColor = backColor
        
        self.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: screenSize.height/45)
        self.layer.cornerRadius = 10
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.layer.borderWidth = 6/UIScreen.main.nativeScale
        self.layer.shadowOpacity = 0.2
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6).cgColor
        self.layer.shadowRadius = 6
        self.layer.masksToBounds = true
        
        let buttonWidth = self.frame.width
        let imageWidth = 35
        let spacing = 16
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: buttonWidth - CGFloat(spacing + imageWidth + 70), bottom: 0, right: CGFloat(-spacing))
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: CGFloat(-imageWidth/6), bottom: 0, right: CGFloat(imageWidth/6))

    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Object incorrectly initialized")
    }
    
}

extension UIImage {
    
    func resized(newSize: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(newSize, false, UIScreen.main.scale)
        self.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        guard let resizedImage = UIGraphicsGetImageFromCurrentImageContext() else {return nil}
        UIGraphicsEndImageContext()
        return resizedImage
        
    }
}
