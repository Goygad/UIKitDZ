//
//  ViewController.swift
//  UIKitDz
//
//  Created by Balik on 16.09.2022.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {

    var ogDensTrack = UIImageView()
    var taxiTrack = UIImageView()
    var ogTimeLabel = UILabel()
    var taxiTimeLabel = UILabel()
    var lineO = UIView()
    var lineT = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
//      MARK: Og track
//        image Og
        let ogDensPic = ogDensTrack
        ogDensPic.frame = CGRect(x: 20, y: 100, width: 70, height: 70)
        ogDensPic.image = UIImage(named: "ogdensPic.jpeg")
        self.view.addSubview(ogDensPic)
        
//        button Og
        let ogButton = UIButton()
        ogButton.frame = CGRect(x: 100, y: 120, width: 220, height: 30)
        ogButton.setTitle("Ogdens", for: .normal)
        ogButton.setTitleColor(.black, for: .normal)
        ogButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
        ogButton.contentHorizontalAlignment = .left
        ogButton.addTarget(self, action: #selector(nextOgVC), for: .touchUpInside)
        self.view.addSubview(ogButton)
        
//        label og
        ogTimeLabel.frame = CGRect(x: 330, y: 120, width: 50, height: 30)
        ogTimeLabel.text = "2:35"
        ogTimeLabel.textAlignment = .right
        ogTimeLabel.textColor = .systemGray
        self.view.addSubview(ogTimeLabel)
        
        lineO.frame = CGRect(x: 25, y: 180, width: 360, height: 1)
        lineO.backgroundColor = .systemGray
        self.view.addSubview(lineO)
        
//      MARK: taxi track
//        image taxi
        let taxi = taxiTrack
        taxi.frame = CGRect(x: 20, y: 200, width: 70, height: 70)
        taxi.image = UIImage(named: "боярский.jpeg")
        self.view.addSubview(taxi)
        
//        button taxi
        let taxiButton = UIButton()
        taxiButton.frame = CGRect(x: 100, y: 220, width: 220, height: 30)
        taxiButton.setTitle("  Зеленоглазое такси", for: .normal)
        taxiButton.setTitleColor(.black, for: .normal)
        taxiButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        taxiButton.contentHorizontalAlignment = .left
        taxiButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
        taxiButton.addTarget(self, action: #selector(nextTaxiVC), for: .touchUpInside)
        self.view.addSubview(taxiButton)
        
//        label taxi
        taxiTimeLabel.frame = CGRect(x: 330, y: 220, width: 50, height: 30)
        taxiTimeLabel.text = "5:23"
        taxiTimeLabel.textAlignment = .right
        taxiTimeLabel.textColor = .systemGray
        self.view.addSubview(taxiTimeLabel)
//        line
        lineT.frame = CGRect(x: 25, y: 280, width: 360, height: 1)
        lineT.backgroundColor = .systemGray
        self.view.addSubview(lineT)
        
    }

//    Переход на следующий экран
    @objc func nextTaxiVC() {
        let twoVC = ViewControllerTwo()
        twoVC.playTaxiTrack()
        twoVC.taxitr = "kk"
        twoVC.taxiPic = UIImage(named: "боярский.jpeg")!
//        выбор отображения экрана
        navigationController?.modalPresentationStyle = .popover
        present(twoVC, animated: true)
    }
    
    @objc func nextOgVC() {
        let twoVC = ViewControllerTwo()
        twoVC.playOgTrack()
        twoVC.ogPic = UIImage(named: "ogdensPic.jpeg")!

//        выбор отображения экрана
        navigationController?.modalPresentationStyle = .popover
        present(twoVC, animated: true)
    }
}

