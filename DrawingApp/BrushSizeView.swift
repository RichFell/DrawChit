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
}

class BrushSizeView: UIView {
    var delegate : BrushSizeViewDelegate!


    @IBAction func selectSizeOnTapped(sender: UIButton) {

        var size : CGFloat!
        switch sender.tag {
        case 0:
            size = 5.0 as CGFloat
        case 1:
            size = 10.0 as CGFloat
        case 2:
            size = 15.0 as CGFloat
        default :
            size = 5.0 as CGFloat
        }
        delegate.didSelectNewBrushSize(size, forView: self)
    }

}
