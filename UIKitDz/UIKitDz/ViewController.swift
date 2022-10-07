//
//  ViewController.swift
//  UIKitDz
//
//  Created by Balik on 16.09.2022.
//

import UIKit

class ViewController: UIViewController {

    var model = Model()
    var label = UILabel()
    var labelSum = UILabel()
    var labelRand = UILabel()
    var labelWord = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .cyan
        
        let buttonSum = UIButton(frame: CGRect(x: 35, y: 500, width: 150, height: 65))
        buttonSum.backgroundColor = .green
        buttonSum.setTitle("Сложение", for: .normal)
        buttonSum.setTitleColor(UIColor.black, for: .normal)
        buttonSum.addTarget(self, action: #selector(alertSum), for: .touchUpInside)
        self.view.addSubview(buttonSum)
        
        let buttonRand = UIButton(frame: CGRect(x: 225, y: 500, width: 150, height: 65))
        buttonRand.backgroundColor = .green
        buttonRand.setTitle("Угадай число", for: .normal)
        buttonRand.setTitleColor(UIColor.black, for: .normal)
        buttonRand.addTarget(self, action: #selector(alertRand), for: .touchUpInside)
        self.view.addSubview(buttonRand)
        
        let buttonWord = UIButton(frame: CGRect(x: 35, y: 650, width: 200, height: 35))
        buttonWord.center.x = self.view.center.x
        buttonWord.backgroundColor = .green
        buttonWord.setTitle("Преобразовать", for: .normal)
        buttonWord.setTitleColor(UIColor.black, for: .normal)
        buttonWord.addTarget(self, action: #selector(alertWord), for: .touchUpInside)
        self.view.addSubview(buttonWord)
        
        
//       MARK: Label name
        label.frame = CGRect(x: 50, y: 200, width: 200, height: 25)
        label.center.x = self.view.center.x
        label.textAlignment = .center
        label.backgroundColor = .cyan
        label.text = "Player: "
        self.view.addSubview(label)
        
//        MARK: Label Sum
        labelSum.frame = CGRect(x: 90, y: 600, width: 100, height: 20)
        labelSum.backgroundColor = .cyan
        labelSum.text = ""
        self.view.addSubview(labelSum)
        
//        MARK: Label Rand
        labelRand.frame = CGRect(x: 160, y: 600, width: 250, height: 20)
        labelRand.backgroundColor = .cyan
        labelRand.text = ""
        labelRand.textAlignment = .center
        self.view.addSubview(labelRand)
        
//        MARK: Label Word
        labelWord.frame = CGRect(x: 100, y: 750, width: 200, height: 20)
        labelWord.center.x = self.view.center.x
        labelWord.backgroundColor = .cyan
        labelWord.text = ""
        labelWord.textAlignment = .center
        self.view.addSubview(labelWord)
        }
    
//    MARK: Alerts on buttons
    
    @objc func alertSum() {
        let alertSum = UIAlertController(title: "Сложение чисел", message: "Введите число", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { (action) in
           
            let numberOne = alertSum.textFields?.first?.text ?? ""
            let numberTwo = alertSum.textFields?.last?.text ?? ""
            self.labelSum.text? = ("Sum:") + String((Int(numberOne) ?? 0) + (Int(numberTwo) ?? 0))
        }
        
        alertSum.addTextField {(textField1) in
            
        }
        alertSum.addTextField{(textField2) in
            
        }
        alertSum.addAction(action)
        self.present(alertSum, animated: true)
    }
        
    @objc func alertRand() {
        let alertRand = UIAlertController(title: "Игра с числами", message: "Угадайте число", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { (action) in
            let chislo = alertRand.textFields?.first?.text ?? ""
            if chislo == String(Int(6)) {
            self.labelRand.text? = "Верно! Выдуманное число " + String(Int(6))
            } else {self.labelRand.text? = "Неугадал :(" }
            }
        alertRand.addTextField {(textField1) in
            
        }
        
        alertRand.addAction(action)
        self.present(alertRand, animated: true)
    }
    
    @objc func alertWord() {
            let alertWord = UIAlertController(title: "Преобразоватор", message: "Введите буквы", preferredStyle:  .alert)
            let action = UIAlertAction(title: "Ok", style: .default) { (action) in
                let textName = alertWord.textFields?.first?.text ?? ""
                self.labelWord.text? = self.model.wordFunc(text: textName)

        }
        alertWord.addTextField { (textField3) in
            
        }
        alertWord.addAction(action)
        self.present(alertWord, animated: true)
        }
    
    
//MARK: First alert hello
    override func viewDidAppear(_ animated: Bool) {
        let alertHello = UIAlertController(title: "Вам повестка", message: "Введите ФИО", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { (action) in
            let textName = alertHello.textFields?.first?.text
            self.label.text? += textName ?? ""
        }
        
        alertHello.addTextField {(textField) in
            
        }
        alertHello.addAction(action)
        self.present(alertHello, animated: true)
    }
}
