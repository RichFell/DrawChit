//
//  ColorView.swift
//  DrawingApp
//
//  Created by Rich Fellure on 2/27/15.
//  Copyright (c) 2015 Mobile Makers. All rights reserved.
//

import UIKit

protocol ColorViewDelegate {
    func didSelectNewColorType(type: SelectedColor, fromView theView: ColorView)
}

class ColorView: UIView {

    var delegate : ColorViewDelegate!

    @IBAction func selectColorOnTapped(sender: UIButton) {
        let typeSelected = SelectedColor(rawValue: sender.tag)!
        delegate.didSelectNewColorType(typeSelected, fromView: self)
    }
}
