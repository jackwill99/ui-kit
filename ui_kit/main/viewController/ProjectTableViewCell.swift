//
//  ProjectTableViewCell.swift
//  ui_kit
//
//  Created by Tensor Lab on 12/5/23.
//

import UIKit

class ProjectTableViewCell: UITableViewCell {
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblDesc: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    public func config(img: String, title: String, desc: String) {
        imgView.image = UIImage(named: img)
        lblTitle.text = title
        lblDesc.text = desc
    }
}
