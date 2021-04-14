//
//  FutureTournamentsCVC.swift
//  GG
//
//  Created by Yannick Lawler on 15.03.21.
//

import UIKit

class FutureTournamentsCVC: UICollectionViewCell {
    
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var tournamentImage: UIImageView!
    @IBOutlet weak var tournamentTypeLabel: UILabel!
    @IBOutlet weak var tournamentPrizeLabel: UILabel!
    @IBOutlet weak var tournamentDateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.tournamentImage.layer.cornerRadius = 12
        
        outerView.clipsToBounds = false
        outerView.layer.shadowColor = UIColor.black.cgColor
        outerView.layer.shadowRadius = 3
        outerView.layer.shadowOpacity = 1
        outerView.layer.shadowOffset = .zero
        
        
        tournamentImage.clipsToBounds = true
        tournamentImage.layer.cornerRadius = 12
    }
    
    func configure(tournament: FutureTournament) {
        self.tournamentImage.image = tournament.image
        self.tournamentTypeLabel.text = tournament.getTournamentType()
        self.tournamentDateLabel.text = tournament.getDate()
        self.tournamentPrizeLabel.text = tournament.getPrize()
    }
    
    static let identifier = "FutureTournamentsCVCId"
    
    static func nib() -> UINib {
        return UINib(nibName: "FutureTournamentsCVC", bundle: nil)
    }


}
