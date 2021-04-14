//
//  TournamentCVC.swift
//  GG
//
//  Created by Yannick Lawler on 09.04.21.
//

import UIKit

class TournamentCVC: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var GGBackground: UIView!
    @IBOutlet weak var GGImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        GGBackground.layer.cornerRadius = 12
        GGBackground.backgroundColor = GGMainColor
        
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutIfNeeded()
        
        GGBackground.clipsToBounds = false
        GGBackground.layer.shadowColor = UIColor.black.cgColor
        GGBackground.layer.shadowRadius = 3
        GGBackground.layer.shadowOpacity = 1
        GGBackground.layer.shadowOffset = .zero
        
        GGImageView.clipsToBounds = true
        GGImageView.layer.cornerRadius = 12
        GGImageView.backgroundColor = GGMainColor
        
        
        
    }
    
    static let identifier = "TournamentCVC"
    
    static func nib() -> UINib {
        return UINib(nibName: "TournamentCVC", bundle: nil)
    }

}
