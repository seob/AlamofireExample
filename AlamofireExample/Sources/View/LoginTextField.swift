//
//  LoginTextField.swift
//  AlamofireExample
//
//  Created by giftbot on 2018. 7. 22..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit

@IBDesignable
final class LoginTextField: UITextField {
    @IBInspectable  var leftImage: UIImage? {
        get{ return (leftView as? UIImageView)?.image }
        set{
            let image = newValue?.withRenderingMode(.alwaysTemplate)
            let leftImageView = UIImageView(image: image)
            leftImageView.tintColor = .red
            leftView = leftImageView
            leftViewMode = .always
        }
    }
    
    var underlineLayer: CALayer?
    
    @IBInspectable  var underlineColor: UIColor {
        get { return UIColor(cgColor: underlineLayer?.borderColor ?? UIColor.lightGray.cgColor) }
        set {
            let underlineLayer = CALayer()
            underlineLayer.borderWidth = 1
            underlineLayer.borderColor = newValue.cgColor
            underlineLayer.frame = CGRect(x: 0, y: frame.height + 20, width: frame.width, height: 1)
            self.underlineLayer = underlineLayer
            layer.addSublayer(underlineLayer)
            
        }
    }
}
