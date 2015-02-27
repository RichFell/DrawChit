//
//  ColorButton.swift
//  DrawingApp
//
//  Created by Rich Fellure on 2/27/15.
//  Copyright (c) 2015 Mobile Makers. All rights reserved.
//

import UIKit

class ColorButton: UIButton {



    override func awakeFromNib() {
        setup()
    }

    private func setup() {
        layer.borderWidth = 1.0 as CGFloat
        layer.borderColor = UIColor.blackColor().CGColor
        layer.cornerRadius = 10.0 as CGFloat
        imageView?.image = nil
        titleLabel?.text = " "
        let type = SelectedColor(rawValue: tag)!
        backgroundColor = type.color()
        if type == SelectedColor.Eraser {
            imageView?.image = UIImage(named: "Eraser")
        }
    }
}
