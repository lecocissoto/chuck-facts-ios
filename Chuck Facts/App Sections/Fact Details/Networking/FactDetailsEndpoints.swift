//
//  FactDetailEndpoints.swift
//  Chuck Facts
//
//  Created by Leandro Cissoto Ramos on 12/19/18.
//  Copyright © 2018 Cissoto Ramos Tecnologia da Informacao. All rights reserved.
//

import Foundation

enum FactDetailsEndpoints: EndpointSetup {
    case getFact(_ category: Category)
    var path: Path {
        switch self {
        case .getFact(let category):
            return (uri: "/jokes/random?category:\(category)", method: .get)
        }
    }
}
