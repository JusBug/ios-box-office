//
//  ViewController.swift
//  BoxOffice
//
//  Created by kjs on 13/01/23.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var CollectionView: UICollectionView!
    var apiManager = APIManager()
    var boxOffice: BoxOffice?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.CollectionView.dataSource = self
        self.CollectionView.delegate = self
        registerXib()
        callAPIManager()
    }
    
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
    
    private func registerXib() {
        let nibName = UINib(nibName: "CustomCell", bundle: nil)
        CollectionView.register(nibName, forCellWithReuseIdentifier: "customCell")
    }
    
    private func updateCollectionView() {
        DispatchQueue.main.async {
            self.CollectionView.reloadData()
        }
    }
    
    func callAPIManager() {
        apiManager.fetchData(service: .dailyBoxOffice) { [weak self] data in
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let boxOfficeData = try decoder.decode(BoxOffice.self, from: data)
                    self?.boxOffice = boxOfficeData
                    self?.updateCollectionView()
                } catch {
                    print("디코딩 오류: \(error)")
                }
            }
        }
    }
}


