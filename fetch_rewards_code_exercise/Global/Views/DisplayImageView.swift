//
//  DisplayImageView.swift
//  fetch_rewards_code_exercise
//
//  Created by Cameron Wilcox on 5/24/21.
//

import UIKit

class DisplayImageView: UIImageView {
    
    var imageURLString: String! {
        didSet {
            self.loadImage(from: URL(string: imageURLString)!)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    
    func configureView() {
        self.layer.cornerRadius = self.frame.height / 14
        contentMode = .scaleAspectFill
    }
    
}
