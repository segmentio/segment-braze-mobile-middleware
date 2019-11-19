//
//  ViewController.swift
//  SegmentBrazeDebounce-iOS
//
//  Created by Brandon Sneed on 10/22/19.
//  Copyright © 2019 Brandon Sneed. All rights reserved.
//

import UIKit
import Analytics

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        textField.text = "SomeUser"
    }

    @IBAction func sendIdentifyAction(_ sender: Any) {
        SEGAnalytics.shared()?.identify(textField.text)
    }
    
}

