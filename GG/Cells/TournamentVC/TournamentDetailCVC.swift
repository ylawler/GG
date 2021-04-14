//
//  TournamentDetailCVC.swift
//  GG
//
//  Created by Yannick Lawler on 13.04.21.
//

import UIKit

class TournamentDetailCVC: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static let identifier = "TournamentDetailCVCId"
    
    static func nib() -> UINib {
        return UINib(nibName: "TournamentDetailCVC", bundle: nil)
    }

}
