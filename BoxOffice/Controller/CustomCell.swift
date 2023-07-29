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
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var auditNumberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureLabel(with dailyBoxOffice: dailyBoxOffice) {
        rankLabel.text = dailyBoxOffice.rank
        oldAndNewLabel.text = dailyBoxOffice.rankOldAndNew
        movieNameLabel.text = dailyBoxOffice.movieName
        auditNumberLabel.text = dailyBoxOffice.audiAcc
    }
}
