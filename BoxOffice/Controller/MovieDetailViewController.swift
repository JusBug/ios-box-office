//
//  MovieInfoViewController.swift
//  BoxOffice
//
//  Created by redmango, Jusbug on 2023/08/16.
//

import UIKit

/*
 movieNm
 directors[]
 prdtYear
 openDate
 showTime
 Audits[] - watchGradeNm
 nations[]
 genres[] - genreNm
 actors[] - peopleNm
 */

final class MovieDetailViewController: UIViewController {

    @IBOutlet weak var moviePosterImageView: UIImageView!
    @IBOutlet var movieInfoLabels: [UILabel]!
    
    var movie: Movie?
    var movieCode: String?
    var movieDetailInfo: MovieDetailInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func configureMovieDetailInfo() {
      //  movieDetailInfo = MovieDetailInfo(movie: movie)
    }
    
    private func callAPIManager() {
//        APIManager().fetchData(service: ) { result in
//            let jsonDecoder = JSONDecoder()
//            switch result {
//            case .success(let data):
//                if let decodedData: Movie = jsonDecoder.decodeJSON(data: data) {
//                    self.movie = decodedData
//                } else {
//                    print("Decoding Error")
//                }
//            case .failure(let error):
//                print(error)
//            }
//        }
    }
}

extension MovieDetailViewController: MovieCodeable {
    func configureMovieCode(to movieCode: String) {
        self.movieCode = movieCode
    }
}
