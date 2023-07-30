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
        } else if let rankInten = Int(dailyBoxOffice.rankInten) {
            if let arrow = Arrow(rawValue: rankInten > 0 ? "▲" : "▼") {
                let rankIntenString = "\(arrow.rawValue)\(abs(rankInten))"
                let attributedString = NSMutableAttributedString(string: rankIntenString)
                let range = (rankIntenString as NSString).range(of: arrow.rawValue)
                attributedString.addAttribute(.foregroundColor, value: arrow.color, range: range)
                oldAndNewLabel.attributedText = attributedString
            }
        }
        
        movieNameLabel.text = dailyBoxOffice.movieName
        auditNumberLabel.text = "오늘 \(formattedAudiCnt) / 총 \(formattedAudiAcc)"
    }
}


extension CustomCell {
    enum Arrow: String {
        case upArrow = "▲"
        case downArrow = "▼"
        
        var color: UIColor {
            switch self {
            case .upArrow:
                return .red
            case .downArrow:
                return .blue
            }
        }
    }
}
