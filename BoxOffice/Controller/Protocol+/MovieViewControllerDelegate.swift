//
//  MovieViewControllerDelegate.swift
//  BoxOffice
//
//  Created by 박종화 on 2023/08/17.
//

import Foundation

protocol MovieViewControllerDelegate: AnyObject {
    func didReceiveData(movie: Movie)
}
