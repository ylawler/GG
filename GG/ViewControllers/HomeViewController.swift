//
//  HomeViewController.swift
//  GG
//
//  Created by Yannick Lawler on 14.03.21.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let homeVM = HomeVM()
    
    var GG_user: User?
    
    private var selectedTournamentUpcoming: UpcomingTournament?
    private var selectedTournamentFuture: FutureTournament?
    
    private var selectedIndexPath: IndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if GG_user == nil {
            // return to login
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let VC = storyBoard.instantiateViewController(withIdentifier: "LoginVC")
            VC.modalPresentationStyle = .fullScreen
            self.present(VC, animated: true, completion: nil)
        }

        // Do any additional setup after loading the view.
        setupNavigationAndTabBar()
        setupCollectionView()
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showTournament" {
            print("showing tournament")
            let dest = segue.destination as! TournamentViewController
            
            var title: String = ""
            
            guard let selectedIdx = self.selectedIndexPath else { return }
            
            if selectedIdx.section == 0 {
                guard let selectedTournament = self.selectedTournamentUpcoming else { return }
                title = selectedTournament.name
            } else {
                guard let selectedTournament = self.selectedTournamentFuture else { return }
                title = selectedTournament.name
            }
            dest.hidesBottomBarWhenPushed = true
            dest.navigationItem.title = title
            
            
        }
        
        
    }
    
}



// MARK: - Setup Functions
extension HomeViewController {
    fileprivate func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.alwaysBounceVertical = true
        collectionView.register(HeaderReusableView.nib(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderReusableView.identifier)
        collectionView.register(TournamentCVC.nib(), forCellWithReuseIdentifier: TournamentCVC.identifier)
        collectionView.register(UpcomingTournamentsCVC.nib(), forCellWithReuseIdentifier: UpcomingTournamentsCVC.identifier)
        collectionView.register(FutureTournamentsCVC.nib(), forCellWithReuseIdentifier: FutureTournamentsCVC.identifier)
        
        
    }
    
}


// MARK: - CollectionView
extension HomeViewController {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return homeVM.numberOfSections()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeVM.collectionView(numberOfItemsInSection: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return homeVM.collectionView(collectionView, cellForItemAt: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        return homeVM.collectionView(collectionView, viewForSupplementaryElementOfKind: kind, at: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return homeVM.collectionView(collectionView, layout: collectionViewLayout, referenceSizeForHeaderInSection: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return homeVM.collectionView(collectionView, layout: collectionViewLayout, sizeForItemAt: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return homeVM.collectionView(collectionView, layout: collectionViewLayout, minimumInteritemSpacingForSectionAt: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return homeVM.collectionView(collectionView, layout: collectionViewLayout, minimumLineSpacingForSectionAt: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            guard let upcomingTournament = homeVM.collectionView(didSelectItemAt: indexPath) as? UpcomingTournament else { return }
            self.selectedTournamentUpcoming = upcomingTournament
        } else {
            guard let futureTournament = homeVM.collectionView(didSelectItemAt: indexPath) as? FutureTournament else { return }
            self.selectedTournamentFuture = futureTournament
        }
        
        self.selectedIndexPath = indexPath
        self.performSegue(withIdentifier: "showTournament", sender: self)
        
        
    }
    
}



// MARK: - ViewController Extensions
extension UIViewController {
    func setupNavigationAndTabBar() {
        // TabBar
        self.tabBarController?.tabBar.backgroundImage = UIImage()
        self.tabBarController?.tabBar.shadowImage = UIImage()
        self.tabBarController?.tabBar.clipsToBounds = true
        
        // NavigationBar
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.clipsToBounds = true
    }
}
