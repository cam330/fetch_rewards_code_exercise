//
//  Event.swift
//  fetch_rewards_code_exercise
//
//  Created by Cameron Wilcox on 5/24/21.
//

import Foundation

struct Events: Decodable {
    let events: [Event]
}

struct Event: Codable {
    let image: String?
    let title: String
    let location: String
    let date: String
    let id: Int
    
    enum RootKeys: String, CodingKey {
        case id
        case date = "datetime_utc"
        case venue
        case title = "short_title"
        case performers
    }
    
    enum VenueKeys: String, CodingKey {
        case location = "display_location"
    }
    
    enum PerformersKeys: String, CodingKey {
        case image
    }
    
    /*
     Use containers and nested containers to extract values from returned JSON
     Return only the first image from the 'performers' array as the display image
     */
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RootKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        date = try container.decode(String.self, forKey: .date)
        title = try container.decode(String.self, forKey: .title)
        
        let venueContainer = try container.nestedContainer(keyedBy: VenueKeys.self, forKey: .venue)
        location = try venueContainer.decode(String.self, forKey: .location)
        
        var imagesUnkeyedContainer = try container.nestedUnkeyedContainer(forKey: .performers)
        var imagesArray = [String]()
        while !imagesUnkeyedContainer.isAtEnd {
            let imageContainer = try imagesUnkeyedContainer.nestedContainer(keyedBy: PerformersKeys.self)
            imagesArray.append(try imageContainer.decode(String.self, forKey: .image))
        }
        
        image = imagesArray.first ?? nil
    }
}
