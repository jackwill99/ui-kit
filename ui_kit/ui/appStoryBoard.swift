//
//  appStoryBoard.swift
//  ui_kit
//
//  Created by Tensor Lab on 12/5/23.
//

import Foundation
import UIKit

enum AppStoryboard: String {
    case Main, Calculator, Ticket

    var instance: UIStoryboard {
        return UIStoryboard(name: rawValue, bundle: Bundle.main)
    }

    func viewController<T: UIViewController>(to viewControllerClass: T.Type) -> T {
//        let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID

        /// Note: You must same the storyboardId and storyboard name
        let storyboardID = rawValue
        return instance.instantiateViewController(withIdentifier: storyboardID) as! T
    }

    func initialViewController() -> UIViewController? {
        return instance.instantiateInitialViewController()
    }
}
