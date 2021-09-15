//
//  ViewController.swift
//  SaryCatalogScreen
//
//  Created by Ahmed Adel Al-Ahmed on 14/09/2021.
//

import UIKit
import RxSwift
import RxCocoa

class CatalogViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let bannersCellId = "bannersCell"
    let smartCellId = "smartCellId"
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(BannersCollectionViewCell.self, forCellWithReuseIdentifier: bannersCellId)
        collectionView.register(SmartOptionsCollectionViewCell.self, forCellWithReuseIdentifier: "smartCellId")
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let sectionHeight: CGFloat = indexPath.item == 0 ? 200 : 100
        
        return CGSize(width: UIScreen.main.bounds.width, height: sectionHeight)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0, let cell = collectionView.dequeueReusableCell(withReuseIdentifier: bannersCellId, for: indexPath) as? BannersCollectionViewCell {
            return cell
        } else if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: smartCellId, for: indexPath) as? SmartOptionsCollectionViewCell {
            return cell
        }
        
        return UICollectionViewCell()
    }
}

