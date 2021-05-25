//
//  String+DateFormatter.swift
//  fetch_rewards_code_exercise
//
//  Created by Cameron Wilcox on 5/24/21.
//

import Foundation

/*\
 Converts incoming date format into preferred pattern
 Example (input: "2021-05-19T08:30:00" -> output: "Wednesday, 19 May 2021 3:30 PM")
 */

extension String {
    func formatToDate() -> String? {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        let dateFormatPrint = DateFormatter()
        dateFormatPrint.dateFormat = "EEEE, d MMM yyy h:mm a"
        
        if let date: Date = dateFormatterGet.date(from: self) {
            return dateFormatPrint.string(from: date)
        }
        return nil
    }
}
