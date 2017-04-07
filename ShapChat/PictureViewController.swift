//
//  PictureViewController.swift
//  ShapChat
//
//  Created by Faisal Alkhotaifi on 4/5/17.
//  Copyright © 2017 Faisal Alkhotaifi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage

class PictureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var descTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nextOutlet: UIButton!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imagePicker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageView.image = image
        imageView.backgroundColor = UIColor.clear
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func Camera(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func nextButton(_ sender: Any) {
        nextOutlet.isEnabled = false
        let imagesFolder = FIRStorage.storage().reference().child("images")
        let imageDate = UIImageJPEGRepresentation(imageView.image!, 0.1)!
        imagesFolder.child("\(NSUUID().uuidString).jpg").put(imageDate, metadata: nil, completion: {(metadata, error) in
            print ("We tried to upload")
            if error != nil {
                print ("We had an error: \(error)")
            }else {
                self.performSegue(withIdentifier: "SelectUserSegue", sender: nil)
            }
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }

}
