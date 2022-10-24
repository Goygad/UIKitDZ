//
//  ViewControllerTwo.swift
//  UIKitDz
//
//  Created by Balik on 13.10.2022.
//

import UIKit
import AVFoundation


class ViewControllerTwo: UIViewController {
    
    var ogTimeLabel = UILabel()
    var player = AVAudioPlayer()
    let slider = UISlider()
    var taxitr = ""
    var taxiTrackPic = UIImageView()
    var ogTrackPic = UIImageView()
    var taxiPic = UIImage()
    var ogPic = UIImage()
    var buttonPlay = UIButton()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
//        taxi image
        let taxi1 = taxiTrackPic
        taxi1.frame = CGRect(x: 17, y: 150, width: 380, height: 380)
        taxi1.image = taxiPic
        self.view.addSubview(taxiTrackPic)
        
//         og image
        let og1 = ogTrackPic
        og1.frame = CGRect(x: 17, y: 150, width: 380, height: 380)
        og1.image = ogPic
        self.view.addSubview(ogTrackPic)
//        label
        ogTimeLabel.frame = CGRect(x: 330, y: 120, width: 50, height: 30)
        ogTimeLabel.text = " \(taxitr)"
        ogTimeLabel.textAlignment = .right
        ogTimeLabel.textColor = .systemGray
        self.view.addSubview(ogTimeLabel)
//        duration slider
        let durationSlider = slider
        durationSlider.frame = CGRect(x: 80, y: 550, width: 250, height: 10)
        durationSlider.value = 100
        self.slider.minimumValue = 0.0
        self.slider.maximumValue = 100.0
        self.slider.addTarget(self, action: #selector(changeSlider), for: .valueChanged)

        self.view.addSubview(slider)
        
//MARK:  кнопка плей стоп
        buttonPlay.frame = CGRect(x: 180, y: 700, width: 50, height: 50)
        buttonPlay.backgroundColor = .white
        buttonPlay.setImage(UIImage(systemName: "pause.fill"), for: .normal)
//        изменение цвета и размера кнопки
        buttonPlay.imageView?.tintColor = .black
        buttonPlay.contentHorizontalAlignment = .fill
        buttonPlay.contentVerticalAlignment = .fill
        buttonPlay.imageView?.contentMode = .scaleAspectFit
        buttonPlay.addTarget(self, action: #selector(playPause), for: .touchUpInside)   
        self.view.addSubview(buttonPlay)
//        функция плей стоп
    }
    @objc func playPause() {
        if  player .isPlaying{
            player.pause()
        buttonPlay.setImage(UIImage(systemName: "play.fill"), for: .normal)
        } else { player.play()
            buttonPlay.setImage(UIImage(systemName: "pause.fill"), for: .normal)}
    }
   
   
    
    func playOgTrack() {
        do {
            if  let audioOg = Bundle.main.path(forResource: "ogdens", ofType: "m4a") {
                try  player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioOg))
            }
        }
        catch  {
            print("error")
        }
        player.play()
    }
    
    func playTaxiTrack() {
        do {
            if  let audioT = Bundle.main.path(forResource: "такси", ofType: "mp3") {
                try  player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioT))

            }
        }
        catch  {
            print("error")
        }
        player.play()
    }
    //        duration slider func

    @objc func changeSlider(sender: UISlider) {
        if sender == slider {
            self.player.currentTime = TimeInterval(sender.value)
        }
    }
    
}



