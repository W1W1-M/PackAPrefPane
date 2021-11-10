//
//  PrefPaneHelper.swift
//  
//
//  Created by William Mead on 06/11/2021.
//
// MARK: - Modules
import Foundation
import UIKit
// MARK: - Struct
/// Custom type for third party code information
public struct ThirdPartyCode: Identifiable {
    public let id = UUID()
    let sourceNameText: String
    let sourceURLText: String
    let sourceLicenseText: String
}
/// Custom type to group custom input data
public struct PackAPrefPaneData {
    // Help constants from parent view
    
    // AppInfo constants from parent view
    let developerInfoText: String
    let appCopyrightText: String
    let thirdPartyCode: [ThirdPartyCode]
    // Legal constant from parent view
    let disclaimerText: String
    let privacyPolicyText: String
    let specialThanksText: String
}
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
