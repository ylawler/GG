//
//  CreateAccountVC.swift
//  GG
//
//  Created by Yannick Lawler on 15.04.21.
//

import UIKit

class CreateAccountVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    
    
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var createButton: UIButton!
    
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    
    
//    let userInfoPlaceholders = ["Username", "Activision ID"]
//    let userRegisterPlaceholders = ["Email", "Password", "Confirm Password"]
    
    
    let loginInfoRequirements = ["Email", "Password", "Confirm Password"]
    let playerInfoRequirements = ["Username", "Activision ID"]
    
    let createState: createAccountStates = .loginInfos
    
    enum createAccountStates {
        case playerInfos    // -> username and activision ID
        case loginInfos     // -> email and password, and age
    }
    
    
    private var cellHeight: CGFloat = 48
    private var cellSpacing: CGFloat = 18
    
    enum createButtonState {
        case playerInfo // -> username and activision ID
        case loginInfo  // -> email and password, and age
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.register(MultipleEntriesCVC.nib(), forCellWithReuseIdentifier: MultipleEntriesCVC.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        createButton.translatesAutoresizingMaskIntoConstraints = false
        
//        updateCollectionViewHeight()
        setupButton(for: .loginInfo)
        hideKeyboardWhenTappedAround()
    }
    
    func setupButton(for state: createButtonState) {
        switch state {
        case .loginInfo:
            createButton.setTitle("continue", for: .normal)
        case .playerInfo:
            createButton.setTitle("create", for: .normal)
        }
    }
    
//    func setState(_ state: signInState) {
//        self.state = state
//        updateCollectionViewHeight()
//    }
    
//    func updateCollectionViewHeight() {
//        switch self.state {
//        case .userInfo:
//            collectionViewHeight.constant = CGFloat(userInfoPlaceholders.count) * (cellHeight + cellSpacing)
//        case .userRegister:
//            collectionViewHeight.constant = CGFloat(userRegisterPlaceholders.count) * (cellHeight + cellSpacing)
//        default:
//            return
//        }
//
//        collectionView.reloadData()
//        self.view.layoutSubviews()
//    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MultipleEntriesCVC.identifier, for: indexPath) as! MultipleEntriesCVC
        
//        if indexPath.section == 0 {
//            cell.configure(placeholders: userInfoPlaceholders)
//        } else {
//            cell.configure(placeholders: userRegisterPlaceholders)
//        }
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    /*
     
     step 1: email and password and confirm age >= 18
     step 2: username and activision ID
    
     */
    
    @IBAction func createButtonTapped(_ sender: UIButton) {
        var buttonState: createButtonState = .loginInfo
        var scrollToIndex: IndexPath = IndexPath(item: 0, section: 1)
//
//        if self.state == .userInfo {
//            self.state = .userRegister
//            buttonState = .playerInfo
//        } else if self.state == .userRegister {
//            self.state = .userInfo
//            buttonState = .loginInfo
//            scrollToIndex = IndexPath(item: 0, section: 0)
//        }
//
//        UIView.animate(withDuration: 0.75, delay: 0.1, options: .curveEaseInOut) {
//            self.collectionView.scrollToItem(at: scrollToIndex, at: .left, animated: true)
//            self.setupButton(for: buttonState)
//            self.updateCollectionViewHeight()
//        } completion: { (completed) in
//            print("completed animation: \(completed)")
//        }

        
        
        
        
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
