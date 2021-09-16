//
//  ViewController.swift
//  SaryCatalogScreen
//
//  Created by Ahmed Adel Al-Ahmed on 14/09/2021.
//

import UIKit
import RxSwift
import RxCocoa

class CatalogViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, BannersCollectionViewCellDelegate {
    
    let bannersCellId = "bannersCell"
    let catalogItemCellId = "catalogItemCellId"
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
//    let catalogViewModel = CatalogViewModel()
//    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(BannersCollectionViewCell.self, forCellWithReuseIdentifier: bannersCellId)
//        collectionView.register(CatalogItemViewCell.self, forCellWithReuseIdentifier: catalogItemCellId)
        
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
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: bannersCellId, for: indexPath) as? BannersCollectionViewCell {
            cell.delegate = self
            return cell
        }

        return UICollectionViewCell()
    }
    
    func showToast(withText text: String) {
        let toastLabel = UILabel(frame: CGRect(x: 16, y: view.frame.size.height/2, width: view.frame.size.width - 32, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = UIFont.systemFont(ofSize: 12)
        toastLabel.textAlignment = .center;
        toastLabel.text = text
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 1.0, delay: 0.5, options: .curveEaseOut, animations: {
             toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}

