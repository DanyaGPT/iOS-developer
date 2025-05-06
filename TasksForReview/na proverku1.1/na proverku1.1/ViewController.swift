//
//  ViewController.swift
//  na proverku1.1
//
//  Created by Зорин Даниил on 06.05.2025.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    var counter = 0

    @IBOutlet weak var counterLabel: UILabel!
    

    @IBAction func pipi(_ sender: Any) {
        counter += 1
        counterLabel.text = "счет:\(counter)"
    }
    
}

