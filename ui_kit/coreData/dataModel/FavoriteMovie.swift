//
//  FavoriteMovie.swift
//  ui_kit
//
//  Created by Tensor Lab on 12/10/23.
//
//

import Foundation
import SwiftData

@Model public class FavoriteMovie: Codable {
    var dbId: Int32?
    var image: String?
    var title: String?
    var year: String?
    var actors: String?
    var director: String?
    var runtime: String?
    var rating: Float? = 0.0

    public init() {}
}
