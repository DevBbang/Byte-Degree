//
//  StockRankViewController.swift
//  StockRank
//
//  Created by TAEJANIM on 2022/06/27.
//

import UIKit

class StockRankViewController: UIViewController {

    let stockList: [StockModel] = StockModel.list
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // Data, Presentation, Layout
    // Data - 어떤 데이터? -> stockList
    // Presentation - 셀을 어떻게 표현?
    // Layout - 셀을 어떻게 배치?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // dataSource - Data, Presentation
        // delegate - Layout
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
}

extension StockRankViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stockList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // collectionView에서 재사용 가능한 cell을 가져올건데 그 cell의 구분자가 필요함(withReuseIdentifier)
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StockRankCollectionViewCell", for: indexPath) as? StockRankCollectionViewCell else {
            return UICollectionViewCell()
        }
        let stock = stockList[indexPath.item]
        cell.configure(stock)
        return cell
    }
}

extension StockRankViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // width == collectionView
        // 80
        return CGSize(width: collectionView.bounds.width, height: 80)
    }
}
