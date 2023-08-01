//
//  JSONDecoder+.swift
//  BoxOffice
//
//  Created by 박종화 on 2023/08/02.
//

import Foundation

extension JSONDecoder {
    func decodeJSON<T: Decodable>(service: APIService, data: Data) -> T? {
        do {
            let decodedData = try self.decode(T.self, from: data)
            return decodedData
        } catch {
            return nil
        }
    }
}
