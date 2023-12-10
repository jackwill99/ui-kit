//
//  NextScreenViewController.swift
//  ui_kit
//
//  Created by Tensor Lab on 12/10/23.
//

import UIKit

class NextScreenViewController: UIViewController {
    @IBOutlet var lblText: UILabel!

    var text: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        lblText.text = text
    }

    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
