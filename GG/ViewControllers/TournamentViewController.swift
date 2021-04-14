//
//  TournamentViewController.swift
//  GG
//
//  Created by Yannick Lawler on 19.03.21.
//

import UIKit

class TournamentViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let tournamentDetailVM = TournamentDetailVM()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.alwaysBounceVertical = true
        collectionView.register(TournamentDetailCVC.nib(), forCellWithReuseIdentifier: TournamentDetailCVC.identifier)
//        collectionView.register(StickyHeaderReusableView.nib(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: StickyHeaderReusableView.identifier)
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return tournamentDetailVM.numberOfSections()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tournamentDetailVM.collectionView(numberOfItemsInSection: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return tournamentDetailVM.collectionView(collectionView, cellForItemAt: indexPath)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return tournamentDetailVM.collectionView(collectionView, layout: collectionViewLayout, referenceSizeForHeaderInSection: section)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        return tournamentDetailVM.collectionView(collectionView, viewForSupplementaryElementOfKind: kind, at: indexPath)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return tournamentDetailVM.sizeForItem(collectionView, at: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return tournamentDetailVM.minimumLineSpacingForSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return tournamentDetailVM.minimumInteritemSpacingForSection()
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
