//
//  Extensions.swift
//  SaryCatalogScreen
//
//  Created by Ahmed Adel Al-Ahmed on 15/09/2021.
//

import UIKit

extension UIImageView {
    func load(from url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let data = data {
                    self.image = UIImage(data: data)
                }
            }
        }.resume()
    }
}
