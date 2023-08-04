//
//  CollectionViewCell.swift
//  BoxOffice
//
//  Created by redmango1446 on 2023/08/02.
//

import UIKit

@available(iOS 14.0, *)
class CollectionViewListCell: UICollectionViewListCell {
    
    @IBOutlet weak var rankNumberLabel: UILabel!
    @IBOutlet weak var rankInfoLabel: UILabel!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var audiNumberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureFont() {
        rankNumberLabel.font = UIFont.systemFont(ofSize: 30)
        rankInfoLabel.font = UIFont.systemFont(ofSize: 15)
        audiNumberLabel.font = UIFont.systemFont(ofSize: 15)
    }
    
    func configureLabels(with dailyBoxOffice: DailyBoxOffice) {
        configureAudiNumberLabel(with: dailyBoxOffice)
        configureRankInfoLabel(with: dailyBoxOffice)
        rankNumberLabel.text = dailyBoxOffice.rank
        movieNameLabel.text = dailyBoxOffice.movieName
    }
    
    func configureAudiNumberLabel(with dailyBoxOffice: DailyBoxOffice) {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        guard let audiCnt = Int(dailyBoxOffice.audiCnt),
              let formattedAudiCnt = numberFormatter.string(from: NSNumber(value: audiCnt)) else { return }
        
        guard let audiAcc = Int(dailyBoxOffice.audiAcc),
              let formattedAudiAcc = numberFormatter.string(from: NSNumber(value: audiAcc)) else { return }
        
        audiNumberLabel.text = "오늘 \(formattedAudiCnt) / 총 \(formattedAudiAcc)"
    }
    
    func configureRankInfoLabel(with dailyBoxOffice: DailyBoxOffice) {
        if dailyBoxOffice.rankOldAndNew == "NEW" {
            rankInfoLabel.textColor = .red
            rankInfoLabel.text = "신작"
        } else if dailyBoxOffice.rankInten == "0" {
            rankInfoLabel.text = "-"
        } else if dailyBoxOffice.rankOldAndNew == "OLD",
                let rankInten = Int(dailyBoxOffice.rankInten),
                let arrow = Arrow(rawValue: rankInten > 0 ? "▲" : "▼") {
            rankInfoLabel.textColor = .black
            let rankIntenString = "\(arrow.rawValue)\(abs(rankInten))"
            let attributedString = NSMutableAttributedString(string: rankIntenString)
            let range = (rankIntenString as NSString).range(of: arrow.rawValue)
            attributedString.addAttribute(.foregroundColor, value: arrow.color, range: range)
            rankInfoLabel.attributedText = attributedString
        }
    }
}

@available(iOS 14.0, *)
extension CollectionViewListCell {
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