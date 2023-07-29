//
//  CustomCell.swift
//  BoxOffice
//
//  Created by 박종화 on 2023/07/30.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var oldAndNewLabel: UILabel!
    
    @IBOutlet weak var movieName: UILabel!
    
    @IBOutlet weak var auditNumber: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
