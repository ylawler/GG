//
//  StickyHeaderReusableView.swift
//  GG
//
//  Created by Yannick Lawler on 13.04.21.
//

import UIKit

class StickyHeaderReusableView: UICollectionReusableView {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static let identifier = "StickyHeaderReusableViewId"
    
    static func nib() -> UINib {
        return UINib(nibName: "StickyHeaderReusableView", bundle: nil)
    }
    
}
