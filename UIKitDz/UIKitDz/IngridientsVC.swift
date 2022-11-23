//
//  ingridientsVC.swift
//  UIKitDz
//
//  Created by Balik on 17.11.2022.
//

import UIKit

class IngridientsVC: UIViewController {

    let cheeseLabel = UILabel()
    let hamLabel = UILabel()
    let mushroomsLabel = UILabel()
    let oliveLabel = UILabel()
    let acceptButton = UIButton()
    let pizzaImg = UIImageView()
    let switchCheese = UISwitch()
    let switchHam = UISwitch()
    let switchMushrooms = UISwitch()
    let switchOlive = UISwitch()
    let pizzaNameLabel = UILabel()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        cheese()
        imgPizza()
        pizzaName()
        ham()
        mushrooms()
        olive()
        switcherCheese()
        switcherHam()
        switcherMusgrooms()
        switcherOlive()
        acceptedButton()
    }
    
    func imgPizza() {
        pizzaImg.frame = CGRect(x: 0, y: 150, width: 300, height: 300)
        pizzaImg.center.x = view.center.x
        view.addSubview(pizzaImg)
    }
    
    func cheese() {
        cheeseLabel.frame = CGRect(x: 50, y: 500, width: 80, height: 30)
        cheeseLabel.text = "Доп. сыр"
        view.addSubview(cheeseLabel)
    }
    
    func ham() {
        hamLabel.frame = CGRect(x: 50, y: 550, width: 80, height: 30)
        hamLabel.text = "Ветчина"
        view.addSubview(hamLabel)
    }
    
    func mushrooms() {
        mushroomsLabel.frame = CGRect(x: 50, y: 600, width: 80, height: 30)
        mushroomsLabel.text = "Грибы"
        view.addSubview(mushroomsLabel)
    }
   
    func olive() {
        oliveLabel.frame = CGRect(x: 50, y: 650, width: 80, height: 30)
        oliveLabel.text = "Оливки"
        view.addSubview(oliveLabel)
    }
    
    func switcherCheese() {
        switchCheese.frame = CGRect(x: 320, y: 0, width: 0, height: 0)
        switchCheese.center.y = cheeseLabel.center.y
        view.addSubview(switchCheese)
    }
    
    func switcherHam() {
        switchHam.frame = CGRect(x: 320, y: 0, width: 0, height: 0)
        switchHam.center.y = hamLabel.center.y
        view.addSubview(switchHam)
    }

    func switcherMusgrooms() {
        switchMushrooms.frame = CGRect(x: 320, y: 0, width: 0, height: 0)
        switchMushrooms.center.y = mushroomsLabel.center.y
        view.addSubview(switchMushrooms)
    }

    func switcherOlive() {
        switchOlive.frame = CGRect(x: 320, y: 0, width: 0, height: 0)
        switchOlive.center.y = oliveLabel.center.y
        view.addSubview(switchOlive)
    }
    
    func pizzaName() {
        pizzaNameLabel.frame = CGRect(x: 0, y: 120, width: 150, height: 40)
        pizzaNameLabel.center.x = view.center.x
        pizzaNameLabel.font = .boldSystemFont(ofSize: 30)
        pizzaNameLabel.textColor = .orange
        view.addSubview(pizzaNameLabel)
    }
    
    func acceptedButton() {
        acceptButton.frame = CGRect(x: 0, y: 750, width: 250, height: 50)
        acceptButton.center.x = view.center.x
        acceptButton.backgroundColor = .orange
        acceptButton.layer.cornerRadius = 15
        acceptButton.setTitle("Выбрать", for: .normal)
        acceptButton.addTarget(self, action: #selector(nextAcceptedVC), for: .touchUpInside)
        view.addSubview(acceptButton)
    }
    
    @objc func nextAcceptedVC() {
        let acceptedViewController = AcceptedOrder()
       let newNavigationController = UINavigationController(rootViewController: acceptedViewController)
        newNavigationController.modalPresentationStyle = .fullScreen
        if switchCheese.isOn {
            acceptedViewController.labelCheese.text = cheeseLabel.text
        }
        if switchHam.isOn {
            acceptedViewController.labelHam.text = hamLabel.text
        }
        if switchMushrooms.isOn {
            acceptedViewController.labelMushrooms.text = mushroomsLabel.text
        }
        if switchOlive.isOn {
            acceptedViewController.labelOlive.text = oliveLabel.text
        }
        acceptedViewController.labelPizzaName.text = "Пицца " + (pizzaNameLabel.text ?? "error")
        present(newNavigationController, animated: true)
    }
}
