//
//  Menu.swift
//  UIKitDz
//
//  Created by Balik on 14.11.2022.
//

import UIKit

class Menu: UIViewController {

    let blackBox = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
//        let barAppearance = UINavigationBarAppearance()
//            barAppearance.backgroundColor = .white
//        navigationController?.navigationBar.standardAppearance = barAppearance
//        navigationController?.navigationBar.scrollEdgeAppearance = barAppearance
       
        title = "Menu"
        
        blackView()
        pizzaButton()
        blackView2()
        sushiButton()
    }
    
    func blackView() {
        blackBox.frame = CGRect(x: 0, y: 230, width: 250, height: 150)
        blackBox.backgroundColor = .black
        blackBox.center.x = view.center.x
        view.addSubview(blackBox)
    }
    
    func pizzaButton() {
        let whiteBox = UIButton()
        whiteBox.frame = CGRect(x: 0, y: 231, width: 248, height: 148)
        whiteBox.center.x = view.center.x
        whiteBox.setTitle("Pizza", for: .normal)
        whiteBox.setTitleColor(.black, for: .normal)
        whiteBox.backgroundColor = .white
        whiteBox.addTarget(self, action: #selector(nextVCPizza), for: .touchUpInside)
        view.addSubview(whiteBox)
    }
    
    
    func blackView2() {
        let blackView2 = UIView()
        blackView2.frame = CGRect(x: 0, y: 450, width: 250, height: 150)
        blackView2.backgroundColor = .black
        blackView2.center.x = view.center.x
        view.addSubview(blackView2)
    }
    
    func sushiButton() {
        let sushiBut = UIButton()
        sushiBut.frame = CGRect(x: 0, y: 451, width: 248, height: 148)
        sushiBut.center.x = view.center.x
        sushiBut.backgroundColor = .white
        sushiBut.setTitle("Sushi", for: .normal)
        sushiBut.setTitleColor(.black, for: .normal)
        view.addSubview(sushiBut)
    }
    
//    Удалить тайтл из кнопки назад
    @objc func nextVCPizza() {
        let pizzaView = PizzaVC()
        navigationController?.pushViewController(pizzaView, animated: true)
        navigationItem.backButtonTitle = ""
        
//        navigationController.modalPresentationStyle = .fullScreen
//        present(pizzaView, animated: true)
    }
    
}
