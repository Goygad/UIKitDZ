//
//  ViewController.swift
//  UIKitDz
//
//  Created by Balik on 23.11.2022.
//

import UIKit

class ViewController: UIViewController {

    let textLabel = UILabel()
    let sizeSlider = UISlider()
    let colorPicker = UIPickerView()
    let linePicker = UIPickerView()
    let colors = ["Black", "Red", "Green"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Редактор"
        view.backgroundColor = .white
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.tabBarItem.title = "Telegram"
        navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .add)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(alertText))
        
        
        labelText()
        sliderText()
        pickerColor()
        pickerLine()
    }
    
   
    
    func labelText() {
        textLabel.frame = CGRect(x: 0, y: 100, width: 400, height: 200)
        textLabel.center.x = view.center.x
        textLabel.backgroundColor = .systemGray6
        textLabel.adjustsFontSizeToFitWidth = true
        textLabel.numberOfLines = 0
        view.addSubview(textLabel)
    }
    
    func sliderText() {
        sizeSlider.frame = CGRect(x: 0, y: 350, width: 300, height: 50)
        sizeSlider.center.x = textLabel.center.x
        sizeSlider.minimumValue = 1
        sizeSlider.maximumValue = 50
        sizeSlider.value = 10
        sizeSlider.addTarget(self, action: #selector(fontChanger), for: .valueChanged)
        view.addSubview(sizeSlider)
    }
    
    func pickerColor() {
        colorPicker.frame = CGRect(x: 250, y: 400, width: 100, height: 100)
        colorPicker.dataSource = self
        colorPicker.delegate = self
        view.addSubview(colorPicker)
    }
    
    func pickerLine() {
        linePicker.frame = CGRect(x: 50, y: 400, width: 100, height: 100)
        view.addSubview(linePicker)
    }
    
    @objc func alertText() {
        let alert = UIAlertController(title: "Warning", message: "Enter the text", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default) {_ in
            self.textLabel.text = alert.textFields?.first?.text
        }
        alert.addTextField()
        alert.addAction(alertAction)
        
        present(alert, animated: true)
    }
    
    @objc func fontChanger() {
        let sizeFont = Float(sizeSlider.value)
        textLabel.font = textLabel.font.withSize(CGFloat(sizeFont))
    }
}

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        colors.count
    }
}

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let result = colors[row]
        return result
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row == 0 {
            textLabel.textColor = .black
        }
        if row == 1 {
            textLabel.textColor = .red
        }
        if row == 2 {
            textLabel.textColor = .green
        }
    }
}
