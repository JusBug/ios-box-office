//
//  APIError.swift
//  BoxOffice
//
//  Created by 박종화 on 2023/08/02.
//

enum APIError: Error {
    case wrongURL
    case responseError
    case serverError
    case noData
}
