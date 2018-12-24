//
//  FactAlert.swift
//  Chuck Facts
//
//  Created by Leandro Cissoto Ramos on 12/23/18.
//  Copyright © 2018 Cissoto Ramos Tecnologia da Informacao. All rights reserved.
//

import UIKit

struct FactAlert {
    var alertController: UIAlertController!
    
    init(title: String, message: String, style: UIAlertController.Style = .alert) {
        alertController = UIAlertController(title: title, message: message, preferredStyle: style)
    }
    
    func addAction(title: String, style: UIAlertAction.Style = .cancel, action: (() -> Void)?) -> FactAlert {
        let action = UIAlertAction(title: title, style: style, handler: { (_) in
            action?()
        })
        
        alertController.addAction(action)
        
        return self
    }
    
    func show(in viewController: UIViewController?) {
        viewController?.present(alertController, animated: true, completion: nil)
    }
}
