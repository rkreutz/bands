//
//  Band.swift
//  Bands
//
//  Created by Rodrigo Kreutz on 21/12/16.
//  Copyright © 2016 Rodrigo Kreutz. All rights reserved.
//

import Foundation

struct Band {
    let name: String
    let id: String
    let genre: String
    let image: String
    let country: String
    let countryFlag: String
    let website: String
    
    init(dict: [String: String]) {
        if let name = dict["name"] {
            self.name = name
        } else {
            self.name = ""
        }
        
        if let id = dict["id"] {
            self.id = id
        } else {
            self.id = ""
        }
        
        if let genre = dict["genre"] {
            self.genre = genre
        } else {
            self.genre = ""
        }
        
        if let image = dict["image"] {
            self.image = image
        } else {
            self.image = ""
        }
        
        if let country = dict["country"] {
            self.country = country
        } else {
            self.country = ""
        }
        
        if let countryFlag = dict["country_flag"] {
            self.countryFlag = countryFlag
        } else if let countryFlag = dict["countryFlag"] {
            self.countryFlag = countryFlag
        } else {
            self.countryFlag = ""
        }
        
        if let website = dict["website"] {
            self.website = website
        } else {
            self.website = ""
        }
    }
    
    func toDict() -> [String: String] {
        let dict = [
            "name": self.name,
            "id": self.id,
            "genre": self.genre,
            "image": self.image,
            "country": self.country,
            "countryFlag": self.countryFlag,
            "website": self.website
        ]
        
        return dict
    }
}
