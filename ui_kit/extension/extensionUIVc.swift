//
//  extensionUIVc.swift
//  ui_kit
//
//  Created by Tensor Lab on 12/5/23.
//

import Foundation
import UIKit

extension UIViewController {
    static func getController(to appStoryboard: AppStoryboard) -> Self {
        return appStoryboard.viewController(to: self)
    }
}
