//
//  APIManager.swift
//  BoxOffice
//
//  Created by redmango, Jusbug on 2023/07/26.
//

import Foundation

struct APIManager<T: Decodable> {
    func fetchData(service: APIService, completion: @escaping (Result<T, Error>) -> Void) {
        let session = URLSession.shared
        let jsonDecoder = JSONDecoder()
        
        guard let url = URL(string: service.url) else {
            print("Wrong URL")
            completion(.failure(APIError.wrongURL))
            return
        }
        
        let dataTask = session.dataTask(with: url) { data, response, error in
            guard error == nil else {
                print("error: \(String(describing: error))")
                return
            }
            
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
            
            guard let decodedData = try? jsonDecoder.decodeJSON(data: safeData,
                                                                modelType: T.self)
            else {
                return
            }
            
            completion(.success(decodedData))
        }
        
        dataTask.resume()
    }
}
