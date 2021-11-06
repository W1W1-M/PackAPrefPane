//
//  PrefPaneHelper.swift
//  
//
//  Created by William Mead on 06/11/2021.
//
// MARK: - Modules
import Foundation
import UIKit
// MARK: - Class
class PrefPaneHelper {
    // MARK: - Functions
    /// Function that opens App store review page
    static func appFeedback() { // Replace the XXXXXXXXXX below with the App Store ID for your app
        let reviewURL = "https://apps.apple.com/app/idXXXXXXXXXX?action=write-review"
        guard let writeReviewURL = URL(string: reviewURL) else { fatalError("Expected a valid URL") }
        UIApplication.shared.open(writeReviewURL, options: [:], completionHandler: nil)
    }
}
