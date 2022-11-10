//
//  ShopPage.swift
//  UIKitDz
//
//  Created by Balik on 25.10.2022.
//

import UIKit

class ShopPage: UIViewController {
    
    let cocomberButton = UIButton()
    let longButton = UIButton()
    let newArrivalLabel = UILabel()
    let priceCocomber = UILabel()
    let priceLong = UILabel()
    let nameCocomber = UILabel()
    let nameLong = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // MARK: - Label arrival
        
        newArrivalLabel.frame = CGRect(x: 20, y: 60, width: 200, height: 20)
        newArrivalLabel.text = "New arrival"
        //        Изменение размера текста
        //        newArrivalLabel.font = newArrivalLabel.font.withSize(50)
        //        Жирный тeкст + изменение размера
        newArrivalLabel.font = UIFont.boldSystemFont(ofSize: 30)
        view.addSubview(newArrivalLabel)
        
        //  MARK: - Label price\name
        
        nameCocomber.frame = CGRect(x: 15, y: 285, width: 120, height: 20)
        nameCocomber.backgroundColor = .white
        nameCocomber.text = "Michigan Coat"
        nameCocomber.font = UIFont.boldSystemFont(ofSize: 15)
        self.view.addSubview(nameCocomber)
        
        nameLong.frame = CGRect(x: 220, y: 285, width: 150, height: 20)
        nameLong.backgroundColor = .white
        nameLong.text = "Highland Jacket"
        nameLong.font = UIFont.boldSystemFont(ofSize: 15)
        self.view.addSubview(nameLong)
        
        priceCocomber.frame = CGRect(x: 15, y: 310, width: 120, height: 20)
        priceCocomber.backgroundColor = .white
        priceCocomber.text = "$ 199.00"
        priceCocomber.font = priceCocomber.font.withSize(15)
        self.view.addSubview(priceCocomber)
        
        priceLong.frame = CGRect(x: 220, y: 310, width: 120, height: 20)
        priceLong.backgroundColor = .white
        priceLong.text = "$ 299.00"
        priceLong.font = priceLong.font.withSize(15)
        self.view.addSubview(priceLong)
        
        
        //        MARK: Buttons
        
        cocomberButton.frame = CGRect(x: 15, y: 90, width: 180, height: 180)
        cocomberButton.setImage(UIImage(named: "cocomberDark.jpeg"), for: .normal)
        cocomberButton.addTarget(self, action: #selector(cocomberPage), for: .touchUpInside)
        self.view.addSubview(cocomberButton)
        
        longButton.frame = CGRect(x: 220, y: 90, width: 180, height: 180)
        longButton.setImage(UIImage(named: "longPurp.jpeg"), for: .normal)
        longButton.addTarget(self, action: #selector(longPage), for: .touchUpInside)
        self.view.addSubview(longButton)
        
    }
    
    @objc func cocomberPage() {
        let cocomber = Cocomber()
        cocomber.imageArray.append(UIImage(named:"cocomberDark.jpeg"))
        cocomber.modalPresentationStyle = .popover
        
        present(cocomber, animated: true)
    }
    
    @objc func longPage() {
        let longVC = Long()
        longVC.modalPresentationStyle = .popover
        present(longVC, animated: true)
    }
}

//        MARK: cocomber class

class Cocomber: UIViewController {
    
    var sizePicker = UIPickerView()
    var segmentControlCoc = UISegmentedControl()
    var imageCocomber = UIImageView()
    var coast = UILabel()
    var name = UILabel()
    var niga = ""
    var menuArray = ["Dark", "Yellow"]
    //    cocomberMenu.jpeg
    var imageArray = [
        UIImage(named:"cocomberMenuLight.jpeg")]
    let sizesArray = ["48","50","52","54","56","58"]
    var selectedRow = 0
    let addButton = UIButton()
    
    // MARK: - Life cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //        image ang text
        imageCocomber.frame = CGRect(x: 0, y: 0, width: 420, height: 420)
        imageCocomber.center.x = view.center.x
        imageCocomber.image = imageArray[0]
        view.addSubview(imageCocomber)
        
        name.frame = CGRect(x: 35, y: 450, width: 180, height: 20)
        name.text = "Michigan Coat"
        name.font = UIFont.boldSystemFont(ofSize: 20)
        view.addSubview(name)
        
        coast.frame = CGRect(x: 175, y: 450, width: 150, height: 20)
        coast.text = "$ 199.00"
        coast.font = UIFont.boldSystemFont(ofSize: 20)
        coast.textColor = .systemGray
        view.addSubview(coast)
        
        //       segment control
        
