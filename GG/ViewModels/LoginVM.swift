//
//  LoginVM.swift
//  GG
//
//  Created by Yannick Lawler on 14.04.21.
//

import UIKit

class LoginVM {
    
    let items = ["Register for Free", "Be part of an amazing Community", "Join custom tournaments and win amazing prizes"]
    let images: [UIImage] = [UIImage(named: "WZ_3.png") ?? UIImage(), UIImage(named: "WZ_4.png") ?? UIImage(), UIImage(named: "WZ_5.png") ?? UIImage()]
    
    init() {
        
    }
    
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfItems() -> Int {
        return items.count
    }
    
    func cellForItem(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: loginDescCVC.identifier, for: indexPath) as! loginDescCVC
        
        if indexPath.item%2 == 0 {
            cell.configure(text: items[indexPath.item], top: true, image: images[indexPath.item])
        } else {
            cell.configure(text: items[indexPath.item], bottom: true, image: images[indexPath.item])
        }
        
        
        return cell
    }
    
    func sizeForItem(_ collectionView: UICollectionView) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func minimumLineSpacing() -> CGFloat {
        return 0
    }
    
    func minimumInteritemSpacing() -> CGFloat {
        return 0
    }
}
