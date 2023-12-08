//
//  MakeGradientToButton.swift
//  ui_kit
//
//  Created by Tensor Lab on 11/19/23.
//

import Foundation
import UIKit

class MakeGradientToButton {
    private let uiButton: UIButton

    init(uiButton: UIButton) {
        self.uiButton = uiButton
    }

    /// After adding new gradient layer to your button, update added layer frame
    func updateLayoutSubview() {
        // Update gradient layer frame based on the button's width
        guard let btnContinueGradientLayer = uiButton.layer.sublayers?.first else {
            return
        }
        btnContinueGradientLayer.frame = uiButton.bounds
    }

    /// Change your button to gradient by adding new gradient sub layers to this
    func makeGradient(with colors: [CGColor], radius: CGFloat = 15.0) {
        // Create Gradient Color
        let gradientLayer = CAGradientLayer()
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.cornerRadius = radius
        gradientLayer.colors = colors
        uiButton.layer.cornerRadius = radius

        // Add gradient layer to the button's layer
        uiButton.layer.insertSublayer(gradientLayer, at: 0)
    }
}
