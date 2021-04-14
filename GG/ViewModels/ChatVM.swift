//
//  ChatVM.swift
//  GG
//
//  Created by Yannick Lawler on 17.03.21.
//

import UIKit


class ChatVM {
    
    private var user: GGUser!
    private var friends: [GGUser] = []
    private var selectedIndexPath: IndexPath?
    
    init() {
        loadData()
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfItemsInSection() -> Int {
        return self.user.getNumberOfChats()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChatCollectionViewCell.identifier, for: indexPath) as! ChatCollectionViewCell
        
        if let friendsChat = self.user.getChatDescriptionFor(int: indexPath.item) {
            cell.configure(chat: friendsChat)
        } else {
            print("Error loading chat")
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 72)
    }
    
    func collectionView(didSelectItemAt indexPath: IndexPath, viewController: UIViewController) {
        self.selectedIndexPath = indexPath
        viewController.performSegue(withIdentifier: "showFriendsChat", sender: self)
    }
    
    func loadData() {
        // Setup Data
        self.user = GGUser(name: "ylawler")
        let friend1 = GGUser(name: "Friend 1")
        self.user.addNewChat(for: friend1)
    }
    
    
}
