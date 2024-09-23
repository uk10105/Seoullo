//
//  RouteDetailViewModel.swift
//  Seoullo
//
//  Created by 한유진 on 9/22/24.
//

import Foundation
import Combine

class RouteDetailViewModel: ObservableObject {
    @Published var route: [RouteItem] = []
    @Published var contentId: String = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    func getRoute() {
        RouteService.shared.getRoute(contentId: contentId)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { route in
                self.route = route
            }
            .store(in: &cancellables)
    }
    
}

import Alamofire

/*
 https://apis.data.go.kr/B551011/KorService1/detailInfo1?MobileOS=IOS&MobileApp=App&_type=json&contentId=1889328&contentTypeId=25&serviceKey=
 */
class RouteService {
    static let shared = RouteService()
    
    func getRoute(contentId: String) -> AnyPublisher<[RouteItem], AFError> {
        let url = Config.DetailInfoURL // "https://apis.data.go.kr/B551011/KorService1/detailInfo1"
        let parameters: Parameters = [
            "MobileOS": "IOS",
            "MobileApp": "App",
            "_type": "json",
            "contentId": contentId,
            "contentTypeId": "25",
            "serviceKey": Config.apiKey
        ]
        
        return AF.request(url, method: .get, parameters: parameters)
            .publishDecodable(type: RouteRoot.self)
            .value()
            .map { $0.response.body.items.item }
            .eraseToAnyPublisher()
    }
}
