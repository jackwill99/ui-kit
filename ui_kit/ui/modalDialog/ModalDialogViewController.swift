//
//  ModalDialogViewController.swift
//  ui_kit
//
//  Created by Tensor Lab on 12/18/23.
//

import UIKit

class ModalDialogViewController: UIViewController {
    @IBOutlet var img: UIImageView!
    @IBOutlet var deadlineView: UIView!
    @IBOutlet var containerView: UIView!
    @IBOutlet var btnInvite: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        img.layer.cornerRadius = 10
        btnInvite.layer.cornerRadius = 25
        deadlineView.layer.borderWidth = 1
        deadlineView.layer.borderColor = UIColor.lightGray.cgColor
        deadlineView.layer.cornerRadius = 10

        // top left and top right corner radius
        containerView.layer.cornerRadius = 20
        containerView.layer.masksToBounds = true
        containerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]

        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(onTapToDismiss(_:)))

        view.addGestureRecognizer(tapRecognizer)
    }

    @objc func onTapToDismiss(_ sender: UITapGestureRecognizer) {
        dismiss(animated: true)
    }

    @IBAction func invitePerson(_ sender: UIButton) {
        NotificationCenter.default.post(name: Notification.Name("Invite"), object: "Jack Will")

        dismiss(animated: true)
    }
}
