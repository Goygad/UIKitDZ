//
//  AcceptedOrder.swift
//  UIKitDz
//
//  Created by Balik on 17.11.2022.
//

import UIKit

class AcceptedOrder: UIViewController {

    let labelPizzaName = UILabel()
    let labelCheese = UILabel()
    let labelHam = UILabel()
    let labelMushrooms = UILabel()
    let labelOlive = UILabel()
    let payButton = UIButton()
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .white
        title = "Оплата"
        
        pizzaName()
        cheeseName()
        hamName()
        mushroomsName()
        oliveName()
        buttonPay()

    }
    
    func pizzaName() {
        labelPizzaName.frame = CGRect(x: 30, y: 200, width: 200, height: 30)
        labelPizzaName.backgroundColor = .white
        view.addSubview(labelPizzaName)
    }
    
    func cheeseName() {
        labelCheese.frame = CGRect(x: 30, y: 230, width: 200, height: 30)
        labelCheese.backgroundColor = .white
        view.addSubview(labelCheese)
    }
    
    func hamName() {
        labelHam.frame = CGRect(x: 30, y: 260, width: 200, height: 30)
        labelHam.backgroundColor = .white
        view.addSubview(labelHam)
    }
    
    func mushroomsName() {
        labelMushrooms.frame = CGRect(x: 30, y: 290, width: 200, height: 30)
        labelMushrooms.backgroundColor = .white
        view.addSubview(labelMushrooms)
    }
    
    func oliveName() {
        labelOlive.frame = CGRect(x: 30, y: 320, width: 200, height: 30)
        labelOlive.backgroundColor = .white
        view.addSubview(labelOlive)
    }
    
    func buttonPay() {
        payButton.frame = CGRect(x: 0, y: 750, width: 250, height: 50)
        payButton.center.x = view.center.x
        payButton.layer.cornerRadius = 15
        payButton.backgroundColor = .black
        payButton.setImage(UIImage(systemName: "applelogo"), for: .normal)
        payButton.tintColor = .white
        payButton.setTitle("Pay", for: .normal)
        payButton.addTarget(self, action: #selector(goMenuVC), for: .touchUpInside)
        view.addSubview(payButton)
    }
    
    @objc func goMenuVC() {
        let menuVC = Menu()
        navigationController?.pushViewController(menuVC, animated: true)
    }
}
