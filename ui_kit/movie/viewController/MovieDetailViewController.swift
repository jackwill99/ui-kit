//
//  MovieDetailViewController.swift
//  ui_kit
//
//  Created by Tensor Lab on 12/11/23.
//

import UIKit

class MovieDetailViewController: UIViewController {
    @IBOutlet var btnCancel: UIButton!
    @IBOutlet var btnHeart: UIButton!

    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblYear: UILabel!
    @IBOutlet var lblActors: UILabel!
    @IBOutlet var lblDirector: UILabel!
    @IBOutlet var lblRuntime: UILabel!

    @IBOutlet var imgView: UIImageView!

    var movie: Movie!

    var coreDataService: CoreDataService!

    private var isFavorite: Bool = false

    var getNsPredicate: NSPredicate {
        return NSPredicate(format: "dbId = %@", String(movie.dbId))
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        lblTitle.text = movie.movieTitle
        lblYear.text = movie.movieYear
        lblActors.text = movie.movieActors
        lblDirector.text = movie.movieDirector
        lblRuntime.text = movie.movieRuntime

        let url = URL(string: movie.movieImage)
        imgView.kf.setImage(with: url)

        let result = coreDataService.read(for: "FavoriteMovie", predicate: getNsPredicate)

        if result?.first != nil {
            isFavorite = true
            btnHeart.setImage(UIImage(systemName: "suit.heart.fill"), for: .normal)
        }
    }

    private func favorite() {
        let result = coreDataService.insert(for: "FavoriteMovie", checkExist: getNsPredicate, operation: { object in

            guard let fav = object as? FavoriteMovie else {
                return
            }

            fav.dbId = movie.dbId
            fav.title = movie.movieTitle
            fav.actors = movie.movieActors
            fav.director = movie.movieDirector
            fav.image = movie.movieImage
            fav.rating = movie.rating
            fav.runtime = movie.movieRuntime
            fav.year = movie.movieYear
        })

        if let result = result, result {
            isFavorite = true

            btnHeart.setImage(UIImage(systemName: "suit.heart.fill"), for: .normal)
        }
    }

    private func unFavorite() {
        let result = coreDataService.delete(for: "FavoriteMovie", predicate: getNsPredicate)
        print("unfavorite status \(String(describing: result))")

        if let result = result, result {
            isFavorite = false

            btnHeart.setImage(UIImage(systemName: "suit.heart"), for: .normal)
        }
    }

    @IBAction func cancelEvent(_ sender: UIButton) {
        dismiss(animated: true)
    }

    @IBAction func favoriteEvent(_ sender: UIButton) {
        let alert = UIAlertController(title: "Take relax with your favorite movie.", message: nil, preferredStyle: .actionSheet)

        if isFavorite {
            alert.addAction(UIAlertAction(title: "Un-Favorite", style: .destructive, handler: { _ in
                self.unFavorite()
            }))
        } else {
            alert.addAction(UIAlertAction(title: "Favorite", style: .default, handler: { _ in
                self.favorite()
            }))
        }

        let cancelBtn = UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
        })
        // Changing the UIAlertAction text color
//        cancelBtn.setValue(UIColor.red, forKey: "titleTextColor")

        alert.addAction(cancelBtn)

        present(alert, animated: true)
    }

    @IBAction func readMal(_ sender: UIButton) {
//        coreDataService.delete(for: "FavoriteMovie", isAll: true)
        let favMovies = coreDataService.read(for: "FavoriteMovie")

        for movie in favMovies ?? [] {
            if let a = movie as? FavoriteMovie {
                print("Result is \(a.title) \(a.dbId)")
            }
        }
    }
}
