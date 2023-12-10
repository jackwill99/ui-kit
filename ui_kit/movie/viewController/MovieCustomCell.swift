//
//  MovieCustomCell.swift
//  ui_kit_autolayout
//
//  Created by Tensor Lab on 11/30/23.
//

import UIKit

class MovieCustomCell: UITableViewCell {
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblDuration: UILabel!
    @IBOutlet var lblActor: UILabel!
    @IBOutlet var lblDirector: UILabel!
    @IBOutlet var lblRating: UILabel!
    @IBOutlet var img: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    public func config(movieTitle: String, movieYear: String, movieActors: String, movieDirector: String, movieRuntime: String, movieImage: String) {
        lblTitle.text = movieTitle
        lblDuration.text = movieYear
        lblActor.text = movieActors
        lblDirector.text = movieDirector
        lblRating.text = movieRuntime

        let url = URL(string: movieImage)

        // MARK: - Download the content of the data

//        if let imgUrl = url {
//            do {
//                let data = try Data(contentsOf: imgUrl)
//                img.image = UIImage(data: data)
//            } catch {
//                img.image = UIImage(named: "008")
//            }
//
//            img.contentMode = .scaleAspectFill
//            img.layer.cornerRadius = 10
//        }

        // MARK: - URLSession with complection handler

//        if let imgUrl = url {
//            getData(from: imgUrl) { data, _, _ in
//                if let imgData = data {
//                    DispatchQueue.main.async {
//                        self.img.image = UIImage(data: imgData)
//                    }
//                }
//            }
//        }

        // MARK: - Background thread

        DispatchQueue.global().async {
            if let imgUrl = url {
                do {
                    let data = try Data(contentsOf: imgUrl)

                    // Put it on main thread
                    DispatchQueue.main.async {
                        self.img.image = UIImage(data: data)
                    }
                } catch {
                    DispatchQueue.main.async {
                        self.img.image = UIImage(named: "008")
                    }
                }

                DispatchQueue.main.async {
                    self.img.contentMode = .scaleAspectFill
                    self.img.layer.cornerRadius = 10
                }
            }
        }
    }

    private func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}
