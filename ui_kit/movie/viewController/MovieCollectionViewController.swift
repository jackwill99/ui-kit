//
//  MovieCollectionViewController.swift
//  ui_kit
//
//  Created by Tensor Lab on 12/10/23.
//

import UIKit

class MovieCollectionViewController: UIViewController {
    @IBOutlet var cltMovie: UICollectionView!

    var movieList: [Movie]?

    override func viewDidLoad() {
        super.viewDidLoad()

        // load the movie list data
        movieList = movieList.decode(from: movieData.toJSONString)

        cltMovie.delegate = self
        cltMovie.dataSource = self
    }

    var getWidth: CGFloat {
        return (view.frame.size.width - 60) / 2
    }
}

extension MovieCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieList?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath)
            as! MovieCollectionViewCell

        addImgConstraint(collectionCell.img)

        if let movie = movieList?[indexPath.row] {
            collectionCell.config(movieTitle: movie.movieTitle, movieRuntime: movie.movieRuntime, movieImage: movie.movieImage)
        }

        return collectionCell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: getWidth, height: 240)
    }

    private func addImgConstraint(_ img: UIImageView) {
        img.translatesAutoresizingMaskIntoConstraints = false
        img.widthAnchor.constraint(equalToConstant: getWidth).isActive = true
        img.contentMode = .scaleAspectFill
    }
}
