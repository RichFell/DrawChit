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

    @IBOutlet weak var blackButton: ColorButton!
    @IBOutlet weak var brownButton: ColorButton!
    @IBOutlet weak var greyButton: ColorButton!
    @IBOutlet weak var greenButton: ColorButton!
    @IBOutlet weak var blueButton: ColorButton!
    @IBOutlet weak var orangeButton: ColorButton!
    @IBOutlet weak var redButton: ColorButton!
    @IBOutlet weak var lBlueButton: ColorButton!
    @IBOutlet weak var lGreenButton: ColorButton!
    @IBOutlet weak var yellowButton: ColorButton!
    @IBOutlet weak var whiteButton: ColorButton!

    var buttons: [ColorButton] = []
    var delegate : ColorViewDelegate!

    override func awakeFromNib() {
        super.awakeFromNib()
        buttons = [blackButton, brownButton, greyButton, greenButton, blueButton, orangeButton, redButton, lBlueButton, lGreenButton, yellowButton, whiteButton]
    }

    @IBAction func selectColorOnTapped(sender: ColorButton) {
        let typeSelected = SelectedColor(rawValue: sender.tag)!
        addBorderToButton(sender)
        delegate.didSelectNewColorType(typeSelected, fromView: self)
    }

    func showSelectedColor(selectedColor: SelectedColor) {
        for button in buttons {
            if button.tag == selectedColor.rawValue {
                addBorderToButton(button)
            }
        }
    }

    private func addBorderToButton(button: ColorButton) {
        for aButton in buttons {
            if aButton.isSelected == true {
                aButton.layer.borderColor = UIColor.blackColor().CGColor
                aButton.isSelected = false
            }
        }
        button.isSelected = true
        button.layer.borderColor = UIColor.whiteColor().CGColor
    }
}
