//
//  EditRoomViewController.swift
//  GJFitness
//
//  Created by James S on 28/2/2564 BE.
//

import UIKit

class EditRoomViewController: UIViewController {
    
    @IBOutlet var bgView: UIView!
    @IBOutlet var doneButton: UIButton!
    @IBOutlet var lineview: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        doneButton.layer.cornerRadius = 15
        lineview.layer.cornerRadius = 2
        bgView.clipsToBounds = true
        bgView.layer.cornerRadius = 50
        bgView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]

    }
}
