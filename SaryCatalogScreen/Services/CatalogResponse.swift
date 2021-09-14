//
//  CatalogResponse.swift
//  SaryCatalogScreen
//
//  Created by Ahmed Adel Al-Ahmed on 15/09/2021.
//

import Foundation

struct CatalogResponse {
    let result: [CatalogSection]
    
    enum CodingKeys: String, CodingKey {
        case result
    }
}

extension CatalogResponse: Decodable {
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        result = try values.decode([CatalogSection].self, forKey: .result)
        
    }
}
