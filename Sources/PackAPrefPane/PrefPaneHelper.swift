//
//  PrefPaneHelper.swift
//  
//
//  Created by William Mead on 06/11/2021.
//
// MARK: - Modules
import Foundation
// MARK: - Classes
class PrefPaneHelper {
    // MARK: - Functions
    /// Function that opens App store review page using your apps App store ID XXXXXXXXXX
    static func appFeedback(appID: String) -> URL {
        if let appStoreURL = URL(string: "https://apps.apple.com/app/id\(appID)?action=write-review".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) {
            return appStoreURL
        } else {
            return URL(string: "")!
        }
    }
    /// Function to setup support email URL
    static func setSupportEmailURL(supportEmailAddress: String, supportEmailSubject: String, supportEmailBody: String) -> URL {
        if let supportEmailURL = URL(string: "mailto:\(supportEmailAddress)?subject=\(supportEmailSubject)&body=\(supportEmailBody)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) {
            return supportEmailURL
        } else {
            return URL(string: "")!
        }
    }
}
