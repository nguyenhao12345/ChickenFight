//
//  ViewController.swift
//  GameKeoCo
//
//  Created by Nguyen Hieu on 3/1/19.
//  Copyright © 2019 com.nguyenhieu.game. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var valueSlider: Float = 0.5
    private var timer = Timer()
    var counter = 4
    @IBOutlet weak var viewGameOver: UIView!
    @IBOutlet weak var btnPlayer22: UIButton!
    @IBOutlet weak var btnPlayer21: UIButton!
    @IBOutlet weak var btnPlayer12: UIButton!
    @IBOutlet weak var btnPlayer11: UIButton!
    @IBOutlet weak var siderKeoCo: UISlider!
    @IBOutlet weak var timeStart: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.value = valueSlider
        siderKeoCo.setThumbImage(UIImage(named: "gacon"), for: .normal)
        timeStart.text = "Ready!"
        
        viewGameOver.isHidden = true
        btnPlayer11.isHidden = true
        btnPlayer12.isHidden = true
        btnPlayer21.isHidden = true
        btnPlayer22.isHidden = true
        
        playGame()
    }
    // called every time interval from the timer
    @objc func timerAction() {
        counter -= 1
        timeStart.text = "\(counter)"
        if counter == 0 {
            timer.invalidate()
            timeStart.text = "Start..."
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction2), userInfo: nil, repeats: false)
        }
        else {
             return
        }
    }
    @objc func timerAction2() {
        timeStart.text = ""
        btnPlayer11.isHidden = false
        btnPlayer12.isHidden = false
        btnPlayer21.isHidden = false
        btnPlayer22.isHidden = false
    }
    func checkResult(coPlayer: Int) {
        btnPlayer11.isHidden = true
        btnPlayer12.isHidden = true
        btnPlayer21.isHidden = true
        btnPlayer22.isHidden = true
        viewGameOver.isHidden = false
        switch coPlayer {
        case 1: timeStart.text = "Player1 WIN"
        case 2: timeStart.text = "Player2 WIN"
        default:
            break
        }
    }
    
    @IBOutlet weak var slider: UISlider!
    private var coPlayer = 0        //0 hoà, 1 1win 2 2win
    @IBAction func clickPlayer1(_ sender: Any) {
        if slider.value <= slider.minimumValue {
            checkResult(coPlayer: 1)
        }
        else {
            valueSlider = valueSlider - 0.05
            slider.value = valueSlider
        }
    }
    @IBAction func clickPlayer12(_ sender: Any) {
        if slider.value <= slider.minimumValue {
           checkResult(coPlayer: 1)
        }
        else {
            valueSlider = valueSlider - 0.05
            slider.value = valueSlider
        }
    }
    @IBAction func clickPlayer2(_ sender: Any) {
        if slider.value >= slider.maximumValue {
           checkResult(coPlayer: 2)
        }
        else {
            valueSlider = valueSlider + 0.05
            slider.value = valueSlider
        }
    }
    @IBAction func clickPlayer22(_ sender: Any) {
        if slider.value >= slider.maximumValue {
           checkResult(coPlayer: 2)
        }
        else {
            valueSlider = valueSlider + 0.05
            slider.value = valueSlider
        }
    }
    func playGame() {
        // just in case this button is tapped multiple times
        timer.invalidate()
        // start the timer
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    @IBAction func clickReload(_ sender: Any) {
        valueSlider = 0.5
        timeStart.text = "Ready!"
        siderKeoCo.value = valueSlider
        viewGameOver.isHidden = true
        btnPlayer11.isHidden = true
        btnPlayer12.isHidden = true
        btnPlayer21.isHidden = true
        btnPlayer22.isHidden = true
        
        counter = 4
        playGame()
    }
    @IBAction func clickHome(_ sender: Any) {
        let homevc = instantiate(Home.self)
        self.present(homevc, animated: true, completion: nil)
    }
}

