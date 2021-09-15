//
//  CatalogViewModel.swift
//  SaryCatalogScreen
//
//  Created by Ahmed Adel Al-Ahmed on 15/09/2021.
//

import Foundation
import RxSwift
import RxCocoa

struct CatalogViewModel {
    
    //let banners = PublishSubject<[Banner]>()
    let sections = PublishSubject<[CatalogSection]>()
    
    func getData() {
//        API.shared.getBanners { banners in
//            self.banners.onNext(banners)
//            self.banners.onCompleted()
//        }
        
        API.shared.getCatalog { sections in
            self.sections.onNext(sections)
            self.sections.onCompleted()
        }
    }
}