        segmentControlCoc = UISegmentedControl(items: menuArray)
        segmentControlCoc.frame = CGRect(x: 0, y: 385, width: 200, height: 30)
        segmentControlCoc.center.x = imageCocomber.center.x
        segmentControlCoc.addTarget(self, action: #selector(selectColor), for: .valueChanged)
        view.addSubview(segmentControlCoc)
        
        //        picker
        
        sizePicker.frame = CGRect(x: 0, y: 500, width: 200, height: 50)
        sizePicker.center.x = imageCocomber.center.x
        sizePicker.selectRow(selectedRow, inComponent: 0, animated: false)
        sizePicker.dataSource = self
        sizePicker.delegate = self
        view.addSubview(sizePicker)
        
        //        button add to cart
        addButton.frame = CGRect(x: 0, y: 650, width: 400, height: 80)
        addButton.center.x = imageCocomber.center.x
        addButton.backgroundColor = .black
        addButton.setTitleColor(.systemGray, for: .normal)
        addButton.setTitle("Add To Cart - Free Shipping", for: .normal)
        addButton.contentHorizontalAlignment = .center
        addButton.layer.cornerRadius = 5
        view.addSubview(addButton)
        
    }
    
    @objc func selectColor(target: UISegmentedControl) {
        if target == segmentControlCoc {
            let segmentIndex = target.selectedSegmentIndex
            
            imageCocomber.image = imageArray[segmentIndex]
        }
    }
}

// MARK: - UIPickerViewDataSource

extension Cocomber: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sizesArray.count
    }
}

// MARK: - UIPickerViewDelegate

extension Cocomber: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let result = sizesArray[row]
        return result
    }
}

//        MARK: long class

class Long: UIViewController {
    
    var sizePicker = UIPickerView()
    var segmentControlLong = UISegmentedControl()
    var imageLong = UIImageView()
    var coastLabel = UILabel()
    var nameLabel = UILabel()
    var menuArray = ["Green", "Dark Navy"]
    let imageArray = [UIImage(named: "longMenu.jpeg"),
                      UIImage(named:"longMenuDark.jpeg")]
    let sizesArray = ["48","50","52","54","56","58"]
    let addToCardButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupUI()

        //       segment control
        
        segmentControlLong = UISegmentedControl(items: menuArray)
        segmentControlLong.frame = CGRect(x: 0, y: 385, width: 200, height: 30)
        segmentControlLong.center.x = imageLong.center.x
        segmentControlLong.addTarget(self, action: #selector(selectColor), for: .valueChanged)
        view.addSubview(segmentControlLong)
        
        sizePicker.frame = CGRect(x: 0, y: 500, width: 200, height: 50)
        sizePicker.center.x = imageLong.center.x
        sizePicker.dataSource = self
        sizePicker.delegate = self
        view.addSubview(sizePicker)
        
    }
    
    func setupUI() {
        createNameLabel()
        createLongImage()
        createCoastLabel()
        createAddToCardButton()
    }
    
    func createNameLabel() {
        nameLabel.frame = CGRect(x: 35, y: 450, width: 180, height: 20)
        nameLabel.text = "Highland Jacket"
        nameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        view.addSubview(nameLabel)
    }
    
    func createLongImage() {
        imageLong.frame = CGRect(x: 0, y: 0, width: 420, height: 420)
        imageLong.center.x = view.center.x
        imageLong.image = imageArray[0]
        view.addSubview(imageLong)
    }
    
    func createCoastLabel() {
        coastLabel.frame = CGRect(x: 190, y: 450, width: 150, height: 20)
        coastLabel.text = "$ 299.00"
        coastLabel.font = UIFont.boldSystemFont(ofSize: 20)
        coastLabel.textColor = .systemGray
        view.addSubview(coastLabel)
    }
    
    func createAddToCardButton() {
        addToCardButton.frame = CGRect(x: 0, y: 650, width: 400, height: 80)
        addToCardButton.center.x = imageLong.center.x
        addToCardButton.backgroundColor = .black
        addToCardButton.setTitleColor(.systemGray, for: .normal)
        addToCardButton.setTitle("Add To Cart - Free Shipping", for: .normal)
        addToCardButton.contentHorizontalAlignment = .center
        addToCardButton.layer.cornerRadius = 5
        view.addSubview(addToCardButton)
    }
    
    @objc func selectColor(target: UISegmentedControl) {
        if target == segmentControlLong {
            let segmentIndex = target.selectedSegmentIndex
            
            imageLong.image = imageArray[segmentIndex]
        }
    }
}

extension Long: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sizesArray.count
    }
}

extension Long: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let result = sizesArray[row]
        return result
    }
}

