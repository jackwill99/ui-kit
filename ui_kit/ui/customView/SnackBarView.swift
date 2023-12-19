//
//  SnackBarViewController.swift
//  ui_kit
//
//  Created by Tensor Lab on 12/18/23.
//

import UIKit

/// Protocol Delegation
/// Ref: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/protocols/#Delegation
///
protocol SnackBarViewDelegate: AnyObject {
    func closeBar() -> ()
}

class SnackBarView: UIView {
    @IBOutlet var img: UIImageView!
    @IBOutlet var lblText: UILabel!

    weak var delegate: SnackBarViewDelegate?

    // initWithFrame to init view from code
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
    }

    // initWithCode to init view from xib or storyboard
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
    }

    // common func to init our view
    private func loadView() {
        let viewFromXib = Bundle.main.loadNibNamed("SnackBarView", owner: self, options: nil)![0] as! UIView
        viewFromXib.frame = bounds
        addSubview(viewFromXib)
    }

    @IBAction func closeBar(_ sender: UIButton) {
        delegate?.closeBar()
    }
}
