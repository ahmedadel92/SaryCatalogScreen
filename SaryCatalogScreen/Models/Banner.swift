//
//  Banner.swift
//  SaryCatalogScreen
//
//  Created by Ahmed Adel Al-Ahmed on 14/09/2021.
//

import Foundation

struct Banner {
    let id: Int
    let title: String
    let description: String
    let buttonText: String
    let expiryStatus: Bool
    let createdAt: String
    let startDate: String
    let expiryDate: String
    let image: String
    let priority: Int
    let photo: String
    let link: String
    let level: String
    let isAvailable: Bool
    let branches: [Int]
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case buttonText = "button_text"
        case expiryStatus = "expiry_status"
        case createdAt = "created_at"
        case startDate = "start_date"
        case expiryDate = "expiry_date"
        case image
        case priority
        case photo
        case link
        case level
        case isAvailable = "is_available"
        case branches
    }
}

extension Banner: Decodable {
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        title = try values.decode(String.self, forKey: .title)
        description = try values.decode(String.self, forKey: .description)
        buttonText = try values.decode(String.self, forKey: .buttonText)
        expiryStatus = try values.decode(Bool.self, forKey: .expiryStatus)
        createdAt = try values.decode(String.self, forKey: .createdAt)
        startDate = try values.decode(String.self, forKey: .startDate)
        expiryDate = try values.decode(String.self, forKey: .expiryDate)
        image = try values.decode(String.self, forKey: .image)
        priority = try values.decode(Int.self, forKey: .priority)
        photo = try values.decode(String.self, forKey: .photo)
        link = try values.decode(String.self, forKey: .link)
        level = try values.decode(String.self, forKey: .level)
        isAvailable = try values.decode(Bool.self, forKey: .isAvailable)
        branches = try values.decode([Int].self, forKey: .branches)
        
    }
}
