//
//  ViewController.swift
//  BoxOffice
//
//  Created by kjs on 13/01/23.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet weak var CollectionView: UICollectionView!
    var apiManager = APIManager()
    var boxOffice: BoxOffice?
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.CollectionView.dataSource = self
        self.CollectionView.delegate = self
        registerXib()
        callAPIManager(.dailyBoxOffice)
        configureViewTitle()
    }
    
    private func registerXib() {
        let nibName = UINib(nibName: "CustomCell", bundle: nil)
        CollectionView.register(nibName, forCellWithReuseIdentifier: "customCell")
    }
    
    private func updateCollectionView() {
        DispatchQueue.main.async {
            self.CollectionView.reloadData()
        }
    }
    
    private func configureViewTitle() {
        self.navigationItem.title = "the Date"
    }
    
    private func callAPIManager(_ service: APIService) {
        apiManager.fetchData(service) { [weak self] result in
            
            switch (result, service) {
            case (.success(let data), .dailyBoxOffice):
                let decoder = JSONDecoder()
                if let decodedData: BoxOffice = decoder.decodeJSON(data) {
                    self?.boxOffice = decodedData
                    self?.updateCollectionView()
                } else {
                    print("decoding Error for BoxOffice")
                }
            case (.success(let data), .movieDetailInfo):
                let decoder = JSONDecoder()
                if let decodedData: Movie = decoder.decodeJSON(data) {
                    self?.movie = decodedData
                    self?.updateCollectionView()
                } else {
                    print("decoding Error for Movie")
                }
            case (.failure(let error), _) where service == .dailyBoxOffice || service == .movieDetailInfo:
                print("Error: \(error)")
            case (.none, _):
                print("unknown Error")
            case (.some(.failure(_)), _):
                print("unknown Error")
            }
        }
    }
}

extension ViewController: UICollectionViewDataSource {    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return boxOffice?.boxOfficeResult.dailyBoxOfficeList.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as? CustomCell else {
            return UICollectionViewCell()
        }
        
        if let boxOfficeData = boxOffice, indexPath.item < boxOfficeData.boxOfficeResult.dailyBoxOfficeList.count {
            let dailyBoxOffice = boxOfficeData.boxOfficeResult.dailyBoxOfficeList[indexPath.item]
            cell.configureFont()
            cell.configureText(with: dailyBoxOffice)
        }
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "movieDetailView") else { return }
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
}
