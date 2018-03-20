//
//  LoginControllerEvents.swift
//  GameOfChats
//
//  Created by Apple on 3/18/18.
//  Copyright © 2018 syntaxerror. All rights reserved.
//

import UIKit
import Firebase

extension LoginController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @objc func loginAction(){
        if loginSegmentedControl.selectedSegmentIndex == 0 {
            login()
        } else {
            register()
        }
    }
    
    func login(){
        guard let email = emailTextField.text,
            let magic = magicTextField.text else { return }
        print("Valid Control Details")
        authenticationReference.signIn(withEmail: email, password: magic) { (user, error) in
            if error != nil {
                print(error)
                return
            }
            self.dismiss(animated: true, completion: nil)
            print("Logged In")
        }
    }
    
    func register(){
        guard let name = nameTextField.text,
            let email = emailTextField.text,
            let magic = magicTextField.text else { return }
        print("Valid Control Details")
        authenticationReference.createUser(withEmail: email, password: magic) { (firebaseUser, error) in
            if error != nil {
                print(error)
                return
            }
            print("Successfully Registered")
            self.addUserToDatabase(name: name, email: email, magic: magic, child: (firebaseUser?.uid)!)
        }
    }
    
    func addUserToDatabase(name: String, email: String, magic: String, child: String){
        
        let storageReferrence = Firebase.Storage.storage().reference().child(FirebaseConstants.profileImagesFolder).child("\(DateUtility.getCurrentTimeStampString())\(NSUUID().uuidString).png")
        if let profileImageData = UIImagePNGRepresentation(profileImageView.image!){
            storageReferrence.putData(profileImageData, metadata: nil, completion: { (metadata, error) in
                if error != nil {
                    print(error)
                    return
                }
                self.putUserDetails(name: name, email: email, magic: magic, imageURL: (metadata?.downloadURL()?.absoluteString)!, child: child)
            })
        }
    }
    
    private func putUserDetails(name: String, email: String, magic: String,imageURL: String, child: String){
        
        let childReferrence = databaseReferrence.child(FirebaseConstants.userTableName).child(child)
        let values : [String : Any] = [AppConstants.Keys.name: name, AppConstants.Keys.email: email, AppConstants.Keys.magic: magic, AppConstants.Keys.imageURL: imageURL]
        childReferrence.updateChildValues(values) { (error, referrence) in
            if error != nil {
                print(error)
                return
            }
            self.dismiss(animated: true, completion: nil)
            print("Successfully Saved To Database including profile image")
        }
    }
    
    @objc func toggleSegment(){
        let title = loginSegmentedControl.titleForSegment(at: loginSegmentedControl.selectedSegmentIndex)
        loginButton.setTitle(title, for: .normal)
        nameTextField.isHidden = loginSegmentedControl.selectedSegmentIndex == 0 ? true : false
    }
    
    @objc func setProfileImage(){
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
        print("profile image tabbed")
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var selectedImage : UIImage?
        
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            selectedImage = editedImage
            print("Choosed edited image")
        } else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            selectedImage = originalImage
            print("Choosed original image")
        }
        
        if let image = selectedImage {
            profileImageView.image = image
            print("image set to profile")
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
        print("Image Controller Picker Cancelled")
    }
    
}
