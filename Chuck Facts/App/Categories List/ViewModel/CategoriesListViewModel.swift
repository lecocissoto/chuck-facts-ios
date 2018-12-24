//
//  CategoriesListViewModel.swift
//  Chuck Facts
//
//  Created by Leandro Cissoto Ramos on 12/19/18.
//  Copyright © 2018 Cissoto Ramos Tecnologia da Informacao. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class CategoriesListViewModel {
    
    enum Destinations: String {
        case factSegue
    }
    
    var categoriesRequest: CategoriesRequestsProvider
    var categories = Variable([Category]())
    var error: Variable<RequestError?> = Variable(nil)
    var isLoading = Variable(false)
    var destination: Destinations?
    var selectedCategory = ""
    
    init(requestProvider: CategoriesRequestsProvider = CategoriesRequests() ) {
        categoriesRequest = requestProvider
    }
    
    func requestForCategories() {
        isLoading.value = true
        categoriesRequest.getCategories { (result) in
            switch result {
            case .success(let categories):
                guard let categories = categories else { return }
                self.categories.value = categories
            case .error(let error):
                self.error.value = error
            }
            self.isLoading.value = false
        }
    }
    
    func navigate(to destination: Destinations) {
        self.destination = destination
    }
}
