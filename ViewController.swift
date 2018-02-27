//
//  ViewController.swift
//  Filterer
//
//  Created by Jack on 2015-09-22.
//  Copyright © 2015 UofT. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var filteredImage: UIImage?
    let image = UIImage(named: "scenery")!
    var filterType: String = ""
    
    @IBOutlet weak var originalText: UILabel!
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var sliderMenu: UIView!
    
    @IBOutlet weak var slideIt: UISlider!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet var secondaryMenu: UIView!
    @IBOutlet var bottomMenu: UIView!
    
    @IBOutlet weak var compareButton: UIButton!
    @IBOutlet var filterButton: UIButton!
    
    //this function applies red filter
    @IBAction func redIt(_ sender: AnyObject) {
        var rgbaImage = RGBAImage(image: image)!
        let avgRed = 107
        filterType = "red"
        for y in 0..<rgbaImage.height{
            for x in 0..<rgbaImage.width{
                let index = y * rgbaImage.width + x
                
                var pixel = rgbaImage.pixels[index]
                
                let redDelta = Int(pixel.red) - avgRed
                
                var modifier = 1 + 4 * (Double(y) / Double(rgbaImage.height))
                if (Int(pixel.red) < avgRed){
                    modifier = 1
                }
                
                pixel.red = UInt8(max(min(255, Int(round(Double(avgRed) + modifier * Double(redDelta)))), 0))
                rgbaImage.pixels[index] = pixel
            }
        }
        filteredImage = rgbaImage.toUIImage()
        crossFadeToImage(image)
        compareButton.isEnabled = true
        editButton.isEnabled = true
        
    }
    @IBAction func greenIt(_ sender: AnyObject) {
        var rgbaImage = RGBAImage(image: image)!
        let avgGreen = 107
        filterType = "green"
        for y in 0..<rgbaImage.height{
            for x in 0..<rgbaImage.width{
                let index = y * rgbaImage.width + x
                
                var pixel = rgbaImage.pixels[index]
                
                let greenDelta = Int(pixel.green) - avgGreen
                
                var modifier = 1 + 4 * (Double(y) / Double(rgbaImage.height))
                if (Int(pixel.green) < avgGreen){
                    modifier = 1
                }
                
                pixel.green = UInt8(max(min(255, Int(round(Double(avgGreen) + modifier * Double(greenDelta)))), 0))
                rgbaImage.pixels[index] = pixel
            }
        }
        filteredImage = rgbaImage.toUIImage()
        crossFadeToImage(image)
        compareButton.isEnabled = true
        editButton.isEnabled = true
    }
    
    @IBAction func blueIt(_ sender: AnyObject) {
        var rgbaImage = RGBAImage(image: image)!
        let avgBlue = 50
        filterType = "blue"
        for y in 0..<rgbaImage.height{
            for x in 0..<rgbaImage.width{
                let index = y * rgbaImage.width + x
                
                var pixel = rgbaImage.pixels[index]
                
                let blueDelta = Int(pixel.blue) - avgBlue
                
                var modifier = 1 + 4 * (Double(y) / Double(rgbaImage.height))
                if (Int(pixel.blue) < avgBlue){
                    modifier = 1
                }
                
                pixel.blue = UInt8(max(min(255, Int(round(Double(avgBlue) + modifier * Double(blueDelta)))), 0))
                rgbaImage.pixels[index] = pixel
            }
        }
        filteredImage = rgbaImage.toUIImage()
        crossFadeToImage(image)
        compareButton.isEnabled = true
        editButton.isEnabled = true

    }
    
    @IBAction func yellowIt(_ sender: AnyObject) {
        var rgbaImage = RGBAImage(image: image)!
        let avgYellow = 107
        filterType = "yellow"
        for y in 0..<rgbaImage.height{
            for x in 0..<rgbaImage.width{
                let index = y * rgbaImage.width + x
                
                var pixel = rgbaImage.pixels[index]
                
                let yellowDelta = Int(pixel.yellow) - avgYellow
                
                var modifier = 1 + 4 * (Double(y) / Double(rgbaImage.height))
                if (Int(pixel.yellow) < avgYellow){
                    modifier = 1
                }
                
                pixel.yellow = UInt8(max(min(255, Int(round(Double(avgYellow) + modifier * Double(yellowDelta)))), 0))
                rgbaImage.pixels[index] = pixel
            }
        }
        filteredImage = rgbaImage.toUIImage()
        crossFadeToImage(image)
        compareButton.isEnabled = true
        editButton.isEnabled = true

    }
    
    @IBAction func purpleIt(_ sender: AnyObject) {
        var rgbaImage = RGBAImage(image: image)!
        let avgPurple = 107
        filterType = "purple"
        for y in 0..<rgbaImage.height{
            for x in 0..<rgbaImage.width{
                let index = y * rgbaImage.width + x
                
                var pixel = rgbaImage.pixels[index]
                
                let purpleDelta = Int(pixel.red) - avgPurple
                
                var modifier = 1 + 4 * (Double(y) / Double(rgbaImage.height))
                if (Int(pixel.purple) < avgPurple){
                    modifier = 1
                }
                
                pixel.purple = UInt8(max(min(255, Int(round(Double(avgPurple) + modifier * Double(purpleDelta)))), 0))
                rgbaImage.pixels[index] = pixel
            }
        }
        filteredImage = rgbaImage.toUIImage()
        crossFadeToImage(image)
        
        compareButton.isEnabled = true
        editButton.isEnabled = true
    }
    
    func crossFadeToImage(_ image: UIImage) {
        // crossfade to this image
        UIView.transition(with: imageView,
                                  duration:1,
                                  options: UIViewAnimationOptions.transitionCrossDissolve,
                                  animations: { self.imageView.image = self.filteredImage},
                                  completion: nil)
    }
    
    @IBAction func compareIt(_ sender: AnyObject) {
        if imageView.image == filteredImage {
            imageView.image = image
            originalText.text = "Original"
            compareButton.isSelected = false
        }else{
            imageView.image = filteredImage
            originalText.text = ""
            compareButton.isSelected = true
        }

    }
    

    
    @IBAction func editIt(_ sender: AnyObject) {
        
    }


    @IBAction func intensityIt(_ sender: AnyObject) {
        let intensity = self.slideIt.value * 100
        print(intensity)
        
        switch filterType{
            case "red":
                var rgbaImage = RGBAImage(image: image)!
                let avgRed = Int(intensity)
                for y in 0..<rgbaImage.height{
                    for x in 0..<rgbaImage.width{
                        let index = y * rgbaImage.width + x
                        
                        var pixel = rgbaImage.pixels[index]
                        
                        let redDelta = Int(pixel.red) - avgRed
                        
                        var modifier = 1 + 4 * (Double(y) / Double(rgbaImage.height))
                        if (Int(pixel.red) < avgRed){
                            modifier = 1
                        }
                        
                        pixel.red = UInt8(max(min(255, Int(round(Double(avgRed) + modifier * Double(redDelta)))), 0))
                        rgbaImage.pixels[index] = pixel
                    }
                }
            filteredImage = rgbaImage.toUIImage()
            crossFadeToImage(image)
            case "blue":
                var rgbaImage = RGBAImage(image: image)!
                let avgBlue = Int(intensity)
                for y in 0..<rgbaImage.height{
                    for x in 0..<rgbaImage.width{
                        let index = y * rgbaImage.width + x
                        
                        var pixel = rgbaImage.pixels[index]
                        
                        let blueDelta = Int(pixel.blue) - avgBlue
                        
                        var modifier = 1 + 4 * (Double(y) / Double(rgbaImage.height))
                        if (Int(pixel.blue) < avgBlue){
                            modifier = 1
                        }
                        
                        pixel.blue = UInt8(max(min(255, Int(round(Double(avgBlue) + modifier * Double(blueDelta)))), 0))
                        rgbaImage.pixels[index] = pixel
                    }
                }
                filteredImage = rgbaImage.toUIImage()
                crossFadeToImage(image)
            case "yellow":
                var rgbaImage = RGBAImage(image: image)!
                let avgYellow = Int(intensity)
                filterType = "yellow"
                for y in 0..<rgbaImage.height{
                    for x in 0..<rgbaImage.width{
                        let index = y * rgbaImage.width + x
                        
                        var pixel = rgbaImage.pixels[index]
                        
                        let yellowDelta = Int(pixel.yellow) - avgYellow
                        
                        var modifier = 1 + 4 * (Double(y) / Double(rgbaImage.height))
                        if (Int(pixel.yellow) < avgYellow){
                            modifier = 1
                        }
                        
                        pixel.yellow = UInt8(max(min(255, Int(round(Double(avgYellow) + modifier * Double(yellowDelta)))), 0))
                        rgbaImage.pixels[index] = pixel
                    }
                }
                filteredImage = rgbaImage.toUIImage()
                crossFadeToImage(image)

            case "green":
                var rgbaImage = RGBAImage(image: image)!
                let avgGreen = Int(intensity)
                filterType = "green"
                for y in 0..<rgbaImage.height{
                    for x in 0..<rgbaImage.width{
                        let index = y * rgbaImage.width + x
                        
                        var pixel = rgbaImage.pixels[index]
                        
                        let greenDelta = Int(pixel.green) - avgGreen
                        
                        var modifier = 1 + 4 * (Double(y) / Double(rgbaImage.height))
                        if (Int(pixel.green) < avgGreen){
                            modifier = 1
                        }
                        
                        pixel.green = UInt8(max(min(255, Int(round(Double(avgGreen) + modifier * Double(greenDelta)))), 0))
                        rgbaImage.pixels[index] = pixel
                    }
                }
                filteredImage = rgbaImage.toUIImage()
                crossFadeToImage(image)
            default:
            print("good")

        }
    }
    



    
    override func viewDidLoad() {
        editButton.isEnabled = false
        compareButton.isEnabled = false
        super.viewDidLoad()
        secondaryMenu.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        secondaryMenu.translatesAutoresizingMaskIntoConstraints = false
        
        let tap = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.pressedMe(_:)))
        tap.minimumPressDuration = 0
        self.imageView.addGestureRecognizer(tap)
        self.imageView.isUserInteractionEnabled = true
    }
    //this function shows original image on tap
    func pressedMe(_ gesture: UITapGestureRecognizer) {
        if filteredImage != nil {
            if gesture.state == .began{
                originalText.text = "Original"
                imageView.image = image
            } else if  gesture.state == .ended {
                originalText.text = ""
                imageView.image = filteredImage
            }
            
        }
    }

    // MARK: Share
    @IBAction func onShare(_ sender: AnyObject) {
        let activityController = UIActivityViewController(activityItems: ["Check out our really cool app", imageView.image!], applicationActivities: nil)
        present(activityController, animated: true, completion: nil)
    }
    
    // MARK: New Photo
    @IBAction func onNewPhoto(_ sender: AnyObject) {
        let actionSheet = UIAlertController(title: "New Photo", message: nil, preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { action in
            self.showCamera()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Album", style: .default, handler: { action in
            self.showAlbum()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    func showCamera() {
        let cameraPicker = UIImagePickerController()
        cameraPicker.delegate = self
        cameraPicker.sourceType = .camera
        
        present(cameraPicker, animated: true, completion: nil)
    }
    
    func showAlbum() {
        let cameraPicker = UIImagePickerController()
        cameraPicker.delegate = self
        cameraPicker.sourceType = .photoLibrary
        
        present(cameraPicker, animated: true, completion: nil)
    }
    
    // MARK: UIImagePickerControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        dismiss(animated: true, completion: nil)
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.image = image
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: Filter Menu
    @IBAction func onFilter(_ sender: UIButton) {
        if (sender.isSelected) {
            hideSecondaryMenu()
            sender.isSelected = false
        } else {
            showSecondaryMenu()
            sender.isSelected = true
        }
    }
    

    @IBAction func editShow(_ sender: UIButton) {
        if ((sender.isSelected)) {
            hideSlider()
            sender.isSelected = false
            filterButton.isEnabled = true
            
        } else {
            showSlider()
            sender.isSelected = true
            filterButton.isEnabled = false
        }
    }
    
    func showSecondaryMenu() {
        view.addSubview(secondaryMenu)
        
        let bottomConstraint = secondaryMenu.bottomAnchor.constraint(equalTo: bottomMenu.topAnchor)
        let leftConstraint = secondaryMenu.leftAnchor.constraint(equalTo: view.leftAnchor)
        let rightConstraint = secondaryMenu.rightAnchor.constraint(equalTo: view.rightAnchor)
        
        let heightConstraint = secondaryMenu.heightAnchor.constraint(equalToConstant: 44)
        
        NSLayoutConstraint.activate([bottomConstraint, leftConstraint, rightConstraint, heightConstraint])
        
        view.layoutIfNeeded()
        
        self.secondaryMenu.alpha = 0
        UIView.animate(withDuration: 0.4, animations: {
            self.secondaryMenu.alpha = 1.0
        }) 
    }

    func hideSecondaryMenu() {
        UIView.animate(withDuration: 0.4, animations: {
            self.secondaryMenu.alpha = 0
            }, completion: { completed in
                if completed == true {
                    self.secondaryMenu.removeFromSuperview()
                }
        }) 
    }
    
    func showSlider() {
        view.addSubview(sliderMenu)
        sliderMenu.translatesAutoresizingMaskIntoConstraints = false
        
        let bottomConstraint = sliderMenu.bottomAnchor.constraint(equalTo: bottomMenu.topAnchor)
        let leftConstraint = sliderMenu.leftAnchor.constraint(equalTo: view.leftAnchor)
        let rightConstraint = sliderMenu.rightAnchor.constraint(equalTo: view.rightAnchor)
        
        let heightConstraint = sliderMenu.heightAnchor.constraint(equalToConstant: 44)
        
        NSLayoutConstraint.activate([bottomConstraint, leftConstraint, rightConstraint, heightConstraint])
        
        view.layoutIfNeeded()
        
        self.sliderMenu.alpha = 0
        UIView.animate(withDuration: 0.4, animations: {
            self.sliderMenu.alpha = 1.0
        }) 
    }
    
    
    func hideSlider() {
        UIView.animate(withDuration: 0.4, animations: {
            self.sliderMenu.alpha = 0
        }, completion: { completed in
            if completed == true {
                self.sliderMenu.removeFromSuperview()
            }
        }) 
    }


}

