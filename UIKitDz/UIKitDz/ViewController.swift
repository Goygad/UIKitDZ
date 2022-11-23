//
//  ViewController.swift
//  UIKitDz
//
//  Created by Balik on 16.09.2022.
//

import UIKit

class ViewController: UIViewController {

    
    let phonelabel = UILabel()
    let passwordLabel = UILabel()
    let line = UIView()
    let text = UITextField()
    let entButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       

        phoneNumberLabel()
        setPasswordLabel()
        lineView()
        lineView2()
        textField()
        textFieldPass()
        enterButton()
    }

    func phoneNumberLabel() {
        phonelabel.frame = CGRect(x: 50, y: 500, width: 150, height: 20)
        phonelabel.textColor = .orange
        phonelabel.text = "Phone number"
        view.addSubview(phonelabel)
    }
    
    func setPasswordLabel() {
        passwordLabel.frame = CGRect(x: 50, y: 650, width: 150, height: 20)
        passwordLabel.textColor = .orange
        passwordLabel.text = "Password"
        view.addSubview(passwordLabel)
    }
    
    func lineView() {
        line.frame = CGRect(x: 50, y: 575, width: 300, height: 1)
        line.backgroundColor = .systemGray
        view.addSubview(line)
    }
    
    func lineView2() {
        let line2 = UIView()
        line2.frame = CGRect(x: 50, y: 725, width: 300, height: 1)
        line2.backgroundColor = .systemGray
        view.addSubview(line2)
    }
    
    func textField() {
        text.frame = CGRect(x: 50, y: 555, width: 150, height: 20)
        
        text.keyboardType = .phonePad
        view.addSubview(text)
    }
    
    func textFieldPass() {
        let textPass = UITextField()
        textPass.frame = CGRect(x: 50, y: 705, width: 150, height: 20)
        textPass.isSecureTextEntry = true
        view.addSubview(textPass)
    }
    
    func enterButton() {
        entButton.frame = CGRect(x: 0, y: 780, width: 150, height: 50)
        entButton.setTitle("Вход", for: .normal)
        entButton.center.x = view.center.x
        entButton.layer.cornerRadius = 15
        entButton.backgroundColor = .orange
        entButton.addTarget(self, action: #selector(VCMenu), for: .touchUpInside)
        view.addSubview(entButton)
    }
    
    @objc func VCMenu() {
        let menuVC = Menu()
        let navigationController = UINavigationController(rootViewController:menuVC)
        navigationController.modalPresentationStyle = .overFullScreen
        present(navigationController, animated: true)
//        navigationController.pushViewController(navigationController, animated: true)
    }
    
}

