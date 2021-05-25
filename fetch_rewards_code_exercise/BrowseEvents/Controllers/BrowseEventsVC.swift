//
//  ViewController.swift
//  fetch_rewards_code_exercise
//
//  Created by Cameron Wilcox on 5/24/21.
//

import UIKit

class BrowseEventsVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    /*
     Trigger tableview reload whenever the events array is updated
     */
    var eventsArray: [Event] = [] {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    var selectedEvent: Event?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         Initial search with no text on app start
         */
        searchEvents(withText: "")
        
    }

    func searchEvents(withText text: String) {
        NetworkRequests.getRequest(withSearch: text) { [weak self] result in
            switch result {
            case .failure(let error):
                AlertView.showAlertView(view: self!, title: "Error", message: error.localizedDescription)
            case .success(let events):
                self?.eventsArray = events.events
            }
        }
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowEventDetail" {
            if let vc = segue.destination as? EventDetailVC {
                if selectedEvent != nil {
                    vc.event = selectedEvent!
                    selectedEvent = nil
                }
            }
        }
    }
}

