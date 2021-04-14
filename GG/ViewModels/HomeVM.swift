//
//  HomeVM.swift
//  GG
//
//  Created by Yannick Lawler on 16.03.21.
//

import UIKit



class HomeVM {
    
    let sections: [String] = ["Upcoming Tournaments", "Future Tournaments"]
    var upcomingTournaments: [UpcomingTournament] = []
    var futureTournaments: [FutureTournament] = []
    
    
    init() {
        setupData()
    }
    
    func numberOfSections() -> Int {
        return self.sections.count
    }
    
    func collectionView(numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            // Upcoming Tournaments section
            return upcomingTournaments.count
        case 1:
            // Future Tournaments section
            return futureTournaments.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TournamentCVC.identifier, for: indexPath) as! TournamentCVC
//        return cell
        
        
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UpcomingTournamentsCVC.identifier, for: indexPath) as! UpcomingTournamentsCVC
            cell.configure(tournament: upcomingTournaments[indexPath.item])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FutureTournamentsCVC.identifier, for: indexPath) as! FutureTournamentsCVC
            cell.configure(tournament: futureTournaments[indexPath.item])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderReusableView.identifier, for: indexPath) as! HeaderReusableView
        header.configure(title: sections[indexPath.section])
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 64)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height / 3)
        } else {
            
            let length: CGFloat = collectionView.frame.width / 3
            
            return CGSize(width: length, height: length)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(didSelectItemAt indexPath: IndexPath) -> Any {
        if indexPath.section == 0 {
            return upcomingTournaments[indexPath.item]
        } else {
            return futureTournaments[indexPath.item]
        }
    }
    
    
    // MARK: - Setup Hardcoded Data
    func setupData() {
        let upcomingTournamentHardcoded = UpcomingTournament(id: UUID().uuidString, name: "Warzone Rumble", date: Date(timeIntervalSinceNow: 0), tournamentType: .customLobbyQuads, prize: 300)
        
        upcomingTournaments.append(upcomingTournamentHardcoded)
        
        
        for i in 0...2 {
            let futureTournamentHardcoded = FutureTournament(id: UUID().uuidString, name: "tournament \(i)", date: Date(timeIntervalSinceNow: TimeInterval(i + 3)), tournamentType: .customLobbyDuos, prize: i*100)
            futureTournaments.append(futureTournamentHardcoded)
        }
        
        
        
    }
    
}
