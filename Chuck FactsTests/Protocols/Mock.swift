//
//  Mock.swift
//  Chuck FactsTests
//
//  Created by Leandro Cissoto Ramos on 12/23/18.
//  Copyright © 2018 Cissoto Ramos Tecnologia da Informacao. All rights reserved.
//

import Foundation
@testable import Chuck_Facts

protocol Mock {
    associatedtype CodableObject: Decodable
    static var jsonString: String { get }
    static func toData() -> Data?
    static func getObject() -> CodableObject?
}

extension Mock {
    static func toData() -> Data? {
        return jsonString.data(using: .utf8)
    }
    
    static func getObject() -> CodableObject? {
        return CodableObject.parse(from: toData())
    }
}
