//
//  LogInViewController.swift
//  ui_kit
//
//  Created by Tensor Lab on 11/19/23.
//

import UIKit

class LogInViewController: UIViewController {
    @IBOutlet var btnSignUp: UIButton!

    var makeGradientButton: MakeGradientToButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        makeGradientButton = MakeGradientToButton(uiButton: btnSignUp)

        btnSignUp.layer.cornerRadius = 23

        makeGradientButton.makeGradient(with: [UIColor.systemBlue.cgColor, UIColor.purple.cgColor], radius: 23)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        makeGradientButton.updateLayoutSubview()
    }

    @IBAction func skip() {
        dismiss(animated: true)
    }

    @IBAction func signUP() {
        let signupVC = SignUpViewController.getController(to: .Ticket)

        signupVC.modalTransitionStyle = .coverVertical

        present(signupVC, animated: true)
    }
}
