//
//  Extensions.swift
//  Sellerx
//
//  Created by Gustavo Colaco on 02/04/19.
//  Copyright © 2019 Gustavo Colaco. All rights reserved.
//

import Foundation
import UIKit
import Firebase
/*
 This swift file it is just to extend some types, that are going to be used in the code
*/

//so that the !var.isEmpety become more readable during the code
extension String {
    var isNotEmpety: Bool {
        return !isEmpty
    }
}

extension UIViewController {

    
    func simpleAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
        
    }
    
}


