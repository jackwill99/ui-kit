//
//  MovieCollectionViewCell.swift
//  ui_kit
//
//  Created by Tensor Lab on 12/10/23.
//

import Kingfisher
import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblRating: UILabel!
    @IBOutlet var img: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func config(movieTitle: String, movieRuntime: String, movieImage: String) {
        lblTitle.text = movieTitle
        lblRating.text = movieRuntime

        let url = URL(string: movieImage)

        img.kf.setImage(with: url)
    }
}
