//
//  AlertView.swift
//  fetch_rewards_code_exercise
//
//  Created by Cameron Wilcox on 5/24/21.
//

import UIKit

class AlertView {
    class func showAlertView(view: UIViewController, title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        view.present(alert, animated: true, completion: nil)
    }
}
