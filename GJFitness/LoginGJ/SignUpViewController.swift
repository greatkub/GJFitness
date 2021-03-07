//
//  SignUpViewController.swift
//  GJFitness
//
//  Created by Krittamet Chuwongworaphinit on 4/3/2564 BE.
//


import UIKit

class SignUpViewController2: UIViewController {
    
    @IBOutlet var logoImgaeView: UIImageView!
    
    @IBOutlet var firsnameField: UITextField!
    @IBOutlet var lastnameField: UITextField!
    @IBOutlet var usernameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var confirmPasswordField: UITextField!
    @IBOutlet var emailField: UITextField!
    
    @IBOutlet var signupButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setElement()
        
    }
    
    @IBAction func backToLogin(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    func setElement() {
        signupButton.layer.cornerRadius = 20
        signupButton.backgroundColor = .systemYellow
        signupButton.tintColor = .white
        
        logoImgaeView.image = UIImage(named:"logo")
        self.view.addSubview(logoImgaeView)
    }
    
}
