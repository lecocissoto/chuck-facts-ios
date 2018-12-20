//
//  ViewController.swift
//  Chuck Facts
//
//  Created by Leandro Cissoto Ramos on 12/18/18.
//  Copyright © 2018 Cissoto Ramos Tecnologia da Informacao. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let factRequest = FactDetailsRequests()
        factRequest.getFact(in: "explicit") { (requestResult) in
            switch requestResult {
            case .success(let object):
                guard let object = object else { return }
                debugPrint(object.text)
            default:
                debugPrint("Error")
            }
        }
    }
}
