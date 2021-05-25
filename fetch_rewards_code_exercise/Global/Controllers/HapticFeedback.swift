//
//  HapticFeedback.swift
//  fetch_rewards_code_exercise
//
//  Created by Cameron Wilcox on 5/25/21.
//

import UIKit

/*
 Haptic feedback helps indicate to the user when the like button is toggled
 */
class HapticFeedback {
    static func trigger() {
        let feedbackGenerator = UIImpactFeedbackGenerator(style: .light)
        feedbackGenerator.impactOccurred()
    }
}
