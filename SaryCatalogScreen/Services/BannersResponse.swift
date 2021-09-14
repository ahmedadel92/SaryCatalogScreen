//
//  BannersResponse.swift
//  SaryCatalogScreen
//
//  Created by Ahmed Adel Al-Ahmed on 14/09/2021.
//

import Foundation

struct BannersResponse {
    let result: [Banner]
    
    enum CodingKeys: String, CodingKey {
        case result
    }
}

extension BannersResponse: Decodable {
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        result = try values.decode([Banner].self, forKey: .result)
        
    }
}
