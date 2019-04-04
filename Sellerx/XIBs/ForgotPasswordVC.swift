//
//  ForgotPasswordVC.swift
//  Sellerx
//
//  Created by Gustavo Colaco on 03/04/19.
//  Copyright © 2019 Gustavo Colaco. All rights reserved.
//

import UIKit
import Firebase

class ForgotPasswordVC: UIViewController {

    @IBOutlet weak var emailTxt: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func cancelClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func resetClicked(_ sender: Any) {
        guard let email = emailTxt.text, email.isNotEmpety else {
            simpleAlert(title: "Error", message: "Please enter email.")
            return
        }
        
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            if let error = error {
                debugPrint(error)
                Auth.auth().handleFireAuthError(error: error, viewController: self)
                return
            }
            
            self.dismiss(animated: true, completion: nil)
            
        }
        
    }
    
    
}
