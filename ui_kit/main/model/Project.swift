//
//  Project.swift
//  ui_kit
//
//  Created by Tensor Lab on 12/5/23.
//

import Foundation

struct Project: Codable {
    var title: String
    var description: String
    var img: String

    enum CodingKeys: String, CodingKey {
        case title
        case img
        case description = "desc"
    }
}
