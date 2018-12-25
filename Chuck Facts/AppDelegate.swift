//
//  AppDelegate.swift
//  Chuck Facts
//
//  Created by Leandro Cissoto Ramos on 12/18/18.
//  Copyright © 2018 Cissoto Ramos Tecnologia da Informacao. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        if let splitVC = self.window?.rootViewController as? UISplitViewController {
            splitVC.preferredDisplayMode = .allVisible
            splitVC.delegate = self
            if let navigation = splitVC.viewControllers.last as? UINavigationController {
                navigation.topViewController?.navigationItem.leftBarButtonItem = splitVC.displayModeButtonItem
            }
        }
        
        return true
    }
}

extension AppDelegate: UISplitViewControllerDelegate {
    func splitViewController(_ svc: UISplitViewController,
                             willShow vc: UIViewController,
                             invalidating barButtonItem: UIBarButtonItem) {
        if let detailView = svc.viewControllers.first as? UINavigationController {
            svc.navigationItem.backBarButtonItem = nil
            detailView.topViewController?.navigationItem.leftBarButtonItem = nil
        }
    }
    
    func splitViewController(_ splitViewController: UISplitViewController,
                             collapseSecondary secondaryViewController: UIViewController,
                             onto primaryViewController: UIViewController) -> Bool {
        guard let navigationController = primaryViewController as? UINavigationController,
            let controller = navigationController.topViewController as? CategoriesListViewController
            else {
                return true
        }
        
        return controller.collapseDetailViewController
    }
}
