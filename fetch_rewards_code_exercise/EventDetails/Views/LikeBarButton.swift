//
//  LikeBarButton.swift
//  fetch_rewards_code_exercise
//
//  Created by Cameron Wilcox on 5/24/21.
//

import UIKit

class LikeBarButton: UIBarButtonItem {
    
    var isLiked: Bool! = false {
        didSet {
            toggleButtonState()
        }
    }
    
    func toggleButtonAction(for eventId: Int) {
        HapticFeedback.trigger()
        isLiked = !isLiked
        toggleButtonState()
        LikedEvents.toggleEventsDefaults(id: eventId)
    }
    
    private func toggleButtonState() {
        if #available(iOS 13.0, *) {
            self.tintColor = isLiked ? .systemRed : .label
            self.image = UIImage(systemName: isLiked ? "heart.fill" : "heart")
        } else {
            self.tintColor = isLiked ? .red : .black
            //Known issue, heart image too large when displayed on device lower than iOS 13
            self.image = UIImage(named: isLiked ? "heart_fill" : "heart_empty")
        }
    }
    
}
