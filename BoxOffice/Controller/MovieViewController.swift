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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
