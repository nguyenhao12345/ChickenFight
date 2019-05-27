//
//  Home.swift
//  GameKeoCo
//
//  Created by Nguyen Hieu on 3/1/19.
//  Copyright © 2019 com.nguyenhieu.game. All rights reserved.
//

import UIKit

class Home: UIViewController {


    @IBAction func click2Players(_ sender: Any) {
        let vc2 = instantiate(ViewController.self)
        self.present(vc2, animated: false, completion: nil)
    }
    @IBAction func click1Player(_ sender: Any) {
        let vc1 = instantiate(ViewController2.self)
        self.present(vc1, animated: false, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
