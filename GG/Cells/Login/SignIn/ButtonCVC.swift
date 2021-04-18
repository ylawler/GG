//
//  ButtonCVC.swift
//  GG
//
//  Created by Yannick Lawler on 15.04.21.
//

import UIKit

protocol signInButtonDelegate {
    func didTapSignInButton(_ buttonState: signInState)
}

class ButtonCVC: UICollectionViewCell {
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var SignInChangeButton: UIButton!
    @IBOutlet weak var SignInChangeLabel: UILabel!
    
    private var buttonState: signInState!
    
    var delegate: signInButtonDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        button.layer.cornerRadius = 12
    }
    
    func configure(_ state: signInState) {
        self.buttonState = state
        var title: String = ""
        var titleChange: String = ""
        var labelChange: String = ""
        
        if state == .userInfo {
            title = "continue"
            titleChange = "Sign In"
            labelChange = "Already have account?"
        } else if state == .userRegister {
            title = "Register"
            titleChange = "Sign In"
            labelChange = "Already have account?"
        } else if state == .userSignIn {
            title = "Sign In"
            titleChange = "Register"
            labelChange = "Don't have an account?"
        }
        
        button.setTitle(title, for: .normal)
        SignInChangeButton.setTitle(titleChange, for: .normal)
        SignInChangeLabel.text = labelChange
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        if let del = self.delegate {
            del.didTapSignInButton(buttonState)
        }
    }
    
    @IBAction func signInChoiceChangeTapped(_ sender: UIButton) {
        
    }
    
    static let identifier = "ButtonCVCId"
    
    static func nib() -> UINib {
        return UINib(nibName: "ButtonCVC", bundle: nil)
    }
}
