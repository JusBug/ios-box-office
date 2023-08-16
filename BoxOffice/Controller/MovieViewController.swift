//
//  MovieViewController.swift
//  BoxOffice
//
//  Created by 박종화 on 2023/08/17.
//

import UIKit

final class MovieViewController: MainViewController {
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var productionYearLabel: UILabel!
    @IBOutlet weak var openDate: UILabel!
    @IBOutlet weak var showTimeLabel: UILabel!
    @IBOutlet weak var watchGradeLabel: UILabel!
    @IBOutlet weak var nationLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var actorLabel: UILabel!
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLabel()
    }
    
    private func configureLabel() {
        let movieInfo = movie?.movieInfoResult.movieInfo
        productionYearLabel.text = movieInfo?.prdtYear
        openDate.text = movieInfo?.openDate
        showTimeLabel.text = movieInfo?.showTime
        watchGradeLabel.text = movieInfo?.audits[0].watchGradeNm
        nationLabel.text = movieInfo?.nations[0].nationNm
        genreLabel.text = movieInfo?.genres[0].genreNm
        actorLabel.text = movieInfo?.actors[0].peopleNm
    }
}
