//
//  ViewController.swift
//  Foodtracker
//
//  Created by KMMX on 16/10/20.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var tfName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tfName.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func cambiaEtiqueta(_ sender: Any) {
        //lblName.text = tfName.text
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        lblName.text = textField.text
    }
    
    @IBAction func selectImage(_ sender: Any) {
        tfName.resignFirstResponder()
        // UIImagePickerController is a view controller that lets a user pick media
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
         // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any] ) {
    // The info dictionary contains multiple representations of the image, and this uses the original.
        let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
    
     // Set photoImageView to display the selected image.
     photoImageView.image = selectedImage
     // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
}

