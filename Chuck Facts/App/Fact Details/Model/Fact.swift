//
//  Fact.swift
//  Chuck Facts
//
//  Created by Leandro Cissoto Ramos on 12/19/18.
//  Copyright © 2018 Cissoto Ramos Tecnologia da Informacao. All rights reserved.
//

import Foundation

struct Fact: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case iconUrl = "icon_url"
        case urlString = "url"
        case text = "value"
    }
    
    private var urlString: String
    
    var id: String
    var iconUrl: String
    var text: String
    var url: URL {
        guard let url = URL(string: urlString) else { return URL(string: API().stringURL)! }
        return url
    }
}
