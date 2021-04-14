//
//  TournamentDetailVM.swift
//  GG
//
//  Created by Yannick Lawler on 13.04.21.
//

import UIKit

class TournamentDetailVM {
    
    
    init() {
        print("initialized Tournament Detail VM")
    }
    
    
    func numberOfSections() -> Int {
        return 2
    }
    
    func collectionView(numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TournamentDetailCVC.identifier, for: indexPath) as! TournamentDetailCVC
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: collectionView.frame.width, height: 240)
        }
        return CGSize(width: collectionView.frame.width, height: 64)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: StickyHeaderReusableView.identifier, for: indexPath) as! StickyHeaderReusableView
        return header
    }
    
    func sizeForItem(_ collectionView: UICollectionView, at indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 96)
    }
    
    func minimumLineSpacingForSection() -> CGFloat {
        return 0
    }
    
    func minimumInteritemSpacingForSection() -> CGFloat {
        return 0
    }
    
}
