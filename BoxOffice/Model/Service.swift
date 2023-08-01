//
//  Service.swift
//  BoxOffice
//
//  Created by redmango, Jusbug on 2023/07/28.
//

import Foundation

enum Service: String {
    
    func configureURL() -> URL? {
        let dateFormatter = DateFormatter()
        var components = URLComponents()

        dateFormatter.dateFormat = "yyyy-mm-dd"
            
        components.scheme = "https"
        components.host = "www.kobis.or.kr"
        components.path = "/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json"
        let targetDate = URLQueryItem(name: "targetDt", value: "20230731")
        components.queryItems = [targetDate]
        
        let url = components.url
        
        return url
    }
    
    case dailyBoxOffice = "https://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=9edeb739e275f3013ffb896c2ff41cfe&targetDt=20230727"
    case movieDetailInfo = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=9edeb739e275f3013ffb896c2ff41cfe&targetDt=20230727"
    
    var type: Any {
        switch self {
        case .dailyBoxOffice:
            return BoxOffice.self
        case .movieDetailInfo:
            return Movie.self
        }
    }
}
