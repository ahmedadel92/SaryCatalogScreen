//
//  CatalogItem.swift
//  SaryCatalogScreen
//
//  Created by Ahmed Adel Al-Ahmed on 14/09/2021.
//

import Foundation

struct Group {
    let id: Int?
    let name: String?
    let image: String
    let deepLink: String?
    
//    let emptyContentImage: String
//    let emptyContentMessage: String
//    let hasData: Bool
//    let showUnavailableItems: Bool
//    let showInBrochureLink: Bool
    
    enum CodingKeys: String, CodingKey {
        case id = "group_id"
        case name
        case image
        case deepLink = "deep_link"
        
//        case emptyContentImage = "empty_content_image"
//        case emptyContentMessage = "empty_content_message"
//        case hasData = "has_data"
//        case showUnavailableItems = "show_unavailable_items"
//        case showInBrochureLink = "show_in_brochure_link"
    }
}

extension Group: Decodable {
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        image = try values.decode(String.self, forKey: .image)
        deepLink = try values.decodeIfPresent(String.self, forKey: .deepLink)
        
//        emptyContentImage = try values.decode(String.self, forKey: .emptyContentImage)
//        emptyContentMessage = try values.decode(String.self, forKey: .emptyContentMessage)
//        hasData = try values.decode(Bool.self, forKey: .hasData)
//        showUnavailableItems = try values.decode(Bool.self, forKey: .showUnavailableItems)
//        showInBrochureLink = try values.decode(Bool.self, forKey: .showInBrochureLink)
    }
}
