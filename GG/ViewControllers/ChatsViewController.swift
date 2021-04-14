//
//  ChatViewController.swift
//  GG
//
//  Created by Yannick Lawler on 14.03.21.
//

import UIKit

class ChatsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let chatVM = ChatVM()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationAndTabBar()
        setupCollectionView()
    }
    
    


    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showFriendsChat" {
            let dest = segue.destination as! ChatDetailVC
            dest.hidesBottomBarWhenPushed = true
        }
    }


}

// MARK: - Setup Functions
extension ChatsViewController {
    fileprivate func setupCollectionView() {
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.alwaysBounceVertical = true
        collectionView.register(ChatCollectionViewCell.nib(), forCellWithReuseIdentifier: ChatCollectionViewCell.identifier)
    }
}

// MARK: - CollectionView
extension ChatsViewController {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return chatVM.numberOfSections()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chatVM.numberOfItemsInSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return chatVM.collectionView(collectionView, cellForItemAt: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return chatVM.collectionView(collectionView, layout: collectionViewLayout, sizeForItemAt: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        chatVM.collectionView(didSelectItemAt: indexPath, viewController: self)
    }
}
