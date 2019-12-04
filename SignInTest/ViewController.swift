//
//  ViewController.swift
//  SignInTest
//
//  Created by Martin Bergendorff on 2019-12-04.
//  Copyright © 2019 Martin Bergendorff. All rights reserved.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController {
   
    var isLoggedIn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        
        
    }
    
//    private func initSignOutButton -> Void {
//        let signOutButton = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 40))
//    }
    
    
    
}

