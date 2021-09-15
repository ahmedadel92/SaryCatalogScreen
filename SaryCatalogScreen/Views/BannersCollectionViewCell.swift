//
//  BannersTableViewCell.swift
//  SaryCatalogScreen
//
//  Created by Ahmed Adel Al-Ahmed on 15/09/2021.
//

import UIKit
import RxSwift
import RxCocoa

protocol BannersCollectionViewCellDelegate where Self: UIViewController {
    func showToast(withText text:String)
}

class BannersCollectionViewCell: UICollectionViewCell, UICollectionViewDelegateFlowLayout {

    let cellId = "bannerCell"
    var delegate: BannersCollectionViewCellDelegate?
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.isPagingEnabled = true
        collectionView.register(BannerViewCell.self, forCellWithReuseIdentifier: cellId)
        return collectionView
    }()
    
    private var viewModel = BannersViewModel()
    private let bag = DisposeBag()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    func setupViews() {
        addSubview(collectionView)
        addConstraints([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        viewModel.banners.bind(to: collectionView.rx.items(cellIdentifier: cellId, cellType: BannerViewCell.self)) { row, model, cell in
            if let url = URL(string: model.image) {
                cell.imageView.load(from: url)
            }
        }.disposed(by: bag)
        
        collectionView.rx.modelSelected(Banner.self).bind { banner in
            self.delegate?.showToast(withText: banner.link)
        }.disposed(by: bag)
        
        collectionView.rx.setDelegate(self).disposed(by: bag)
        
        viewModel.getBanners()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 200)
    }

}
