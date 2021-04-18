//
//  MultipleEntriesCVC.swift
//  GG
//
//  Created by Yannick Lawler on 17.04.21.
//

import UIKit

class MultipleEntriesCVC: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var placeholders: [String] = []
    
//    private let userInfoPlaceholders = ["Username", "Activision ID"]
//    private let userRegisterPlaceholders = ["Email", "Password"]

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(TextFieldEntryCVC.nib(), forCellWithReuseIdentifier: TextFieldEntryCVC.identifier)
    }
    
    func configure(placeholders: [String]) {
        self.placeholders = placeholders
    }
    
    static let identifier = "MultipleEntriesCVCId"
    
    static func nib() -> UINib {
        return UINib(nibName: "MultipleEntriesCVC", bundle: nil)
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return placeholders.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TextFieldEntryCVC.identifier, for: indexPath) as! TextFieldEntryCVC
        cell.configure(placeholder: placeholders[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 48)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 18
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

}
