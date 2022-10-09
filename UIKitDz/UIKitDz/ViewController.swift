//
//  ViewController.swift
//  UIKitDz
//
//  Created by Balik on 16.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var iconClick : Bool!

    @IBOutlet weak var password: UITextField!
    @IBAction func iconAction(_ sender: Any) {
        
        if(iconClick == true) {
            password.isSecureTextEntry = false
                  iconClick = false
              } else {
                  password.isSecureTextEntry = true
                  iconClick = true
              }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        iconClick = true

    }


}

