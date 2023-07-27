//
//  APIManager.swift
//  BoxOffice
//
//  Created by 박종화 on 2023/07/26.
//

import Foundation

struct APIManager {
    let session = URLSession.shared
    
    let urlStringForBoxOffice = "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt=202a30725"
    let urlStringForMovie = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=9edeb739e275f3013ffb896c2ff41cfe&targetDt=20230724"
    
    
    func fetchData(_ url: String, completion: @escaping (Data?) -> ()) {
        guard let correctUrl = URL(string: url) else {
            print("Wrong URL")
            return
        }
        
        let request = URLRequest(url: correctUrl)
        
        let dataTask = session.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print("error: \(String(describing: error))")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Response Error")
                return
            }
            
            guard (200..<300).contains(httpResponse.statusCode) else {
                print("Server Error: \(httpResponse.statusCode)")
                return
            }
            
            guard let safeData = data else {
                print("None of Data")
                return
            }

            completion(safeData)
        }
        
        dataTask.resume()
    }
    
    func decodeJSON<T: Decodable>(data: Data) -> T? {
        do {
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(T.self, from: data)
            return decodedData
        } catch {
            print ("Decoding Error")
            return nil
        }
    }
}
