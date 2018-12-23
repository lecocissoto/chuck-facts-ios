//
//  CategoriesMock.swift
//  Chuck FactsTests
//
//  Created by Leandro Cissoto Ramos on 12/23/18.
//  Copyright © 2018 Cissoto Ramos Tecnologia da Informacao. All rights reserved.
//

import UIKit
import Chuck_Facts

struct CategoriesMock: Mock {
    typealias CodableObject = [String]
    
    static var jsonString: String {
                    return """
                                [
                                    "explicit",
                                    "dev",
                                    "movie",
                                    "food",
                                    "celebrity",
                                    "science",
                                    "sport",
                                    "political",
                                    "religion",
                                    "animal",
                                    "history",
                                    "music",
                                    "travel",
                                    "career",
                                    "money",
                                    "fashion"
                                ]
                             """
    }
}
