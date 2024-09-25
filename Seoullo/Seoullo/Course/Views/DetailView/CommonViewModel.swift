//
//  CommonViewModel.swift
//  Seoullo
//
//  Created by 이유경 on 9/24/24.
//

import Foundation
import Alamofire

class CommonViewModel: ObservableObject {
    @Published var culture: [CommonItem] = []
    @Published var cafe: [CommonItem] = []
    @Published var food: [CommonItem] = []
    @Published var shopping: [CommonItem] = []
    @Published var trip: [CommonItem] = []
    @Published var contentType: Category?
    
    private var itemsByCategory: [Category: [CommonItem]] {
        [
            .culture: culture,
            .food: food,
            .shopping: shopping,
            .trip: trip
        ]
    }
    
    var currentItems: [CommonItem] {
        guard let contentType = contentType else { return [] }
        return itemsByCategory[contentType] ?? []
    }
    
    
    func getCommon(contentType: Category, completion: @escaping ()  ->  ()) {
        let endPoint = Config.areaBasedListURL
        let params: Parameters = ["serviceKey": Config.apiKey, "MobileApp": "App", "MobileOS": "IOS", "contentTypeId": contentType.rawValue, "areaCode": 1, "numOfRows": 500 , "_type": "json"]
        print("URL: \(Config.areaBasedListURL)") // Config 설정 수정하기
        
        let alamo = AF.request(endPoint, method: .get, parameters: params)
        
        alamo.responseDecodable(of: CommonRoot.self) { [weak self] response in
            switch response.result {
            case .success(let result):
                DispatchQueue.main.async {
                    switch contentType {
                    case .culture:
                        self?.culture = result.response.body.items.item
                    case .food:
                        self?.food = result.response.body.items.item
                    case .shopping:
                        self?.shopping = result.response.body.items.item
                    case .trip:
                        self?.trip = result.response.body.items.item
                    default:
                        break
                    }
                    completion()
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
