//
//  GGSignUpVC.swift
//  GG
//
//  Created by Yannick Lawler on 18.04.21.
//

import UIKit
import FirebaseAuth


class GGSignUpVC: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateInfoButton: UIButton!
    
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loadingScreenView: UIVisualEffectView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        hideLoadingScreen()
        hideKeyboardWhenTappedAround()
        signUpButton.layer.cornerRadius = signUpButton.frame.height / 2
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func hideLoadingScreen() {
        loadingScreenView.isHidden = true
        activityIndicator.stopAnimating()
    }
    
    func displayLoadingScreen() {
        loadingScreenView.isHidden = false
        activityIndicator.startAnimating()
    }
    
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        displayLoadingScreen()
        // display loading screen
        
        // Authenticate new user
        
        if emailTextField.text != "" && usernameTextField.text != "" && passwordTextField.text != "" && confirmPasswordTextField.text != "" {
            
            
            let email = emailTextField.text!
            let username = usernameTextField.text!
            let password = passwordTextField.text!
            let confirmPassword = confirmPasswordTextField.text!
            
            if password == confirmPassword {
                // Passwords match
                // Create user
                print("create user: \(username) with email: \(email)")
                Auth.auth().createUser(withEmail: email, password: password) { (AuthResult, error) in
                    guard let result = AuthResult, error != nil else {
                        self.hideLoadingScreen()
                        print("error creating user: \(String(describing: error?.localizedDescription))")
                        return
                    }
                    print("result: \(result)")
                    // We have a result, newly signed In user
                    self.hideLoadingScreen()
                    self.performSegue(withIdentifier: "GGCreateProfileSegue", sender: self)
                }
            }
        } else {
            print("Textfields missing")
            hideLoadingScreen()
            self.performSegue(withIdentifier: "GGCreateProfileSegue", sender: self)
        }
        
        
        
       
        
        // show GG profile setup VC
        
    }
    
}
