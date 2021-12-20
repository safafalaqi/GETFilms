//
//  FilmsModel.swift
//  GET Films
//
//  Created by Safa Falaqi on 21/12/2021.
//

import Foundation

// MARK: - Welcome
struct Films: Codable {
    let count: Int
    let next, previous: JSONNull?
    let results: [FilmsResult]
}

// MARK: - Result
struct FilmsResult: Codable {
    let title: String
    let episodeID: Int
    let openingCrawl, director, producer, releaseDate: String
    let characters, planets, starships, vehicles: [String]
    let species: [String]
    let created, edited: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case title
        case episodeID = "episode_id"
        case openingCrawl = "opening_crawl"
        case director, producer
        case releaseDate = "release_date"
        case characters, planets, starships, vehicles, species, created, edited, url
    }
}
