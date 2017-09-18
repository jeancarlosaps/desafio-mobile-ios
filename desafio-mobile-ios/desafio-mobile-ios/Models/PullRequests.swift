//
//  PullRequests.swift
//  desafio-mobile-ios
//
//  Created by Jean Carlos on 8/29/17.
//  Copyright © 2017 Jean Carlos. All rights reserved.
//

import Foundation
import ObjectMapper

class PullRequests: Mappable{
    var title: String?
    var body: String?
    var url: String?
    var user: RepositorieOwner?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        body <- map["body"]
        url <- map["html_url"]
        user <- map["user"]
    }
}
