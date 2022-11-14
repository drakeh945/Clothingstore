//
//  CollectionViewCell.swift
//  Clothing Store
//
//  Created by Drake Herring on 11/9/22.
//

import UIKit

class DiscoveryCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: DiscoveryCollectionViewCell.self)

    @IBOutlet weak var demoImage: UIImageView!
   
    @IBOutlet weak var globalAccess: UILabel!
    
    
    @IBOutlet weak var shopNow: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
