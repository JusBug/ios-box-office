//
//  Service.swift
//  BoxOffice
//
//  Created by redmango, Jusbug on 2023/07/28.
//

import Foundation

enum APIService {
    case dailyBoxOffice
    case movieDetailInfo
    
    func configureURL() -> URL? {
        let dateFormatter = DateFormatter()
        var components = URLComponents()
        let targetDate = URLQueryItem(name: "targetDt", value: "20230731")

        dateFormatter.dateFormat = "yyyy-mm-dd"
        components.scheme = "https"
        components.host = "www.kobis.or.kr"
        components.path = "/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json"
        components.queryItems = [targetDate]
        
        let url = components.url
        
        return url
    }
    
    var url: String {
        switch self {
        case .dailyBoxOffice:
            return "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt=20230801"
        case .movieDetailInfo:
            return "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=9edeb739e275f3013ffb896c2ff41cfe&targetDt=20230724"
        }
    }
    
    var type: Any {
        switch self {
        case .dailyBoxOffice:
            return BoxOffice.self
        case .movieDetailInfo:
            return Movie.self
        }
    }
}
