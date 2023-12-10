//
//  appStoryBoard.swift
//  ui_kit
//
//  Created by Tensor Lab on 12/5/23.
//

import Foundation
import UIKit

enum AppStoryboard: String {
    case Main, Calculator, Ticket, Movie

    var instance: UIStoryboard {
        return UIStoryboard(name: rawValue, bundle: Bundle.main)
    }

    func viewController<T: UIViewController>(to viewControllerClass: T.Type) -> T {
        /// NOTE: Please be careful that you must declare storyboardID of your view controller as the same name of view controller class
        /// Otherwise: It will cause error
        let instanceName = String(describing: viewControllerClass as UIViewController.Type)

        let storyboardID = instanceName
        return instance.instantiateViewController(withIdentifier: storyboardID) as! T
    }
}
