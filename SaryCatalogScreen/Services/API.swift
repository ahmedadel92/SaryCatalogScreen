//
//  APIService.swift
//  SaryCatalogScreen
//
//  Created by Ahmed Adel Al-Ahmed on 14/09/2021.
//

import Foundation

class API {
    
    static let shared = API()
    
    let bannersUrl = URL(string: "https://staging.sary.co/api/v2.5.1/baskets/76091/banners/")!
    let catalogUrl = URL(string: "https://staging.sary.co/api/v2.5.1/baskets/76091/catalog/")!
    
    func getBanners(onComplete: (([Banner])->Void)?) {
        
        var request = URLRequest(url: bannersUrl)
        request.httpMethod = "GET"
        request.setValue("android", forHTTPHeaderField: "Device-Type")
        request.setValue("3.1.1.0.0", forHTTPHeaderField: "App-Version")
        request.setValue("ar", forHTTPHeaderField: "Accept-Language")
        request.setValue("token eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6ODg2NiwidXNlcl9waG9uZSI6Ijk2NjU2NDk4OTI1MCJ9.VYE28vtnMRLmwBISgvvnhOmPuGueW49ogOhXm5ZqsGU",
            forHTTPHeaderField: "Authorization")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            guard let data = data else { return }

            do {
                let bannersResponse = try JSONDecoder().decode(BannersResponse.self, from: data)
                onComplete?(bannersResponse.result)
            } catch {
                print("Error: \(error.localizedDescription)")
            }
            
            onComplete?([])
        }
        task.resume()
    }
    
    func getBannersFromLocalJson() -> [Banner] {
        if let path = Bundle.main.path(forResource: "bannersJson", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let bannersResponse = try JSONDecoder().decode(BannersResponse.self, from: data)
                return bannersResponse.result
            } catch {
               // handle error
            print(error)
            }
        }
        
        return []
    }
    
    
    func getCatalog(onComplete: (([CatalogSection])->Void)?) {
        var request = URLRequest(url: catalogUrl)
        request.httpMethod = "GET"
        request.setValue("android", forHTTPHeaderField: "Device-Type")
        request.setValue("3.1.1.0.0", forHTTPHeaderField: "App-Version")
        request.setValue("ar", forHTTPHeaderField: "Accept-Language")
        request.setValue("token eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6ODg2NiwidXNlcl9waG9uZSI6Ijk2NjU2NDk4OTI1MCJ9.VYE28vtnMRLmwBISgvvnhOmPuGueW49ogOhXm5ZqsGU",
            forHTTPHeaderField: "Authorization")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            guard let data = data else { return }

            do {
                let catalogResponse = try JSONDecoder().decode(CatalogResponse.self, from: data)
                onComplete?(catalogResponse.result)
            } catch {
                print("Error: \(error.localizedDescription)")
            }

        }
        task.resume()
    }
}
