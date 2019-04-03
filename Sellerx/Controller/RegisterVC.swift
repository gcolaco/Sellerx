//
//  RegisterVC.swift
//  Sellerx
//
//  Created by Gustavo Colaco on 02/04/19.
//  Copyright © 2019 Gustavo Colaco. All rights reserved.
//

import UIKit
import Firebase

class RegisterVC: UIViewController {
    
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var confirmPassTxt: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var passCheckImg: UIImageView!
    @IBOutlet weak var confirmPassCheckImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //checking if password text and confirm password text are equals, while user is editing(typing)
        passwordTxt.addTarget(self, action: #selector(textfieldDidChange(_:)), for: UIControl.Event.editingChanged)
        confirmPassTxt.addTarget(self, action: #selector(textfieldDidChange(_:)), for: UIControl.Event.editingChanged)

    }
    
    
    @objc func textfieldDidChange (_ textField: UITextField) {
        
        guard let passTxt = passwordTxt.text else {return}
        
        //if started typing in the confirm pass text field
        if textField == confirmPassTxt {
            passCheckImg.isHidden = false
            confirmPassCheckImg.isHidden = false
        } else {
            if passTxt.isEmpty {
                passCheckImg.isHidden = true
                confirmPassCheckImg.isHidden = true
                confirmPassTxt.text = ""
            }
        }
        
        if passwordTxt.text == confirmPassTxt.text {
            passCheckImg.image = UIImage(named: AppImages.GreenCheck)
            confirmPassCheckImg.image = UIImage(named: AppImages.GreenCheck)
        }else {
            passCheckImg.image = UIImage(named: AppImages.RedCheck)
            confirmPassCheckImg.image = UIImage(named: AppImages.RedCheck)
        }
    }
    
    //MARK: - Creating user
    @IBAction func registerClicked(_ sender: Any) {
        guard let email = emailTxt.text, email.isNotEmpety else {
            simpleAlert(title: "Error", message: "Please fill out e-mail field.")
            return
        }
        guard let username = usernameTxt.text, username.isNotEmpety else {
            simpleAlert(title: "Error", message: "Please fill out username field.")
            return
        }
        guard let password = passwordTxt.text,  password.isNotEmpety else {
            simpleAlert(title: "Error", message: "Please fill out password field.")
            return
        }
        
        guard let confirmPass = confirmPassTxt.text, confirmPass == password else {
            simpleAlert(title: "Error", message: "Passwords do not match.")
            return
        }
        
        activityIndicator.startAnimating()
        
        guard let authUser = Auth.auth().currentUser else {return }
        
        let credential = EmailAuthProvider.credential(withEmail: email, password: password)
        authUser.linkAndRetrieveData(with: credential) { (result, error) in
            if let error = error {
                self.handleFireAuthError(error: error)
                debugPrint(error)
                return
            }
            self.activityIndicator.stopAnimating()
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    

}
