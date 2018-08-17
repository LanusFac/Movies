//
//  Genre.swift
//  Movies
//
//  Created by Facundo Lanùs on 15/8/18.
//  Copyright © 2018 Facundo Lanùs. All rights reserved.
//

import Foundation

class Genre {
    var id: NSNumber
    var name: String
    
    init (dictionary: [String: AnyObject]) {
        self.id = dictionary["id"] as? NSNumber ?? 0
        self.name = dictionary["name"] as? String ?? "No genre information"
    }
}
