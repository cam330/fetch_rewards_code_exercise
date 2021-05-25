//
//  UIImageView+LoadURL.swift
//  fetch_rewards_code_exercise
//
//  Created by Cameron Wilcox on 5/24/21.
//

import UIKit

/*
 Convert image URLs into UIImage object, returns UIImageView
 If there is no URL the UIImage will default a placeholder image
 Images are saved to an image cache for reuse in BrowseEventsVC UITableView
 */

/*
 Built project without use of third parties libraries
 The use of a library such as SDWebImage could offer a better user experience while asynchronous loading and caching images
 */

var imageCache = NSCache<AnyObject, AnyObject>()
extension UIImageView {
    func loadImage(from url: URL?) {
        DispatchQueue.global().async { [weak self] in
            if url == nil {
                self?.image = UIImage(named: "placeholder_img")
            } else {
                var imageToDisplay: UIImage!
                if let image = imageCache.object(forKey: url!.absoluteString as NSString) as? UIImage {
                        imageToDisplay = image
                }
                if let data = try? Data.init(contentsOf: url!) {
                    if let image = UIImage(data: data) {
                            imageCache.setObject(image, forKey: url!.absoluteString as NSString)
                            imageToDisplay = image
                    }
                }
                DispatchQueue.main.async {
                    self?.image = imageToDisplay
                }
            }
        }
    }
}
