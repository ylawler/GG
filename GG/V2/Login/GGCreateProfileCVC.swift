//
//  GGCreateProfileCVC.swift
//  GG
//
//  Created by Yannick Lawler on 18.04.21.
//

import UIKit

class GGCreateProfileCVC: UICollectionViewCell {

    @IBOutlet weak var GGBackground: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        GGBackground.layer.cornerRadius = 12
        GGBackground.backgroundColor = GGColours.shared.GGDark
    }
    
    static let identifier = "GGCreateProfileCVCId"
    
    static func nib() -> UINib {
        return UINib(nibName: "GGCreateProfileCVC", bundle: nil)
    }

}
