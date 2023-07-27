//
//  APIManager.swift
//  BoxOffice
//
//  Created by 박종화 on 2023/07/26.
//

import Foundation

struct APIManager {
    let session = URLSession.shared
    let urlString = "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt=202a30725"
    
    func fetchData(completion: @escaping (BoxOffice?) -> ()) {
        guard let correctUrl = URL(string: urlString) else {
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
            
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(BoxOffice.self, from: safeData)
                completion(decodedData)
            } catch {
                print ("Decoding Error")
            }
        }
        
        dataTask.resume()
    }
}
