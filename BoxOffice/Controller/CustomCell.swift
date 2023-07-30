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
        
        if dailyBoxOffice.rankOldAndNew == "NEW" {
            oldAndNewLabel.textColor = .red
            oldAndNewLabel.text = "신작"
        }
        
        if dailyBoxOffice.rankInten == "0" {
            oldAndNewLabel.text = "-"
        } else if Int(dailyBoxOffice.rankInten) ?? 0 > 0 {
            oldAndNewLabel.text = "🔺\(dailyBoxOffice.rankInten)"
        } else {
            oldAndNewLabel.text = "🔻\(dailyBoxOffice.rankInten)"
        }
        
        //oldAndNewLabel.text = dailyBoxOffice.rankOldAndNe
        movieNameLabel.text = dailyBoxOffice.movieName
        auditNumberLabel.text = "오늘 \(dailyBoxOffice.audiCnt) / 총 \(dailyBoxOffice.audiAcc)"
    }
}
