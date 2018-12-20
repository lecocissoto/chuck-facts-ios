//
//  ModalCodable.swift
//  Chuck Facts
//
//  Created by LEANDRO CISSOTO RAMOS on 21/11/18.
//  Copyright © 2018 LEANDRO CISSOTO RAMOS. All rights reserved.
//

import Foundation

extension Decodable {
    static func parse(from data: Data?) -> Self? {
        guard let data = data else { return nil }
        do {
            let decoder = JSONDecoder()
            let object = try decoder.decode(Self.self, from: data)
            return object
        } catch let error {
            debugPrint("\n❓JSONDecoder -> \(Self.self): \(error)\n")
            return nil
        }
    }
}
