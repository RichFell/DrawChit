//
//  Extensions.swift
//  DrawingApp
//
//  Created by Rich Fellure on 2/26/15.
//  Copyright (c) 2015 Mobile Makers. All rights reserved.
//

import Foundation
import UIKit

enum SelectedColor: Int {
    case Black
    case Grey
    case Brown
    case DarkGreen
    case Blue
    case DarkOrange
    case Red
    case LightBlue
    case LightGreen
    case Yellow
    case Eraser

    func red() -> CGFloat {
        switch self {
            case Black: return 0.0/255.0
            case Grey: return 105.0/255.0
            case Brown: return 160.0/255.0
            case .DarkGreen: return 51.0/255.0
            case .Blue: return  5.0/255.0
            case .DarkOrange: return  255.0/255.0
            case .Red: return  255.0/255.0
            case .LightBlue: return  50.0/255.0
            case .LightGreen: return  101.0/255.0
            case .Yellow: return  255.0/255.0
            case .Eraser: return 255.0/255.0
            default: return 0.0/255.0
        }
    }

    func green() -> CGFloat {
        switch self {
            case Black: return 0.0/255.0
            case Grey: return 105.0/255.0
            case Brown: return 82.0/255.0
            case .DarkGreen: return 102.0/255.0
            case .Blue: return  51.0/255.0
            case .DarkOrange: return  120.0/255.0
            case .Red: return  37.0/255.0
            case .LightBlue: return  204.0/255.0
            case .LightGreen: return  249.0/255.0
            case .Yellow: return  251.0/255.0
            case .Eraser: return 255.0/255.0
            default: return 0.0/255.0
        }
    }

    func blue() -> CGFloat {
        switch self {
            case Black: return 0.0/255.0
            case Grey: return 105.0/255.0
            case Brown: return 44.0/255.0
            case .DarkGreen: return 0.0/255.0
            case .Blue: return  255.0/255.0
            case .DarkOrange: return  0.0/255.0
            case .Red: return  0.0/255.0
            case .LightBlue: return  255.0/255.0
            case .LightGreen: return  0.0/255.0
            case .Yellow: return  0.0/255.0
            case .Eraser: return 255.0/255.0
            default: return 0.0/255.0
        }
    }

    func color() -> UIColor {
        return UIColor(red: self.red(), green: self.green(), blue: self.blue(), alpha: 1.0)
    }
}