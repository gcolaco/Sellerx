//
//  ViewController.swift
//  Sellerx
//
//  Created by Gustavo Colaco on 29/03/19.
//  Copyright © 2019 Gustavo Colaco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //making LoginStoryboard the initial view
        let storyboard = UIStoryboard(name: Storyboard.LoginStoryboard, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: StoryboardId.LoginVC)
        present(controller, animated: true, completion: nil)
        
    }
}

