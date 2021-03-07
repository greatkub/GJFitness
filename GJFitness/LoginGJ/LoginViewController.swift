//
//  LoginViewController.swift
//  GJFitness
//
//  Created by Krittamet Chuwongworaphinit on 4/3/2564 BE.
//

import UIKit

class LoginViewController2: UIViewController {
    
    @IBOutlet var logoImageView: UIImageView!
    
    @IBOutlet var usernameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
    @IBOutlet var signinButton: UIButton!
    @IBOutlet var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setElement()
        
    }
    
    @IBAction func login(_ sender: Any) {
        
        let masterUsername = "jame"
        let masterPassword = "0000"
        let trainerUsername = "great"
        let trainerPassword = "1111"
        
        
        let username = usernameField.text ?? ""
        let password = passwordField.text ?? ""
        
        if trainerUsername == username && trainerPassword == password {
            
            let storyboard = UIStoryboard(name: "Admin", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "adminVC") as UIViewController
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
        }
        
        if masterUsername == username && masterPassword == password {
            if let vc = self.storyboard?.instantiateViewController(identifier: "classList") {
                present(vc, animated: true, completion: nil)
            }
            
        } else {
            let alert = UIAlertController(title: "Invalid Credentials", message: "Incorrect username or password", preferredStyle: .alert)
            
            let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(alertAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func goSignUpScreen(_ sender: Any) {
        if let vc = self.storyboard?.instantiateViewController(identifier: "signupScreen") {
            present(vc, animated: true, completion: nil)
        }
    }
    
    func setElement() {
        signinButton.layer.cornerRadius = 20
        signinButton.backgroundColor = .systemYellow
        signinButton.tintColor = .white
        
        logoImageView.image = UIImage(named:"logo")
        self.view.addSubview(logoImageView)
    }
    
}
