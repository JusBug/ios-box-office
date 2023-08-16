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
        callAPIManager()
    }
    
    private func configureMovieDetailInfo() {
        guard let movie else {
            return
        }
        
        movieDetailInfo = MovieDetailInfo(movie: movie)
    }
    
    private func configureMovieInfoLabels() {
        guard let movieInfo = movieDetailInfo else {
            return
        }
        
        let detailsInfo = movieInfo.getDetailInfo()
        
        for index in movieInfoLabels.indices {
            movieInfoLabels[index].text = detailsInfo[index]
        }
    }
    
    private func callAPIManager() {
        let apiManager = APIManager()
        
        guard let movieCode else {
            return // 추후 메서드 분리후 에러처리
        }
        
        let urlRequiredQuery = apiManager.configureURLRequiredQuery(api: .movieDetailInfo, item: movieCode)
        let url = apiManager.configureURLSession(service: .movieDetailInfo, requiredQuery: urlRequiredQuery, queryitems: nil)
        
        apiManager.fetchData(url: url) { result in
            let jsonDecoder = JSONDecoder()
            switch result {
            case .success(let data):
                if let decodedData: Movie = jsonDecoder.decodeJSON(data: data) {
                    self.movie = decodedData
                    self.configureMovieDetailInfo()
                    DispatchQueue.main.async {
                        self.configureMovieInfoLabels()
                    }
                } else {
                    print("Decoding Error")
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension MovieDetailViewController: MovieCodeable {
    func configureMovieCode(to movieCode: String) {
        self.movieCode = movieCode
    }
}
