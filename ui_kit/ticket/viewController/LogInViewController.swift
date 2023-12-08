//
//  LogInViewController.swift
//  ui_kit
//
//  Created by Tensor Lab on 11/19/23.
//

import UIKit

class LogInViewController: UIViewController {
    @IBOutlet var btnLogin: UIButton!

    var makeGradientButton: MakeGradientToButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        makeGradientButton = MakeGradientToButton(uiButton: btnLogin)

        btnLogin.layer.cornerRadius = 23

        makeGradientButton.makeGradient(with: [UIColor.white.cgColor, UIColor.systemGray2.withAlphaComponent(0.2).cgColor], radius: 23)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        makeGradientButton.updateLayoutSubview()
    }
}
