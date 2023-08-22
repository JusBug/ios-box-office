//
//  MovieDetailInfo.swift
//  BoxOffice
//
//  Created by 박종화 on 2023/08/22.
//

import Foundation

struct MovieDetailInfo {
    private let director: String
    private let prdtYear: String
    private let openDate: String
    private let showTime: String
    private let watchGradeName: String
    private let nation: String
    private let genreName: String
    private let actor: String
    
    init(movie: Movie) {
        let movieInfo = movie.movieInfoResult.movieInfo
        let directors = movieInfo.directors.map { $0.peopleNm }
        let audits = movieInfo.audits.map { $0.watchGradeNm }
        let nations = movieInfo.nations.map { $0.nationNm }
        let genres = movieInfo.genres.map { $0.genreNm }
        let actors = movieInfo.actors.map { $0.peopleNm }
        
        director = directors.joined(separator: ", ")
        prdtYear = movieInfo.prdtYear
        openDate = movieInfo.openDate
        showTime = movieInfo.showTime
        watchGradeName = audits.joined(separator: ", ")
        nation = nations.joined(separator: ", ")
        genreName = genres.joined(separator: ", ")
        actor = actors.joined(separator: ", ")
    }
    
    func getDetailInfo() -> [String] {
        return [director, prdtYear, openDate,showTime,
                watchGradeName, nation, genreName, actor]
    }
}
