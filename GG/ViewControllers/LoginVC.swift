//
//  LoginVC.swift
//  GG
//
//  Created by Yannick Lawler on 14.04.21.
//

import UIKit


struct User {
    let name: String
}


class LoginVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var continueAsGuest: UIButton!
    
    private let loginVM = LoginVM()
    private var user: User?
    
    
    enum SignInMethod {
        case signIn
        case createAccount
        case continueAsGuest
    }
    
    @IBAction func buttonTapped(_ button: UIButton) {
        switch button {
        case signInButton:
            self.createUser(name: "Signed In User")
            self.showViewController(withMethod: .signIn)
        case createAccountButton:
            self.createUser(name: "Created User")
            self.showViewController(withMethod: .createAccount)
        case continueAsGuest:
            self.createUser(name: "Guest User")
            self.showViewController(withMethod: .continueAsGuest)
        default:
            print("Error with button tapped")
        }
    }
    
    private func createUser(name: String) {
        self.user = User(name: name)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if user != nil {
            self.showViewController(withMethod: .continueAsGuest)
        }
        
        

        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(loginDescCVC.nib(), forCellWithReuseIdentifier: loginDescCVC.identifier)
        
        pageControl.numberOfPages = loginVM.items.count
        
        [signInButton, createAccountButton].forEach { (button) in
            button?.layer.cornerRadius = 12
            button?.layer.borderWidth = 0.5
            
            button?.layer.shadowColor = UIColor.black.cgColor
            button?.layer.shadowOffset = .zero
            button?.layer.shadowRadius = 2
            button?.layer.shadowOpacity = 0.75
            
        }
        
    }
    
    func showViewController(withMethod: SignInMethod) {
        
        let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        var vc = UIViewController()
        
        switch withMethod {
        case .signIn:
            vc = Storyboard.instantiateViewController(withIdentifier: "signInId")
            vc.modalPresentationStyle = .fullScreen
        case .createAccount:
            vc = Storyboard.instantiateViewController(withIdentifier: "createAccountId")
            vc.modalPresentationStyle = .fullScreen
        case .continueAsGuest:
            self.dismiss(animated: true, completion: nil)
            return
        }
        
        
        self.present(vc, animated: true) {
            print("presenting: \(withMethod)")
        }
    }
    
    
    // MARK: - CollectionView
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return loginVM.numberOfSections()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return loginVM.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return loginVM.cellForItem(collectionView, cellForItemAt: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return loginVM.sizeForItem(collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return loginVM.minimumLineSpacing()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return loginVM.minimumInteritemSpacing()
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl?.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }

    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        pageControl?.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        
        
    }

}
