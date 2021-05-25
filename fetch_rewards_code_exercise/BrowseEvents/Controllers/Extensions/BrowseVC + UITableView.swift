//
//  BrowseVC + UITableView.swift
//  fetch_rewards_code_exercise
//
//  Created by Cameron Wilcox on 5/24/21.
//

import UIKit
extension BrowseEventsVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as! BrowseEventTableViewCell
        
        let event = eventsArray[indexPath.row]
        cell.event = event
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let event = eventsArray[indexPath.row]
        selectedEvent = event
        performSegue(withIdentifier: "ShowEventDetail", sender: self)
    }
}
