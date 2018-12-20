//
//  RequestStatus.swift
//  Chuck Facts
//
//  Created by LEANDRO CISSOTO RAMOS on 12/19/18.
//  Copyright © 2018 LEANDRO CISSOTO RAMOS. All rights reserved.
//

import Foundation

enum RequestStatus<GenericObject> {
    case success(GenericObject)
    case fail(RequestError)
    case loading
}
