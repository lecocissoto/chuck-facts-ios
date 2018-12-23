//
//  FactMock.swift
//  Chuck FactsTests
//
//  Created by Leandro Cissoto Ramos on 12/23/18.
//  Copyright © 2018 Cissoto Ramos Tecnologia da Informacao. All rights reserved.
//

import Foundation
@testable import Chuck_Facts

struct FactMock: Mock {
    typealias CodableObject = Fact

    static var jsonString: String {
        return """
        {
        "icon_url": "https://assets.chucknorris.host/img/avatar/chuck-norris.png",
        "id": "BNmS7OjESjmoEYZnjPAwfQ",
        "url": "https://api.chucknorris.io/jokes/BNmS7OjESjmoEYZnjPAwfQ",
        "value": "As the old saying goes, You can't make an omelette without Chuck Norris cracking a few human skulls."
        }
        """
    }
}
