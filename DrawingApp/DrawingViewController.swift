//
//  ViewController.swift
//  DrawingApp
//
//  Created by Rich Fellure on 2/26/15.
//  Copyright (c) 2015 Mobile Makers. All rights reserved.
//

import UIKit

class DrawingViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    var lastPoint : CGPoint!
    var opacity : CGFloat = 1.0
    var strokeWidth : CGFloat = 10.0
    var swiped = false
    var selectedColor = SelectedColor.Black
    let imagePicker = UIImagePickerController()
    var selectedButton : UIButton!

    @IBOutlet weak var drawingImageView: UIImageView!
    @IBOutlet weak var mainImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }

    @IBAction func colorSelectedOnTapped(sender: UIButton) {
        selectedColor = SelectedColor(rawValue: sender.tag)!
        if selectedButton != nil {
            selectedButton.backgroundColor = UIColor.clearColor()
        }
        selectedButton = sender
        selectedButton.backgroundColor = UIColor.blueColor()
    }

    @IBAction func resetOnTapped(sender: UIButton) {
        mainImageView.image = nil
    }

    @IBAction func accessSettingsOnTapped(sender: UIButton) {
        let alert = UIAlertController(title: "Choose Photo Selection Method", message: nil, preferredStyle: .ActionSheet)
        let photoRoll = UIAlertAction(title: "Photo Roll", style: .Default) { (action) -> Void in
            self.imagePicker.sourceType = .PhotoLibrary
            self.presentViewController(self.imagePicker, animated: true, completion: nil)
        }
        alert.addAction(photoRoll)
        let camera = UIAlertAction(title: "Camera", style: .Default) { (action) -> Void in
            self.imagePicker.sourceType = .Camera
            self.presentViewController(self.imagePicker, animated: true, completion: nil)
        }
        alert.addAction(camera)
        let cancel = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alert.addAction(cancel)
        presentViewController(alert, animated: true, completion: nil)
    }

    @IBAction func saveImageOnTapped(sender: UIButton) {

        let alert = UIAlertController(title: "Save this image???", message: nil, preferredStyle: .Alert)
        let saveAction = UIAlertAction(title: "SAVE", style: .Default) { (action) -> Void in
            self.saveImage()
        }
        alert.addAction(saveAction)
        let cancelAction = UIAlertAction(title: "CANCEL", style: .Cancel, handler: nil)
        alert.addAction(cancelAction)
        presentViewController(alert, animated: true, completion: nil)
    }

    @IBAction func selectThicknessOnTapped(sender: UIButton) {
        
    }

    private func saveImage(){
         UIImageWriteToSavedPhotosAlbum(mainImageView.image, self, "image:error:contextInfo:", nil)
    }

    func image(image: UIImage, error: NSError!, contextInfo: UnsafePointer<Void>) {
        if error == nil {
            let alert = UIAlertController(title: "Congrats it saved", message: nil, preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
            alert.addAction(okAction)
            presentViewController(alert, animated: true, completion: nil)
        }
    }

    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        swiped = false
        let touch = touches.anyObject() as UITouch
        lastPoint = touch.locationInView(view)
    }

    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        swiped = true
        let touch = touches.anyObject() as UITouch
        let currentPoint = touch.locationInView(view)
        UIGraphicsBeginImageContext(view.frame.size)
        drawingImageView.image?.drawInRect(CGRectMake(0, 0, view.frame.size.width, view.frame.size.height))
        CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y)
        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y)
        CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound)
        CGContextSetLineWidth(UIGraphicsGetCurrentContext(), strokeWidth)
        CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), selectedColor.red(), selectedColor.green(), selectedColor.blue(), opacity)
        CGContextSetBlendMode(UIGraphicsGetCurrentContext(), kCGBlendModeNormal)

        CGContextStrokePath(UIGraphicsGetCurrentContext())
        drawingImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        drawingImageView.alpha = opacity
        UIGraphicsEndImageContext()

        lastPoint = currentPoint
    }

    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        if !swiped {
            UIGraphicsBeginImageContext(view.frame.size)
            drawingImageView.image?.drawInRect(CGRectMake(0.0, 0.0, view.frame.size.width, view.frame.size.height))
            CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound)
            CGContextSetLineWidth(UIGraphicsGetCurrentContext(), strokeWidth)
            CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), selectedColor.red(), selectedColor.green(), selectedColor.blue(), opacity)
            CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y)
            CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y)
            CGContextStrokePath(UIGraphicsGetCurrentContext())
            drawingImageView.image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
        }

        UIGraphicsBeginImageContext(view.frame.size)
        mainImageView.image?.drawInRect(CGRectMake(0.0, 0.0, view.frame.width, view.frame.height), blendMode: kCGBlendModeNormal, alpha: opacity)
        drawingImageView.image?.drawInRect(CGRectMake(0, 0, view.frame.width, view.frame.height), blendMode: kCGBlendModeNormal, alpha: opacity)
        mainImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        drawingImageView.image = nil
        UIGraphicsEndImageContext()
    }

    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        imagePicker.dismissViewControllerAnimated(true, completion: { () -> Void in
            self.mainImageView.image = image
        })
    }
}

