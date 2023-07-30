//
//  Service.swift
//  BoxOffice
//
//  Created by redmango, Jusbug on 2023/07/28.
//

enum Service: String {
    case dailyBoxOffice = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=9edeb739e275f3013ffb896c2ff41cfe&targetDt=202a30725"
    case movieDetailInfo = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=9edeb739e275f3013ffb896c2ff41cfe&targetDt=20230724"
    
    var type: Any {
        switch self {
        case .dailyBoxOffice:
            return BoxOffice.self
        case .movieDetailInfo:
            return Movie.self
        }
    }
}
