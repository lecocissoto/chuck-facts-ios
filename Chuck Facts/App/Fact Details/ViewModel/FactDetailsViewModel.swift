//
//  FactDetailsViewModel.swift
//  Chuck Facts
//
//  Created by Leandro Cissoto Ramos on 12/19/18.
//  Copyright © 2018 Cissoto Ramos Tecnologia da Informacao. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class FactDetailsViewModel {
    var category: Category = ""
    var factRequest: FactRequestsProvider
    var fact: Variable<Fact?> = Variable(nil)
    var error: Variable<RequestError?> = Variable(nil)
    var isLoading = Variable(false)
    
    init(requestProvider: FactRequestsProvider = FactRequests() ) {
        factRequest = requestProvider
    }
    
    func requestForFact() {
        isLoading.value = true
        factRequest.getFact(in: category) { (result) in
            switch result {
            case .success(let fact):
                guard let fact = fact else { return }
                self.fact.value = fact
            case .error(let error):
                self.error.value = error
            }
            self.isLoading.value = false
        }
    }
}
