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
    /// Function that returns App store review page URL
    ///# Notes: #
    /// test
    /// - Parameter appID: A **String** of your apps App store ID XXXXXXXXXX
    /// - Returns: Returns a *https:* **URL** to your apps App store page
    static func appFeedbackURL(appID: String) -> URL {
        if let appStoreURL = URL(string: "https://apps.apple.com/app/id\(appID)?action=write-review".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) {
            return appStoreURL
        } else {
            return URL(string: "")!
        }
    }
    /// Function to setup support email URL
    /// - Parameters:
    ///   - supportEmailAddress: A **String** of the your support email address
    ///   - supportEmailSubject: A **String** of the your support email subject
    ///   - supportEmailBody: A **String** of the your support email body
    /// - Returns: Returns a *mailto:* **URL** thats includes email address, subject & body
    static func setSupportEmailURL(supportEmailAddress: String, supportEmailSubject: String, supportEmailBody: String) -> URL {
        if let supportEmailURL = URL(string: "mailto:\(supportEmailAddress)?subject=\(supportEmailSubject)&body=\(supportEmailBody)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) {
            return supportEmailURL
        } else {
            return URL(string: "")!
        }
    }
    /// Function to check if legal disclaimer accepted
    static func checkDisclaimerAccepted(disclaimerAcceptedDefaultsKey: String) -> Bool {
        if UserDefaults.standard.bool(forKey: disclaimerAcceptedDefaultsKey) {
            return true
        } else {
            return false
        }
    }
    /// Function to set & date legal disclaimer acceptance
    static func acceptDisclaimer(disclaimerAcceptedDefaultsKey: String, disclaimerAcceptedDateDefaultsKey: String) {
        UserDefaults.standard.set(true, forKey: disclaimerAcceptedDefaultsKey)
        UserDefaults.standard.set(Date(), forKey: disclaimerAcceptedDateDefaultsKey)
    }
    /// Function to check if privacy policy accepted
    static func checkPrivacyPolicyAccepted(privacyPolicyAcceptedDefaultsKey: String) -> Bool {
        if UserDefaults.standard.bool(forKey: privacyPolicyAcceptedDefaultsKey) {
            return true
        } else {
            return false
        }
    }
    /// Function to set & date privacy policy acceptance
    static func acceptPrivacyPolicy(privacyPolicyAcceptedDefaultsKey: String, privacyPolicyAcceptedDateDefaultsKey: String) {
        UserDefaults.standard.set(true, forKey: privacyPolicyAcceptedDefaultsKey)
        UserDefaults.standard.set(Date(), forKey: privacyPolicyAcceptedDateDefaultsKey)
    }
}
