//
//  Service.swift
//  BoxOffice
//
//  Created by redmango, Jusbug on 2023/07/28.
//

enum APIService: String {
    case dailyBoxOffice
    case movieDetailInfo
    
    var url: String {
        switch self {
        case .dailyBoxOffice:
            return "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt=202a30725"
        case .movieDetailInfo:
            return "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=9edeb739e275f3013ffb896c2ff41cfe&targetDt=20230724"
        }
    }
}