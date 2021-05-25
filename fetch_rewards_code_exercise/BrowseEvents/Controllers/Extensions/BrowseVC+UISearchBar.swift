//
//  BrowseVC+UISearchBar.swift
//  fetch_rewards_code_exercise
//
//  Created by Cameron Wilcox on 5/24/21.
//

import UIKit
extension BrowseEventsVC: UISearchBarDelegate {
    
    /*
     Dynamically search events based on user input
     Delay search 0.5 seconds to factor in fast typing speed and reduce the number of network requests
     */
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(searchText(_:)), object: searchBar)
        perform(#selector(searchText(_:)), with: searchBar, afterDelay: 0.5)
        
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    @objc func searchText(_ searchBar: UISearchBar) {
        if let text = searchBar.text {
            searchEvents(withText: text)
        }
    }
}
