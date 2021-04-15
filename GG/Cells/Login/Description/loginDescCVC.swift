//
//  loginDescCVC.swift
//  GG
//
//  Created by Yannick Lawler on 14.04.21.
//

import UIKit

class loginDescCVC: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        bottomLabel.isHidden = true
        topLabel.isHidden = true
    }
    
    func configure(text: String, top: Bool = false, bottom: Bool = false, image: UIImage) {
        if top {
            topLabel.text = text
            topLabel.isHidden = false
            bottomLabel.isHidden = true
        } else if bottom {
            bottomLabel.text = text
            bottomLabel.isHidden = false
            topLabel.isHidden = true
        }
        
        imageView.image = image
    }
    
    static let identifier = "loginDescCVCId"
    
    static func nib() -> UINib {
        return UINib(nibName: "loginDescCVC", bundle: nil)
    }

}
