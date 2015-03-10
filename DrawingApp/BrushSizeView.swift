//
//  BrushSizeView.swift
//  DrawingApp
//
//  Created by Rich Fellure on 2/27/15.
//  Copyright (c) 2015 Mobile Makers. All rights reserved.
//

import UIKit

@objc protocol BrushSizeViewDelegate {
    func didSelectNewBrushSize(selectedSize: CGFloat, forView theView: BrushSizeView)
    func didFinishBrushSelection(theView: BrushSizeView)
}

class BrushSizeView: UIView {
    var delegate : BrushSizeViewDelegate!
    @IBOutlet weak var slider: UISlider!

    @IBAction func selectedNewBrushSize(sender: UISlider) {
        let size = CGFloat(sender.value)
        delegate.didSelectNewBrushSize(size, forView: self)
    }

    @IBAction func closeViewOnTapped(sender: UIButton) {
        delegate.didFinishBrushSelection(self)
    }

    func selectedSize(size: CGFloat) {
        let pos = Float(size)
        slider.value = pos
    }
}
