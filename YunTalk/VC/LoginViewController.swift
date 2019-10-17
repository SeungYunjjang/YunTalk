//
//  LoginViewController.swift
//  YunTalk
//
//  Created by exs-mobile yun on 22/08/2019.
//  Copyright © 2019 Seung Yun. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var signBtn: UIButton!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var pwTF: UITextField!
    
    let remoteConfig = RemoteConfig.remoteConfig()
    var color: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        try! Auth.auth().signOut()
        
        let statusBar = UIView()
        self.view.addSubview(statusBar)
        statusBar.snp.makeConstraints { (m) in
            m.right.top.left.equalTo(self.view)
            m.height.equalTo(20)
        }
        
        color = remoteConfig["splash_background"].stringValue
        statusBar.backgroundColor = UIColor(hex: color)
        loginBtn.backgroundColor = UIColor(hex: color)
        signBtn.backgroundColor = UIColor(hex: color)
        
        
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if user != nil {
                self.performSegue(withIdentifier: "show_main_page", sender: self)
            }
        }
    }
    
    @IBAction func loginBtn(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: emailTF.text!, password: pwTF.text!) { (user, error) in
            if error != nil {
                let alert = UIAlertController(title: "에러", message: error as! String, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .default, handler: { (action) in
                    
                }))
                
                self.present(alert, animated: true, completion: nil)
                
            }
        }
    }
}
