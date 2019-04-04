//
//  Firebase+Utils.swift
//  Sellerx
//
//  Created by Gustavo Colaco on 03/04/19.
//  Copyright © 2019 Gustavo Colaco. All rights reserved.
//

import Firebase

extension Auth {
    
    
    func handleFireAuthError(error: Error, viewController: UIViewController) {
        if let errorCode = AuthErrorCode(rawValue: error._code){
            
            let alert = UIAlertController(title: "Error", message: errorCode.errorMessage, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(okAction)
            
            viewController.present(alert, animated: true, completion: nil)
        }
        
    }
    
}

extension AuthErrorCode {
    var errorMessage: String {
        switch self {
        case .emailAlreadyInUse:
            return "The email is already in use with another account. Pick another email!"
        case .userNotFound:
            return "Account not found for the specified user. Please check and try again"
        case .userDisabled:
            return "Your account has been disabled. Please contact support."
        case .invalidEmail, .invalidSender, .invalidRecipientEmail:
            return "Please enter a valid email"
        case .networkError:
            return "Network error. Please try again."
        case .weakPassword:
            return "Your password is too weak. The password must be 6 characters long or more."
        case .wrongPassword:
            return "Your password or email is incorrect."
            
        default:
            return "Sorry, something went wrong."
        }
    }
    
}

