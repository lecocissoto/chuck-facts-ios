//
//  NetworkDataProvider.swift
//  Chuck Facts
//
//  Created by LEANDRO CISSOTO RAMOS on 12/19/18.
//  Copyright © 2018 LEANDRO CISSOTO RAMOS. All rights reserved.
//

import Foundation

protocol NetworkingDataSetup {
    var service: RequestSetup { get set }
    init(service: RequestSetup)
}
