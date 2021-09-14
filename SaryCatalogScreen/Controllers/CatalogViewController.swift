//
//  ViewController.swift
//  SaryCatalogScreen
//
//  Created by Ahmed Adel Al-Ahmed on 14/09/2021.
//

import UIKit
import RxSwift
import RxCocoa

class CatalogViewController: UIViewController {
    
    let cellId = "sectionCell"
    
    private var viewModel = BannersViewModel()
    private let bag = DisposeBag()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.frame = view.bounds
        
        
    }

    func bindTableViewData() {
        //bind items to table
        viewModel.banners.bind(to: tableView.rx.items(cellIdentifier: cellId, cellType: UITableViewCell.self)) { row, model, cell in
            cell.textLabel?.text = model.title
            cell.detailTextLabel?.text = model.description
        }.disposed(by: bag)
        
        //bind model selected hundler
        
        
        //fetch items
        viewModel.getBanners()
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

