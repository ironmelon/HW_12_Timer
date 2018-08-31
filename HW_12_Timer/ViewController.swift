//
//  ViewController.swift
//  HW_12_Timer
//
//  Created by Oleg Dynnikov on 7/26/18.
//  Copyright © 2018 Oleg Dynnikov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var timerDirectionsSwitch: UISwitch!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    var timer: Timer?
    var counter = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        updateCounterLabel()
        buttonsEnabled(true)
    }

    @IBAction func timerStoppedButton(_ sender: Any) {
        timer?.invalidate()
        timer = nil
        counter = 0
        updateCounterLabel()
        buttonsEnabled(true)
    }

    @IBAction func timerStartedButton(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerTickHandler), userInfo: nil, repeats: true)
        buttonsEnabled(false)
    }

    func updateCounterLabel() {
        counterLabel.text = "Counter value: \(counter)"
    }

    func buttonsEnabled(_ value: Bool) {
        timerDirectionsSwitch.isEnabled = value

        startButton.isEnabled = value
        startButton.alpha = value ? 1.0 : 0.5

        stopButton.isEnabled = !value
        stopButton.alpha = value ? 0.5 : 1.0
    }

    @objc func timerTickHandler() {
        if timerDirectionsSwitch.isOn {
            counter += 1
        } else { counter -= 1 }
        updateCounterLabel()
    }
}

