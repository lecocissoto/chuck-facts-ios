//
//  CategoriesEndpoint.swift
//  Chuck Facts
//
//  Created by Leandro Cissoto Ramos on 12/19/18.
//  Copyright © 2018 Cissoto Ramos Tecnologia da Informacao. All rights reserved.
//

import Foundation

enum CategoriesEndpoints: EndpointSetup {
    case categories
    var path: Path {
        switch self {
        case .categories:
            return (uri: "/jokes/categories", method: .get)
        }
    }
}
