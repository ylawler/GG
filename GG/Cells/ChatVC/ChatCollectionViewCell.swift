//
//  ChatCollectionViewCell.swift
//  GG
//
//  Created by Yannick Lawler on 14.03.21.
//

import UIKit

class ChatCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutIfNeeded()
        self.profileImage.layer.cornerRadius = self.profileImage.frame.height / 2
        self.profileImage.clipsToBounds = true
        self.profileImage.backgroundColor = .lightGray
    }
    
    func configure(chat: chatDescription) {
        self.profileImage.image = chat.user.profileImage
//        self.profileImage.layer.cornerRadius = 12
        
        self.titleLabel.text = chat.user.name
        self.detailLabel.text = chat.user.id
    }
    
    static let identifier = "ChatCollectionViewCellId"
    
    static func nib() -> UINib {
        return UINib(nibName: "ChatCollectionViewCell", bundle: nil)
    }

}
