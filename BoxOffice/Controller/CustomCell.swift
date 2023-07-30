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
    func configureFont() {
        rankLabel.font = UIFont.systemFont(ofSize: 30)
        oldAndNewLabel.font = UIFont.systemFont(ofSize: 10)
        auditNumberLabel.font = UIFont.systemFont(ofSize: 15)
    }
    
    func configureText(with dailyBoxOffice: dailyBoxOffice) {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        guard let audiCnt = Int(dailyBoxOffice.audiCnt),
              let formattedAudiCnt = numberFormatter.string(from: NSNumber(value: audiCnt)) else { return }
        
        guard let audiAcc = Int(dailyBoxOffice.audiAcc),
              let formattedAudiAcc = numberFormatter.string(from: NSNumber(value: audiAcc)) else { return }
        
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
        
        movieNameLabel.text = dailyBoxOffice.movieName
        auditNumberLabel.text = "오늘 \(formattedAudiCnt) / 총 \(formattedAudiAcc)"
    }
}
