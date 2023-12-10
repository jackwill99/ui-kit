//
//  MovieViewController.swift
//  ui_kit_autolayout
//
//  Created by Tensor Lab on 11/30/23.
//

import UIKit

class MovieViewController: UIViewController {
    @IBOutlet var tblMovie: UITableView!

    var movieList: [Movie]?

    override func viewDidLoad() {
        super.viewDidLoad()

        // load the movie list data
        movieList = movieList.decode(from: movieData.toJSONString)

        tblMovie.delegate = self
        tblMovie.dataSource = self
    }
}

// MARK: - UITableView extension

extension MovieViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "MovieCustomCell", for: indexPath) as! MovieCustomCell

        if let movie = movieList?[indexPath.row] {
            tableCell.config(movieTitle: movie.movieTitle, movieYear: movie.movieYear, movieActors: movie.movieActors, movieDirector: movie.movieDirector, movieRuntime: movie.movieRuntime, movieImage: movie.movieImage)
        }

        return tableCell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 207
    }
}
