//
//  extensionUIVc.swift
//  ui_kit
//
//  Created by Tensor Lab on 12/5/23.
//

import Foundation
import UIKit

extension UIViewController {
//    class var storyboardID: String {
//        return "\(self)"
//    }

    static func viewStoryboard(to appStoryboard: AppStoryboard) -> Self {
        return appStoryboard.viewController(to: self)
    }
}
