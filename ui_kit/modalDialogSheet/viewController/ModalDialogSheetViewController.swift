//
//  ModalDialogSheetViewController.swift
//  ui_kit
//
//  Created by Tensor Lab on 12/18/23.
//

import UIKit

class ModalDialogSheetViewController: UIViewController {
    @IBOutlet var snackBarView: SnackBarView!
    @IBOutlet var lblPerson: UILabel!

    var originalFrame: CGRect!

    var newModifiedFrame: CGRect!

    var isShowSnackBar = false

    override func viewDidLoad() {
        super.viewDidLoad()

        originalFrame = CGRect(x: 0, y: view.frame.height, width: view.frame.width, height: 60)

        newModifiedFrame = CGRect(x: 0, y: view.frame.height - 150, width: view.frame.width, height: 60)

        view.addSubview(snackBarView)
        snackBarView.lblText.text = "Warning of the snack bar"
        snackBarView.alpha = 0
        snackBarView.frame = originalFrame

        snackBarView.delegate = self
    }

    // MARK: - Custom View

    @IBAction func clickedCustomView(_ sender: UIButton) {
//        centerCustomView()
        bottomToTopCustomView()
    }

    private func bottomToTopCustomView() {
        if !isShowSnackBar {
            snackBarView.frame = originalFrame
            UIView.animate(withDuration: 0.6, animations: {
                self.snackBarView.frame = self.newModifiedFrame
                self.snackBarView.alpha = 1
            })

            isShowSnackBar = !isShowSnackBar
        }
    }

    private func centerCustomView() {
        let newFrame = CGRect(x: 0, y: 0, width: view.frame.width, height: 60)

        snackBarView.frame = newFrame
        snackBarView.center = view.center

        showHideCustomView()
    }

    private func showHideCustomView() {
        if isShowSnackBar {
            UIView.animate(withDuration: 0.6, animations: {
                self.snackBarView.alpha = 0
                self.snackBarView.isHidden = true
            })
        } else {
            UIView.animate(withDuration: 0.6, animations: {
                self.snackBarView.alpha = 1
                self.snackBarView.isHidden = false
            })
        }

        isShowSnackBar = !isShowSnackBar
    }

    // MARK: - Modal Dialog

    @IBAction func openDialog(_ sender: UIButton) {
        let dialogVC = ModalDialogViewController.getController(to: .ModalDialog)
        dialogVC.modalPresentationStyle = .overFullScreen

        // Listen event from notification center
        NotificationCenter.default.addObserver(self, selector: #selector(invite(_:)), name: Notification.Name("Invite"), object: nil)

        present(dialogVC, animated: true)
    }

    @objc func invite(_ notification: Notification?) {
        if notification != nil {
            lblPerson.text = "We've invited \(notification!.object as? String ?? "") as a member of Swift Developer 😎"
        }
    }
}

// MARK: - SnackBar Extension

extension ModalDialogSheetViewController: SnackBarViewDelegate {
    func closeBar() {
        snackBarView.frame = newModifiedFrame
        snackBarView.alpha = 1
        UIView.animate(withDuration: 0.6, animations: {
            self.snackBarView.frame = self.originalFrame
            self.snackBarView.alpha = 0
        })
        isShowSnackBar = !isShowSnackBar
    }
}
