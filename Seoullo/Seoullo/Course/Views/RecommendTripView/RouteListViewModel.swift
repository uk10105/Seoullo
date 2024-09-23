//
//  RouteListViewModel.swift
//  Seoullo
//
//  Created by 한유진 on 9/23/24.
//

import Foundation
import Combine

class RouteListViewModel: ObservableObject {
    @Published var routeSummaries: [RouteSummary] = []
    @Published var code: String = "" // C0112, C0113, ...
    
    private var cancellables = Set<AnyCancellable>()
    
    func getRouteSummaries() {
        RouteListService.shared.getRouteSummaries(code: code)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { routeSummaries in
                self.routeSummaries = routeSummaries
            }
            .store(in: &cancellables)
        
    }
    
}

import Alamofire

/*
 https://apis.data.go.kr/B551011/KorService1/areaBasedList1?MobileOS=IOS&MobileApp=App&_type=json&contentTypeId=25&areaCode=1&cat1=C01&cat2=C0112&serviceKey=
 */
class RouteListService {
    static let shared = RouteListService()
    
    func getRouteSummaries(code: String) -> AnyPublisher<[RouteSummary], AFError> {
        let url = Config.areaBasedListURL // "https://apis.data.go.kr/B551011/KorService1/areaBasedList1"
        let parameters: Parameters = [
            "MobileOS": "IOS",
            "MobileApp": "App",
            "_type": "json",
            "contentTypeId": "25",
            "cat1": "C01",
            "cat2": code,
            "serviceKey": Config.apiKey
        ]
        
        return AF.request(url, method: .get, parameters: parameters)
            .publishDecodable(type: RouteSummaryRoot.self)
            .value()
            .map { $0.response.body.items.item }
            .eraseToAnyPublisher()
    }
}
