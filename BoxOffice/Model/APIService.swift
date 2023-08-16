//
//  APIService.swift
//  BoxOffice
//
//  Created by redmango, Jusbug on 2023/07/28.
//

import Foundation

/*
 http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt=20120101
 targetDt
 
 http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=f5eef3421c602c6cb7ea224104795888&movieCd=20124079
 
 movieCd
 
 https://dapi.kakao.com/v2/search/image
 
 query
 */
enum APIService {
    case dailyBoxOffice
    case movieDetailInfo
    case movieImage
    
    var urlBase: String {
        switch self {
        case .dailyBoxOffice:
            return "https://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json"
        case .movieDetailInfo:
            return "https://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json"
        case .movieImage:
            return "https://dapi.kakao.com/v2/search/image"
        }
    }
    
//    var urlPath: String {
//        switch self {
//        case .dailyBoxOffice:
//            return "/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json"
//        case .movieDetailInfo:
//            return "/kobisopenapi/webservice/rest/movie/searchMovieInfo.json"
//        case .movieImage:
//            return "/v2/search/image"
//        }
//    }
    
    var urlKey: String {
        switch self {
        case .dailyBoxOffice, .movieDetailInfo:
            return Bundle.main.movieApiKey
        case .movieImage:
            return Bundle.main.imageApiKey
        }
    }
}

