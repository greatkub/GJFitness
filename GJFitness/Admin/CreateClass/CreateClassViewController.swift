//
//  CreateClassViewController.swift
//  GJFitness
//
//  Created by James S on 11/2/2564 BE.
//

import UIKit

class CreateClassViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func BackToClassList(_ sender: Any) {
        self.dismiss(animated: true) {
            print("Back to class list screen")
        }
    }
    
}
