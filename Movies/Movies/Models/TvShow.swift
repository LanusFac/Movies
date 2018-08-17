//
//  TvShow.swift
//  Movies
//
//  Created by Facundo Lanùs on 16/8/18.
//  Copyright © 2018 Facundo Lanùs. All rights reserved.
//

import Foundation

import Foundation

class TVShow {
    var name: String
    var id: NSNumber
    var voteCount: NSNumber
    var voteAvarage: Double
    var popularity: Double
    var posterPath: String
    var originalLenguage: String
    var originalName: String
    var genresIds: [Int]
    var backdropPath: String
    var overview: String
    var firstAirDate: String
    var originCountry: [String]
    
    init (dictionary: [String: AnyObject]) {
        self.name = dictionary["name"] as? String ?? "No name information."
        self.id = dictionary["id"] as? NSNumber ?? -1
        self.voteCount = dictionary["vote_count"] as? NSNumber ?? 0
        self.voteAvarage = dictionary["vote_average"] as? Double ?? -1.0
        self.popularity = dictionary["popularity"] as? Double ?? -1.0
        self.posterPath = dictionary["poster_path"] as? String ?? "No poster path info"
        self.originalName = dictionary["original_name"] as? String ?? "No original title info"
        self.originalLenguage = dictionary["original_language"] as? String ?? "No original languege info"
        self.genresIds = dictionary["genre_ids"] as? [Int] ?? []
        self.backdropPath = dictionary["backdrop_path"] as? String ?? "No backdrop path info"
        self.overview = dictionary["overview"] as? String ?? "No overview"
        self.firstAirDate = dictionary["first_air_date"] as? String ?? "No release date info"
        self.originCountry = dictionary["origin_country"] as? [String] ?? [""]
    }
}
