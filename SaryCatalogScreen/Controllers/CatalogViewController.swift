//
//  ViewController.swift
//  SaryCatalogScreen
//
//  Created by Ahmed Adel Al-Ahmed on 14/09/2021.
//

import UIKit
import RxSwift
import RxCocoa

class CatalogViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "sectionCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        API.shared.getCatalog()
    }

    func bindTableViewData() {
        //bind items to table
        
        
        //bind model selected hundler
        
        
        //fetch items
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 300)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? OldEmbeddedCollectionViewCell else {
//            return UICollectionViewCell()
//        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.backgroundColor = .green
        return cell
    }
}

//bind items to table
//        viewModel.banners.bind(to: tableView.rx.items(cellIdentifier: "cell", cellType: UITableViewCell.self)) { row, model, cell in
//            cell.textLabel?.text = model.title
//            cell.detailTextLabel?.text = model.description
//        }.disposed(by: bag)
//
//        //bind model selected hundler
//        tableView.rx.modelSelected(Banner.self).bind { banner in
//            print(banner.title)
//        }.disposed(by: bag)
//
//        tableView.rx.itemSelected.subscribe(onNext: { [weak self] indexPath in
//            self?.tableView.deselectRow(at: indexPath, animated: true)
//        }).disposed(by: bag)

