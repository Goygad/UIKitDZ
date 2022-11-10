//
//  ViewController.swift
//  UIKitDz
//
//  Created by Balik on 16.09.2022.
//

import UIKit

class ViewController: UIViewController {

    let startButton = UIButton()
    let startLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        change background
        self.view.backgroundColor = UIColor(patternImage: UIImage( imageLiteralResourceName: "mainPage.jpeg"))
        
//        MARK:  label
        startLabel.frame = CGRect(x: 0, y: 300, width: 400, height: 70)
        startLabel.font = startLabel.font.withSize(40)
        startLabel.textAlignment = .center
        startLabel.center.x = self.view.center.x
        startLabel.text = "work in progress"
        startLabel.textColor = .white
        self.view.addSubview(startLabel)
        
//        MARK:    start button
        startButton.frame = CGRect(x: 0, y: 500, width: 170, height: 50)
//        центрировать по Х или Y
        startButton.center.x = self.view.center.x
        startButton.backgroundColor = .systemBlue
        startButton.setTitle("Go shopping", for: .normal)
        startButton.layer.cornerRadius = 5
        startButton.addTarget(self, action: #selector(vcShopPage), for: .touchUpInside)

        self.view.addSubview(startButton)
        
    }
    @objc func vcShopPage() {
        let vcShop = ShopPage()
        vcShop.modalPresentationStyle = .fullScreen
        present(vcShop, animated: true)
    }

}

