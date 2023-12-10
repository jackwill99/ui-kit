//
//  TextFieldDelegateViewController.swift
//  ui_kit
//
//  Created by Tensor Lab on 12/10/23.
//

import UIKit

class TextFieldDelegateViewController: UIViewController {
    @IBOutlet var txtName: UITextField!
    @IBOutlet var txtDesc: UITextView!

    var activeTextField = UITextField()

    override func viewDidLoad() {
        txtDesc.layer.borderWidth = 0.2
        txtDesc.layer.borderColor = txtName.layer.borderColor
        txtDesc.layer.cornerRadius = 5
        super.viewDidLoad()

        // You can delegate in code or by dragging delegate of connection inspector to view controller
        txtName.delegate = self

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    // MARK: - Keyboard Event

    @objc func keyboardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            // calculate the free size of the display
            let freeSize = view.frame.height - keyboardSize.height

            print("view frame \(view.frame.origin.y) height \(view.frame.height)")
            print("keyboard size \(keyboardSize.origin.y) height \(keyboardSize.height)")
            print("active text field \(activeTextField.frame)")
            print("freesiez \(freeSize)")
            print("frame contain \(activeTextField.frame.contains(CGPoint(x: 20.0, y: 120.0)))")

            if !activeTextField.frame.contains(CGPoint(x: 0, y: freeSize)) {
                if view.frame.origin.y == 0 {
                    view.frame.origin.y -= keyboardSize.height / 2
                }
            }
        }
    }

    @objc func keyboardWillHide(notification: Notification) {
        view.frame.origin.y = 0
    }

    @IBAction func nextScreen(_ sender: UIButton) {
        let nextVC = NextScreenViewController.getController(to: .TextField)
        nextVC.modalPresentationStyle = .fullScreen
        nextVC.modalTransitionStyle = .flipHorizontal
        present(nextVC, animated: true)
    }
}

// MARK: - UITextFieldDelegate

extension TextFieldDelegateViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // close the keyboard ui respond
        textField.resignFirstResponder()

        return true
    }

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        activeTextField = textField

        return true
    }
}
