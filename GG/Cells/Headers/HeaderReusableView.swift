//
//  HeaderReusableView.swift
//  GG
//
//  Created by Yannick Lawler on 15.03.21.
//

import UIKit

class HeaderReusableView: UICollectionReusableView {
    
    @IBOutlet weak var headerTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(title: String) {
        self.headerTitle.text = title
    }
    
    static let identifier = "HeaderReusableViewId"
    
    static func nib() -> UINib {
        return UINib(nibName: "HeaderReusableView", bundle: nil)
    }
    
}
