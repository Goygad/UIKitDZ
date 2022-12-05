//
//  ViewController.swift
//  UIKitDz
//
//  Created by Balik on 16.09.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    
    var isTimerRuning = false
    var startPauseButton = true
    var timer = Timer()
    var counter = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func startDidTap(_ sender: Any) {
//        if startPauseButton == false {
//            startButton.setTitle("START", for: .normal)
//            startButton.backgroundColor = .systemGreen
//            startButton.setTitleColor(.green, for: .normal)
//            startButton.layer.cornerRadius = 50
//            startPauseButton = true
//
//        } else {
//            startButton.setTitle("PAUSE", for: .normal)
//            startButton.backgroundColor = .systemRed
//            startButton.setTitleColor(.red, for: .normal)
//            startButton.layer.cornerRadius = 50
//            startPauseButton = false
//            if isTimerRuning == true {
//                timer.invalidate()
//            }
//        }
        startButton.isEnabled = false
        
        if !isTimerRuning {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func pauseDidTap(_ sender: Any) {
        isTimerRuning = false
        timer.invalidate()
        startButton.isEnabled = true

    }
    
    @IBAction func resetDidTap(_ sender: Any) {
        timer.invalidate()
        isTimerRuning = false
        counter = 0.0
        timerLabel.text = "00:00:00"
        startButton.isEnabled = true
    }
    
//    MARK: - Доп функции
    @objc func runTimer() {
        counter += 0.1
        
        let flooredCounter = Int(floor(counter))
        
        let hour = flooredCounter / 3600
        var hourString = "\(hour)"
        if hour < 10 {
            hourString = "0\(hour)"
        }
        
        let minute = (flooredCounter % 3600) / 60
        var minuteString = "\(minute)"
        if minute < 10 {
            minuteString = "0\(minute)"
        }
        
        let second = (flooredCounter % 3600) % 60
        var secondString = "\(second)"
        if second < 10 {
            secondString = "0\(second)"
        }

        timerLabel.text = "\(hourString):\(minuteString):\(secondString)"
    }
}

