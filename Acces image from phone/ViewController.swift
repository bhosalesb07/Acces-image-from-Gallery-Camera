//
//  ViewController.swift
//  Acces image from phone
//
//  Created by Mac on 10/02/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UINavigationControllerDelegate,UIImagePickerControllerDelegate{

    
  //  Import From Gallery
    
    @IBOutlet weak var image: UIImageView!
    @IBAction func btn(_ sender: UIButton)
    {
        let Alert = UIAlertController(title: "Import Image", message: nil, preferredStyle: .alert)
        let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: { (cameraAction) in
            
                let myimg = UIImagePickerController()
                myimg.delegate = self
                
                myimg.sourceType = UIImagePickerControllerSourceType.camera
                myimg.allowsEditing = false
                self.present(myimg, animated: true)
                {
                    print("Choose Image")
                }
            })
        
        let galleryAction = UIAlertAction(title: "Gallery", style: .default, handler:{ (galleryAction) in
        let myimg1 = UIImagePickerController()
        myimg1.delegate = self
        myimg1.sourceType = UIImagePickerControllerSourceType.photoLibrary
        myimg1.allowsEditing = false
        self.present(myimg1, animated: true)
        {
            print("Choose Image")
        }
    })
        let closeAction = UIAlertAction(title: "Close", style: .default, handler: nil)
        
        Alert.addAction(cameraAction)
          Alert.addAction(galleryAction)
          Alert.addAction(closeAction)
        present(Alert, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image1 = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            
            print("Image Selected")
            image.image = image1

        }
        else
        {
            print("Failed to Import")
        }
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
      
    
        pinch()
    }

    // Pinch Recgnizer
    
    
    func pinch()
    {
        image.isUserInteractionEnabled = true
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(self.pinchGesture))
        image.addGestureRecognizer(pinchGesture)
    }
    @ objc
    func pinchGesture(sender: UIPinchGestureRecognizer)
    {
        sender.view?.transform = (sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale))!
        sender.scale = 1.0
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

