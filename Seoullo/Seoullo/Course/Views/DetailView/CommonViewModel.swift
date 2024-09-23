//
//  CommonViewModel.swift
//  Seoullo
//
//  Created by 이유경 on 9/24/24.
//

import Foundation
import Alamofire

class CultureViewModel: ObservableObject {
    @Published var culture: [CommonItem] = []
    @Published var cafe: [CommonItem] = []
    @Published var food: [CommonItem] = []
    @Published var shopping: [CommonItem] = []
    @Published var trip: [CommonItem] = []
    
    func getCommon(contentType: Int) {
        let endPoint = Config.areaBasedListURL
        let params: Parameters = ["serviceKey": Config.apiKey, "MobileApp": "App", "MobileOS": "IOS", "contentTypeId": contentType, "areaCode": 1, "_type": "json"]
        
        let alamo = AF.request(endPoint, method: .get, parameters: params)
        alamo.responseDecodable(of: CommonRoot.self) { [weak self] response in
            print(response)
            switch response.result {
            case .success(let result):
                DispatchQueue.main.async {
                    switch contentType {
                    case 14: // 문화시설
                        self?.culture = result.response.body.items.item
                    case 39: // 음식점
                        self?.food = result.response.body.items.item
                    case 38: // 쇼핑
                        self?.shopping = result.response.body.items.item
                    case 12: // 관광지
                        self?.trip = result.response.body.items.item
                    default:
                        break
                    }
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
