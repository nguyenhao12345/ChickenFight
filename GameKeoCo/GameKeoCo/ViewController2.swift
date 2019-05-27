//
//  Remote.swift
//  GameKeoCo
//
//  Created by Nguyen Hieu on 3/1/19.
//  Copyright © 2019 com.nguyenhieu.game. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    private var valueSlider: Float = 0.5
    private var timer = Timer()
    var counter = 4
    private var coPlayer = 0        //0 hoà, 1 ng win 2 bot win
    
    @IBOutlet weak var viewGameOver: UIView!
    @IBOutlet weak var lblMes: UILabel!
    @IBOutlet weak var sliderGaCon: UISlider!
    @IBOutlet weak var tapPlay11: UIButton!
    @IBOutlet weak var tapPlay12: UIButton!
    @IBOutlet weak var tapBot2: UIButton!
    @IBOutlet weak var tapBot1: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        tapBot2.isHidden = true
        tapBot1.isHidden = true
        tapPlay11.isHidden = true
        tapPlay12.isHidden = true
        viewGameOver.isHidden = true
        
        sliderGaCon.value = valueSlider
        sliderGaCon.setThumbImage(UIImage(named: "gacon"), for: .normal)
        lblMes.text = "Ready!"

        playGame()
       
    }
    func playGame() {
        // just in case this button is tapped multiple times
        timer.invalidate()
        // start the timer
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    @objc func timerAction() {
        counter -= 1
        lblMes.text = "\(counter)"
        if counter == 0 {
            timer.invalidate()
            lblMes.text = "Start..."
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction2), userInfo: nil, repeats: false)
        }
        else {
            return
        }
    }
    @objc func timerAction2() {
        lblMes.text = ""
        tapPlay11.isHidden = false
        tapPlay12.isHidden = false
         timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timerActionBotPlayGame), userInfo: nil, repeats: true)
    }
    @objc func timerActionBotPlayGame() {
        if sliderGaCon.value <= sliderGaCon.minimumValue {
            checkResult(coPlayer: 2)
        }
        else {
            valueSlider = valueSlider - 0.05
            sliderGaCon.value = valueSlider
        }
    }
    @IBAction func clickTapPlay11(_ sender: Any) {
        if sliderGaCon.value <= sliderGaCon.minimumValue {
            checkResult(coPlayer: 2)
        }
        else {
            valueSlider = valueSlider - 0.05
            sliderGaCon.value = valueSlider
        }
    }
    
    @IBAction func clickTapPlay12(_ sender: Any) {
        if sliderGaCon.value >= sliderGaCon.maximumValue {
            checkResult(coPlayer: 1)
        }
        else {
            valueSlider = valueSlider + 0.05
            sliderGaCon.value = valueSlider
        }
    }
    func checkResult(coPlayer: Int) {
        tapPlay11.isHidden = true
        tapPlay12.isHidden = true
        viewGameOver.isHidden = false
        switch coPlayer {
        case 1: lblMes.text = "You Win :)"
        case 2: lblMes.text = "You Lose :("
        default:
            break
        }
    }
    
    @IBAction func clickReload(_ sender: Any) {
        valueSlider = 0.5
        lblMes.text = "Ready!"
        sliderGaCon.value = valueSlider
        tapBot2.isHidden = true
        tapBot1.isHidden = true
        tapPlay11.isHidden = true
        tapPlay12.isHidden = true
        viewGameOver.isHidden = true
        counter = 4
        playGame()
    }
    @IBAction func clickHome(_ sender: Any) {
        let homevc = instantiate(Home.self)
        self.present(homevc, animated: true, completion: nil)
    }
}
