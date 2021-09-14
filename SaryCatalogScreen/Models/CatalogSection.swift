//
//  CatalogSection.swift
//  SaryCatalogScreen
//
//  Created by Ahmed Adel Al-Ahmed on 15/09/2021.
//

import Foundation

struct CatalogSection {
    let id: Int
    let title: String
    let data: [Group]
    let dataType: String
    let showTitle: Bool
    let uiType: String
    let rowCount: Int
    let showMoreEnabled: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case data
        case dataType = "data_type"
        case showTitle = "show_title"
        case uiType = "ui_type"
        case rowCount = "row_count"
        case showMoreEnabled = "show_more_enabled"
    }
}

extension CatalogSection: Decodable {
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        title = try values.decode(String.self, forKey: .title)
        data = try values.decode([Group].self, forKey: .data)
        dataType = try values.decode(String.self, forKey: .dataType)
        showTitle = try values.decode(Bool.self, forKey: .showTitle)
        uiType = try values.decode(String.self, forKey: .uiType)
        rowCount = try values.decode(Int.self, forKey: .rowCount)
        showMoreEnabled = try values.decode(Bool.self, forKey: .showMoreEnabled)
    }
}
