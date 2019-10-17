//
//  SignUpViewController.swift
//  YunTalk
//
//  Created by exs-mobile yun on 22/08/2019.
//  Copyright © 2019 Seung Yun. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var imageBtn: UIButton!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var pwTF: UITextField!
    @IBOutlet weak var confirmBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    
    let remoteConfig = RemoteConfig.remoteConfig()
    var color: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let statusBar = UIView()
        self.view.addSubview(statusBar)
        statusBar.snp.makeConstraints { (m) in
            m.right.top.left.equalTo(self.view)
            m.height.equalTo(20)
        }
        
        color = remoteConfig["splash_background"].stringValue
        statusBar.backgroundColor = UIColor(hex: color)
        confirmBtn.backgroundColor = UIColor(hex: color)
        cancelBtn.backgroundColor = UIColor(hex: color)
    }
    
    @IBAction func signupBtn(_ sender: UIButton) {
        signUpEvent()
    }
    
    @IBAction func cancelBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addPictureBtn(_ sender: UIButton) {
        imagePicker()
    }
    
    func signUpEvent() {
        Auth.auth().createUser(withEmail: emailTF.text!, password: pwTF.text!) { (user, error) in
            let uid = user?.user.uid
            
            let image = self.imageBtn.imageView?.image
            let imageData = image?.jpegData(compressionQuality: 0.1)
            
            let storageRef = Storage.storage().reference().child("userImages").child(uid!)
                       
            storageRef.putData(imageData!, metadata: nil, completion: { (data, error) in
                storageRef.downloadURL(completion: { (url, error) in
                    if error != nil {
                        print("Failed to download url:", error!)
                        return
                    } else {
                        let imageUrl = url?.absoluteString
                        
                        Database.database().reference().child("users").child(uid!).setValue(["name":self.nameTF.text!,"profileImageUrl":imageUrl])
                        self.dismiss(animated: true, completion: nil)
                        
                    }
                })
            })
            
        }
        
    }
    
    func imagePicker() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        
        self.present(imagePicker, animated: true, completion: nil)
    }
    
}

extension SignUpViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        
        if let image = info[.originalImage] as? UIImage{
            imageBtn.setImage(image, for: .normal)
        }
        dismiss(animated: true, completion: nil)

    }
    
}
