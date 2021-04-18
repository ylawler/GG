//
//  SignInVC.swift
//  GG
//
//  Created by Yannick Lawler on 15.04.21.
//

import UIKit

enum signInState {
    case userInfo
    case userRegister
    case userSignIn
}

class SignInVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, signInButtonDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var logoImage: UIImageView!
    
    let userSignInPlaceholders = ["Username or Email", "Password"]
    
    var state: signInState = .userSignIn
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(TextFieldEntryCVC.nib(), forCellWithReuseIdentifier: TextFieldEntryCVC.identifier)
        
        collectionView.register(ButtonCVC.nib(), forCellWithReuseIdentifier: ButtonCVC.identifier)
        
        
        hideKeyboardWhenTappedAround()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return userSignInPlaceholders.count
        case 1:
            return 1
        default:
            return 0
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TextFieldEntryCVC.identifier, for: indexPath) as! TextFieldEntryCVC
            cell.configure(placeholder: userSignInPlaceholders[indexPath.item])
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ButtonCVC.identifier, for: indexPath) as! ButtonCVC
            cell.delegate = self
            cell.configure(state)
            
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch indexPath.section {
        case 0:
            return CGSize(width: collectionView.frame.width, height: 48)
        case 1:
            return CGSize(width: collectionView.frame.width, height: 32 + 6 + 42 + 36 + 24)
        default:
            return .zero
        }
        
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch section {
        case 0:
            return 18
        case 1:
            return 24
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func didTapSignInButton(_ buttonState: signInState) {
        switch buttonState {
        case .userInfo:
            print("Continue to get email and password")
        case .userRegister:
            print("Register new User")
        case .userSignIn:
            print("User Sign In")
        }
    }
    
    @IBAction func dismissButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
