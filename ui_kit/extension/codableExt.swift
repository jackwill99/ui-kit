//
//  codableExt.swift
//  ui_kit
//
//  Created by Tensor Lab on 12/6/23.
//

import Foundation

extension Collection where Iterator.Element == [String: Any] {
    var toJSONString: String {
        if self is [[String: Any]] {
            let theJSONData = try! JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)

            return String(data: theJSONData, encoding: .utf8)!
        }
        return "[]"
    }
}

extension Encodable {
    var toJSONString: String {
        let theJSONData = try! JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)

        return String(data: theJSONData, encoding: .utf8)!
    }
}

extension Decodable {
    func decode<T: Decodable>(from jsonString: String) -> T? {
        // Convert the string to data
        let data = Data(jsonString.utf8)

        // Create a JSONDecoder instance
        let jsonDecoder = JSONDecoder()

        // set the keyDecodingStrategy to convertFromSnakeCase on the jsonDecoder instance
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase

        // Custom date formatter
        let dateFomatter = DateFormatter()
        dateFomatter.dateFormat = "dd/MM/yyyy"

        // set the dateDecodingStrategy to convert date format on the jsonDecoder instance
        jsonDecoder.dateDecodingStrategy = .formatted(dateFomatter)

        return try? jsonDecoder.decode(T.self, from: data)
    }
}
