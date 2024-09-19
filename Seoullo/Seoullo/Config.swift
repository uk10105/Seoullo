//
//  Config.swift
//  Seoullo
//
//  Created by 이유경 on 9/19/24.
//

import Foundation

struct Config {
    static var apiKey: String {
        guard let url = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String else {
            fatalError("API_KEY not set in plist for this environment")
        }
        return url
    }
    
    static var areaBasedListURL: String {
        guard let url = Bundle.main.object(forInfoDictionaryKey: "AREA_BASED_LIST_URL") as? String else {
            fatalError("AREA_BASED_LIST_URL not set in plist for this environment")
        }
        return url
    }
    
    static var detailCommonURL: String {
        guard let url = Bundle.main.object(forInfoDictionaryKey: "DETAIL_COMMON_URL") as? String else {
            fatalError("DETAIL_COMMON_URL not set in plist for this environment")
        }
        return url
    }
    
    static var detailIntroURL: String {
        guard let url = Bundle.main.object(forInfoDictionaryKey: "DETAIL_INTRO_URL") as? String else {
            fatalError("DETAIL_INTRO_URL not set in plist for this environment")
        }
        return url
    }
    
    static var DetailInfoURL: String {
        guard let url = Bundle.main.object(forInfoDictionaryKey: "DETAIL_INFO_URL") as? String else {
            fatalError("DETAIL_INFO_URL not set in plist for this environment")
        }
        return url
    }
}
