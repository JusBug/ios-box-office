//
//  ViewController.swift
//  BoxOffice
//
//  Created by kjs on 13/01/23.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var CollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.CollectionView.dataSource = self
        self.CollectionView.delegate = self
        registerXib()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as? CustomCell else {
            return UICollectionViewCell()
        }
            
        cell.rankLabel.text = "123"
        cell.oldAndNewLabel.text = "New"
        cell.movieName.text = "미션 임파서블"
        cell.auditNumber.text = "12345"
        
        return cell
    }
    
    private func registerXib() {
        let nibName = UINib(nibName: "CustomCell", bundle: nil)
        CollectionView.register(nibName, forCellWithReuseIdentifier: "customCell")
    }
}

