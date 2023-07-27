//
//  URLSessionProtocol.swift
//  BoxOffice
//
//  Created by 박종화 on 2023/07/28.
//

import Foundation

protocol URLSessionProtocol {
    func dataTask(with url: String, completion: @escaping (Data?, URLResponse?, Error?) -> ()) -> URLSessionDataTask
}
