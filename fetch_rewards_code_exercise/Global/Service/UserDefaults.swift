//
//  UserDefaults.swift
//  fetch_rewards_code_exercise
//
//  Created by Cameron Wilcox on 5/24/21.
//

import Foundation

/*
 Get, add, and remove liked event IDs
 */
class LikedEvents {
    
    static var savedEvents : [Int] {
        return  UserDefaults.standard.value(forKey: savedEventKeys.events.rawValue) as? [Int] ?? []
    }
    
    static func toggleEventsDefaults(id eventId: Int) {
        var likedEvents: [Int] = []
        if UserDefaults.standard.object(forKey: savedEventKeys.events.rawValue) != nil {
            likedEvents = UserDefaults.standard.object(forKey: savedEventKeys.events.rawValue) as! [Int]
        }
        if likedEvents.contains(eventId) {
            likedEvents = likedEvents.filter({$0 != eventId})
        } else {
            likedEvents.append(eventId)
        }
        saveEvents(events: likedEvents)
    }
    
    private static func saveEvents(events eventsArray: [Int]) {
        UserDefaults.standard.setValue(eventsArray, forKey: savedEventKeys.events.rawValue)
    }
    
    private enum savedEventKeys: String {
        case events = "likedEvents"
    }
}
