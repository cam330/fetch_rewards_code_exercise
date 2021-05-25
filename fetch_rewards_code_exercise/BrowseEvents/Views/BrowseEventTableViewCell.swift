//
//  BrowseEventTableViewCell.swift
//  fetch_rewards_code_exercise
//
//  Created by Cameron Wilcox on 5/24/21.
//

import UIKit

class BrowseEventTableViewCell: UITableViewCell {
    
    @IBOutlet weak var displayImage: DisplayImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var likeHeartImg = UIImageView()
    
    var event: Event! {
        didSet {
            titleLabel.text = event.title
            if let displayDate = event.date.formatToDate() {
                dateLabel.text = displayDate
            }
            displayImage.loadImage(from: event.image != nil ? URL(string: event.image!) : nil)
            likeHeartImg.isHidden = !LikedEvents.savedEvents.contains(event.id)
            locationLabel.text = event.location
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        addLikeHeartImage()
    }
    
    func addLikeHeartImage() {
        likeHeartImg = UIImageView(frame: CGRect(x: displayImage.frame.origin.x - 13, y: displayImage.frame.origin.y - 10, width: 36, height: 30))
        if #available(iOS 13.0, *) {
            likeHeartImg.image = UIImage(systemName: "heart.fill")
        } else {
            likeHeartImg.image = UIImage(named: "heart_fill")
        }
        likeHeartImg.contentMode = .scaleAspectFit
        likeHeartImg.tintColor = .systemRed
        addSubview(likeHeartImg)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
