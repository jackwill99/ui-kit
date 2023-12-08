//
//  codableExt.swift
//  ui_kit
//
//  Created by Tensor Lab on 12/6/23.
//

import Foundation

extension Encodable {
    var toJSONString: String {
        let jsonData = try! JSONEncoder().encode(self)
        return String(data: jsonData, encoding: .utf8)!
    }
}

extension Dictionary {
    var toJSONString: String {
        let theJSONData = try! JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)

        return String(data: theJSONData, encoding: .utf8)!
    }
}

extension Decodable {
    func decodeString<T: Decodable>(from jsonString: String) -> T? {
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
