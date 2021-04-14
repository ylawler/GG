//
//  UpcomingTournamentsCVC.swift
//  GG
//
//  Created by Yannick Lawler on 15.03.21.
//

import UIKit

class UpcomingTournamentsCVC: UICollectionViewCell {
  
    
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var tournamentImage: UIImageView!
    @IBOutlet weak var tournamentTypeLabel: UILabel!
    @IBOutlet weak var tournamentPrizeLabel: UILabel!
    @IBOutlet weak var tournamentDateLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutIfNeeded()
        
        outerView.clipsToBounds = false
        outerView.layer.shadowColor = UIColor.black.cgColor
        outerView.layer.shadowRadius = 3
        outerView.layer.shadowOpacity = 1
        outerView.layer.shadowOffset = .zero
        
        tournamentImage.clipsToBounds = true
        tournamentImage.layer.cornerRadius = 12
        
        
        
    }
    
    func configure(tournament: UpcomingTournament) {
        tournamentImage.image = tournament.image
        tournamentTypeLabel.text = tournament.getTournamentType()
        self.tournamentDateLabel.text = tournament.getDate()
        self.tournamentPrizeLabel.text = tournament.getPrize()
    }
    
    static let identifier = "UpcomingTournamentsCVCId"
    
    static func nib() -> UINib {
        return UINib(nibName: "UpcomingTournamentsCVC", bundle: nil)
    }


}
