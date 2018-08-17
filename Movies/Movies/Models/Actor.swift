//
//  Cast.swift
//  Movies
//
//  Created by Facundo Lanùs on 17/8/18.
//  Copyright © 2018 Facundo Lanùs. All rights reserved.
//

import Foundation

class Actor {
    var castId: NSNumber
    var character: String
    var creditId: String
    var gender: NSNumber
    var id: NSNumber
    var name: String
    var order: NSNumber
    var profilePath: String
    
    public init(dictionary: [String: AnyObject]) {
        self.castId = dictionary["cast_id"] as? NSNumber ?? 0
        self.character = dictionary["character"] as? String ?? "No character info"
        self.creditId = dictionary["credit_id"] as? String ?? "No credit id info"
        self.gender = dictionary["gender"] as? NSNumber ?? 0
        self.id = dictionary["id"] as? NSNumber ?? 0
        self.name = dictionary["name"] as? String ?? "No name info"
        self.order = dictionary["order"] as? NSNumber ?? 0
        self.profilePath = dictionary["profile_path"] as? String ?? "No profile path info"
    }
}
