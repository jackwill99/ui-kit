//
//  movie.swift
//  ui_kit_autolayout
//
//  Created by Tensor Lab on 11/30/23.
//

import Foundation

struct Movie: Codable {
    var dbId: Int32
    var movieImage: String
    var movieTitle: String
    var movieYear: String
    var movieActors: String
    var movieDirector: String
    var movieRuntime: String
    var rating: Float

    enum CodingKeys: String, CodingKey {
        case dbId = "id"
        case movieImage = "image"
        case movieTitle = "title"
        case movieYear = "year"
        case movieActors = "actors"
        case movieDirector = "director"
        case movieRuntime = "runtime"
        case rating
    }
}
