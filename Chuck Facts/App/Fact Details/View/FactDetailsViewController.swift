//
//  FactDetailsViewController.swift
//  Chuck Facts
//
//  Created by Leandro Cissoto Ramos on 12/19/18.
//  Copyright © 2018 Cissoto Ramos Tecnologia da Informacao. All rights reserved.
//

import UIKit

class FactDetailsViewController: UIViewController {
    var viewModel: FactDetailsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = FactDetailsViewModel()
    }
}
