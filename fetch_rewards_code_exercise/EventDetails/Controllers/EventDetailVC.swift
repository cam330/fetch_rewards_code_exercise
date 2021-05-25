//
//  EventDetailVC.swift
//  fetch_rewards_code_exercise
//
//  Created by Cameron Wilcox on 5/24/21.
//

import UIKit

class EventDetailVC: UIViewController {
    
    @IBOutlet weak var eventImage: DisplayImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var likeButton: LikeBarButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    var event: Event!

    override func viewDidLoad() {
        super.viewDidLoad()

        eventImage.imageURLString = event.image
        titleLabel.text = event.title
        likeButton.isLiked = LikedEvents.savedEvents.contains(event.id)
        if let displayDate = event.date.formatToDate() {
            dateLabel.text = displayDate
        }
        locationLabel.text = event.location
    }

    @IBAction func closeButtonAction() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func likeButtonToggle() {
        likeButton.toggleButtonAction(for: event.id)
        updateCellLikeStatus()
    }
    
    /*
    Updates the like status of the tableView cell behind EventDetailVC
     */
    func updateCellLikeStatus() {
        if let vc = presentingViewController as? BrowseEventsVC {
            DispatchQueue.main.async {
                vc.tableView.reloadData()
            }
        }
    }
}
