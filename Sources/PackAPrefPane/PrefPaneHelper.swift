//
//  PrefPaneHelper.swift
//  
//
//  Created by William Mead on 06/11/2021.
//
// MARK: - Modules
import Foundation
import UIKit
// MARK: - Structs
/// Custom type for third party code information
public struct ThirdPartyCode: Identifiable {
    public let id = UUID()
    let sourceNameText: String
    let sourceURLText: String
    let sourceLicenseText: String
}
/// Custom type for FAQ information
public struct FrequentlyAskedQuestions: Identifiable {
    public let id = UUID()
    let question: String
    let answer: String
}
/// Custom type to group custom input data
public struct PackAPrefPaneData {
    // Help constants from parent view
    let appID: String
    let changelogText: String
    let faq: [FrequentlyAskedQuestions]
    // AppInfo constants from parent view
    let developerInfoText: String
    let appCopyrightText: String
    let thirdPartyCode: [ThirdPartyCode]
    // Legal constant from parent view
    let disclaimerText: String
    let privacyPolicyText: String
    let specialThanksText: String
}
// MARK: - Classes
class PrefPaneHelper {
    // MARK: - Functions
    /// Function that opens App store review page using your apps App store ID XXXXXXXXXX
    static func appFeedback(appID: String) {
        let reviewURL = "https://apps.apple.com/app/id"+appID+"?action=write-review"
        guard let writeReviewURL = URL(string: reviewURL) else { fatalError("Expected a valid URL") }
        UIApplication.shared.open(writeReviewURL, options: [:], completionHandler: nil)
    }
}
