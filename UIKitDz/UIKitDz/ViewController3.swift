//
//  ViewController3.swift
//  UIKitDz
//
//  Created by Balik on 07.10.2022.
//

import UIKit

class ViewController3: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var standartImage: UIImageView!
    @IBOutlet weak var date: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var male: UITextField!
    
    let datePicker = UIDatePicker()
    let agePicker = UIPickerView()
    let malePicker = UIPickerView()
    let sex = ["Мужчина", "Женщина"]
    let imagePicker = UIImagePickerController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
  

        
        agePicker.tag = 1
        age.inputView = agePicker
        agePicker.dataSource = self
        agePicker.delegate = self
      
        
        malePicker.tag = 2
        malePicker.dataSource = self
        malePicker.delegate = self
        male.inputView = malePicker
        
//        func datePicker
        createDtePicker()
    }
    
//     image picker
    @IBAction func selectImage(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        self.present(imagePicker, animated: true, completion: nil)
    }
//    UIImagePickerController delegate
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
         let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        
        standartImage.image = image
        imagePicker.dismiss(animated: true, completion: nil)

    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
//        date picker
    func createDtePicker() {
        datePicker.center = view.center
        datePicker.preferredDatePickerStyle = .inline
        date.inputView = datePicker
        datePicker.datePickerMode = .date
        
//        toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        date.inputAccessoryView = toolbar
        
//        Button
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: true)
    }
//    Button date Picker
    @objc func donePressed() {
        date.text = "\(datePicker.date)"
        self.view.endEditing(true)
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        date.text = formatter.string(from: datePicker.date)
}

 
}

extension ViewController3: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return 100
        case 2:
            return sex.count
        default:
            return 0
        }
    }
}

extension ViewController3: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            let result = "\(row)"
            return result
        case 2:
            let resultSex = sex[row]
            return resultSex
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            age.text = "\(row)"
            age.resignFirstResponder()
        case 2:
            male.text = sex[row]
            male.resignFirstResponder()
        default:
            0
        }
        
    }
}
