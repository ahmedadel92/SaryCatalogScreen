//
//  BannerViewModel.swift
//  SaryCatalogScreen
//
//  Created by Ahmed Adel Al-Ahmed on 14/09/2021.
//

import Foundation
import RxSwift

struct BannersViewModel {
    
    var banners = PublishSubject<[Banner]>()
    
    func getBanners() {
        let banners = API.shared.getBanners()
        
        self.banners.onNext(banners)
        self.banners.onCompleted()
    }
}
