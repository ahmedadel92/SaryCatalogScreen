//
//  BannerViewModel.swift
//  SaryCatalogScreen
//
//  Created by Ahmed Adel Al-Ahmed on 14/09/2021.
//

import Foundation
import RxSwift

struct BannersViewModel {
    
    let banners = PublishSubject<[Banner]>()
    
    func getBanners() {
        API.shared.getBanners { banners in
            self.banners.onNext(banners)
            self.banners.onCompleted()
        }
    }
}
