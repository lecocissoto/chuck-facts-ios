//
//  RequestSetup.swift
//  Chuck Facts
//
//  Created by LEANDRO CISSOTO RAMOS on 12/19/18.
//  Copyright © 2018 LEANDRO CISSOTO RAMOS. All rights reserved.
//

import Foundation

protocol RequestSetup {
    func request(service: EndpointSetup, completion: @escaping (Data?, RequestError?) -> Void)
}
