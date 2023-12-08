//
//  SignUpViewController.swift
//  ui_kit
//
//  Created by Tensor Lab on 11/18/23.
//

import UIKit

class SignUpViewController: UIViewController {
    var eyeFillStatus: Bool = true

    @IBOutlet var lblSignUp: UILabel!
    @IBOutlet var lblSignUpText: UILabel!
    @IBOutlet var lblRule1: UILabel!
    @IBOutlet var lblRule2: UILabel!
    @IBOutlet var lblRule3: UILabel!

    @IBOutlet var btnContinue: UIButton!
    @IBOutlet var btnEye: UIButton!

    @IBOutlet var txtPassword: UITextField!
    @IBOutlet var txtEmail: UITextField!

    var makeGradientButton: MakeGradientToButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        makeGradientButton = MakeGradientToButton(uiButton: btnContinue)

        txtEmail.keyboardType = .emailAddress

        lblSignUp.textAlignment = .center
        lblSignUpText.textAlignment = .center

        lblRule1.text = "✓   \(lblRule1.text ?? "")"
        lblRule2.text = "✓   \(lblRule2.text ?? "")"
        lblRule3.text = "✓   \(lblRule3.text ?? "")"

        makeGradientButton.makeGradient(with: [UIColor.purple.cgColor, UIColor.blue.cgColor], radius: 20)
    }

    override func viewDidLayoutSubviews() {
        makeGradientButton.updateLayoutSubview()
    }

    // MARK: - eye-fill on / off

    @IBAction func eyeFillOnOff() {
        switch eyeFillStatus {
        case true:
            btnEye.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
            eyeFillStatus = false
            txtPassword.isSecureTextEntry = true
        default:
            btnEye.setImage(UIImage(systemName: "eye.fill"), for: .normal)
            eyeFillStatus = true
            txtPassword.isSecureTextEntry = false
        }
    }
}
