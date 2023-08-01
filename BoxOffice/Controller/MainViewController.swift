//
//  ViewController.swift
//  BoxOffice
//
//  Created by kjs on 13/01/23.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var boxOfficeInfo: BoxOffice?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateBoxOfficeInfo()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
    }
    
    private func updateBoxOfficeInfo() {
        let group = DispatchGroup()
        
        group.enter()
        
        APIManager<BoxOffice>().fetchData(service: .dailyBoxOffice) { result in
            switch result {
            case .success(let boxOfficeData):
                group.leave()
                
                self.boxOfficeInfo = boxOfficeData
            case .failure(let error):
                group.leave()
                print(error)
            }
        }
        group.wait()
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return boxOfficeInfo?.boxOfficeResult.dailyBoxOfficeList.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        
        guard let boxOfficeList = boxOfficeInfo?.boxOfficeResult.dailyBoxOfficeList else {
            return cell
        }
        
        let movie = boxOfficeList[indexPath.row]
        
        cell.rankNumberLabel.text = movie.rank
        cell.rankInfoLabel.text = movie.rankInten
        cell.movieNameLabel.text = movie.movieName
        cell.CustomerCountLabel.text = "\(movie.audiCnt)/\(movie.audiAcc)"
        
        return cell
    }
    
}
