//
//  ViewController+Utils.swift
//  Chuck Facts
//
//  Created by Leandro Cissoto Ramos on 12/23/18.
//  Copyright © 2018 Cissoto Ramos Tecnologia da Informacao. All rights reserved.
//

import UIKit

extension UIViewController {
    func displaySpinner() {
        let spinnerView = UIView(frame: self.view.bounds)
        spinnerView.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        spinnerView.tag = 14
        
        let indicator = UIActivityIndicatorView(style: .whiteLarge)
        indicator.startAnimating()
        indicator.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(indicator)
            self.view.addSubview(spinnerView)
        }
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            let spinner = self.view.viewWithTag(14)
            spinner?.removeFromSuperview()
        }
    }
}
