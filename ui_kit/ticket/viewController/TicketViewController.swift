//
//  TicketViewController.swift
//  ui_kit
//
//  Created by Tensor Lab on 11/19/23.
//

import UIKit

class TicketViewController: UIViewController {
    var makeGradientButton: MakeGradientToButton!

    @IBOutlet var btnLogin: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        makeGradientButton = MakeGradientToButton(uiButton: btnLogin)

        makeGradientButton.makeGradient(with: [UIColor.purple.cgColor, UIColor.blue.cgColor], radius: 20)
    }

    override func viewDidLayoutSubviews() {
        makeGradientButton.updateLayoutSubview()
    }

    @IBAction func login() {
        let loginVC = LogInViewController.getController(to: .Ticket)
        loginVC.modalTransitionStyle = .coverVertical

        present(loginVC, animated: true)
    }
}
