//
//  SpeciesModel.swift
//  GET Films
//
//  Created by Safa Falaqi on 24/12/2021.
//

import Foundation

class SpeciesModel{
    
    static func getSpecies(url: String, completionHandler:@escaping  (_ data: Data? , _ response:URLResponse?, _ error:Error?) -> Void){
        let url = URL(string: url)
        let session = URLSession.shared
        let task = session.dataTask(with: url!, completionHandler:completionHandler)
        task.resume()
    }
}


// MARK: - Species
struct Species: Codable {
    let name, classification, designation, averageHeight: String
    let skinColors, hairColors, eyeColors, averageLifespan: String
    let homeworld: String?
    let language: String
    let people, films: [String]
    let created, edited: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case name, classification, designation
        case averageHeight = "average_height"
        case skinColors = "skin_colors"
        case hairColors = "hair_colors"
        case eyeColors = "eye_colors"
        case averageLifespan = "average_lifespan"
        case homeworld, language, people, films, created, edited, url
    }
}
