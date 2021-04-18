//
//  TextFieldEntryCVC.swift
//  GG
//
//  Created by Yannick Lawler on 15.04.21.
//

import UIKit

class TextFieldEntryCVC: UICollectionViewCell, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    
    var placeholder: String = ""

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        textField.delegate = self
        
        textField.clearButtonMode = .whileEditing
        
        textField.attributedPlaceholder = NSAttributedString(string: "Placeholder", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .thin)])
        
       
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("TextFieldEditing ended")
        if textField.text == "" {
            self.displayyPlaceholder(true)
        } else {
            self.displayyPlaceholder(false)
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.placeholder = ""
    }
    
    func configure(placeholder: String) {
        self.placeholder = placeholder
        self.displayyPlaceholder(true)
    }
    
    static let identifier = "TextFieldEntryCVCId"
    
    static func nib() -> UINib {
        return UINib(nibName: "TextFieldEntryCVC", bundle: nil)
    }
    
    func displayyPlaceholder(_ shouldDisplay: Bool) {
        if shouldDisplay {
            textField.placeholder = self.placeholder
        } else {
            textField.placeholder = ""
        }
    }

}


extension UIViewController {
    func hideKeyboardWhenTappedAround() {
            let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
            tap.cancelsTouchesInView = false
            view.addGestureRecognizer(tap)
        }
        
        @objc func dismissKeyboard() {
            view.endEditing(true)
        }
}
