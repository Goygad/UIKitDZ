//
//  PizzaVC.swift
//  UIKitDz
//
//  Created by Balik on 14.11.2022.
//

import UIKit

class PizzaVC: UIViewController {

    let peperoniImg = UIImageView()
    let margaritaImg = UIImageView()
    let labelPeperoni = UILabel()
    let labelMargarita = UILabel()
    let buttonPeperoni = UIButton()
    let buttonMargarita = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
//        let barAppearance = UINavigationBarAppearance()
//            barAppearance.backgroundColor = .white
//        navigationController?.navigationBar.standardAppearance = barAppearance
//        navigationController?.navigationBar.scrollEdgeAppearance = barAppearance
       
        title = "Pizza"
        

        
        peperoni()
        margarita()
        labelMargaritaPizza()
        labelPeperoniPizza()
        peperoniButton()
        margaritaButton()
    }
    
    func peperoni() {
        let imgPeper = UIImage(named: "pepero.jpeg")
        peperoniImg.image = imgPeper
        peperoniImg.frame = CGRect(x: 50, y: 200, width: 100, height: 100)
        view.addSubview(peperoniImg)
    }
    
    func margarita() {
        let imgMarga = UIImage(named: "mm.jpeg")
        margaritaImg.image = imgMarga
        margaritaImg.frame = CGRect(x: 50, y: 330, width: 100, height: 100)
        view.addSubview(margaritaImg)
    }
    
    func labelMargaritaPizza() {
        labelMargarita.frame = CGRect(x: 200, y: 0, width: 100, height: 30)
        labelMargarita.center.y = margaritaImg.center.y
        labelMargarita.text = "Margarita"
        view.addSubview(labelMargarita)
    }
    
    func labelPeperoniPizza() {
        labelPeperoni.frame = CGRect(x: 200, y: 0, width: 100, height: 30)
        labelPeperoni.backgroundColor = .white
        labelPeperoni.center.y = peperoniImg.center.y
        labelPeperoni.text = "Peperoni"
        view.addSubview(labelPeperoni)
    }
    
    func peperoniButton() {
        buttonPeperoni.frame = CGRect(x: 350, y: 0, width: 30, height: 30)
        buttonPeperoni.center.y = labelPeperoni.center.y
        buttonPeperoni.setImage(UIImage(systemName: "plus.app.fill"), for: .normal)
        buttonPeperoni.backgroundColor = .white
        buttonPeperoni.contentHorizontalAlignment = .fill
        buttonPeperoni.contentVerticalAlignment = .fill
        buttonPeperoni.imageView?.contentMode = .scaleAspectFit
        buttonPeperoni.tintColor = .orange
        buttonPeperoni.addTarget(self, action: #selector(peperoniIngridVC), for: .touchUpInside)
        view.addSubview(buttonPeperoni)
    }
    
    func margaritaButton() {
        buttonMargarita.frame = CGRect(x: 350, y: 0, width: 30, height: 30)
        buttonMargarita.center.y = labelMargarita.center.y
        buttonMargarita.setImage(UIImage(systemName: "plus.app.fill"), for: .normal)
        buttonMargarita.backgroundColor = .white
        buttonMargarita.contentHorizontalAlignment = .fill
        buttonMargarita.contentVerticalAlignment = .fill
        buttonMargarita.imageView?.contentMode = .scaleAspectFit
        buttonMargarita.tintColor = .orange
        buttonMargarita.addTarget(self, action: #selector(margaritaIngridVC), for: .touchUpInside)
        view.addSubview(buttonMargarita)
    }

    @objc func peperoniIngridVC() {
        let ingridVC = IngridientsVC()
        ingridVC.modalPresentationStyle = .popover
        ingridVC.pizzaImg.image = UIImage(named: "pepero.jpeg")
        ingridVC.pizzaNameLabel.text = labelPeperoni.text
        present(ingridVC, animated: true)
    }
    
    @objc func margaritaIngridVC() {
        let ingridVC = IngridientsVC()
        ingridVC.modalPresentationStyle = .popover
        ingridVC.pizzaNameLabel.text = labelMargarita.text
        ingridVC.pizzaImg.image = UIImage(named: "mm.jpeg")
        present(ingridVC, animated: true)
    }
}
