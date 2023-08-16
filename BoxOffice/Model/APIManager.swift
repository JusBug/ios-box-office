//
//  APIManager.swift
//  BoxOffice
//
//  Created by redmango, Jusbug on 2023/07/26.
//

import Foundation

struct APIManager {
    func configureURLRequiredQuery(api: APIService, item: String) -> [URLQueryItem] {
        var urlRequiredQuery: [URLQueryItem] {
            switch api {
            case .dailyBoxOffice:
                return [URLQueryItem(name: "key", value: api.urlKey),
                        URLQueryItem(name: "targetDt", value: item)]
            case .movieDetailInfo:
                return [URLQueryItem(name: "key", value: api.urlKey),
                        URLQueryItem(name: "movieCd", value: item)]
            case .movieImage:
                return [URLQueryItem(name: "key", value: api.urlKey),
                        URLQueryItem(name: "query", value: item)]
            }
        }
        
        return urlRequiredQuery
    }
    
    func configureURLSession(service: APIService,
                             requiredQuery: [URLQueryItem],
                             queryitems: [URLQueryItem]?) -> URL? {
        var urlComponents = URLComponents(string: service.urlBase)
        
        urlComponents?.queryItems = requiredQuery
        
        if let queryitems = queryitems {
            queryitems.forEach {
                urlComponents?.queryItems?.append($0)
            }
        }
        
        return urlComponents?.url
    }
    
    func configureURLquery(items: Dictionary<String, String>) -> [URLQueryItem] {
        var queryItem = items.map {
            URLQueryItem(name: $0.key, value: $0.value)
        }
        
        return queryItem
    }
    
    func fetchData(url: URL?, completion: @escaping (Result<Data, Error>) -> Void) {
        let session = URLSession.shared
        
        guard let url = url else {
            print("Wrong URL")
            completion(.failure(APIError.wrongURL))
            return
        }
        
        let dataTask = session.dataTask(with: url) { data, response, error in
            guard error == nil else {
                print("error: \(String(describing: error))")
                return
            }
            
            if let error = error {
                completion(.failure(error))
            } else {
                guard let httpResponse = response as? HTTPURLResponse else {
                    print("Response Error")
                    completion(.failure(APIError.responseError))
                    return
                }
                
                guard (200..<300).contains(httpResponse.statusCode) else {
                    print("Server Error: \(httpResponse.statusCode)")
                    completion(.failure(APIError.serverError))
                    return
                }
                
                guard let safeData = data else {
                    print("No Data")
                    completion(.failure(APIError.noData))
                    return
                }
                
                completion(.success(safeData))
            }
        }
        
        dataTask.resume()
    }
}
