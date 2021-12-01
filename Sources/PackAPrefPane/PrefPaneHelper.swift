//
//  PrefPaneHelper.swift
//  
//
//  Created by William Mead on 06/11/2021.
//
// MARK: - Modules
import Foundation
// MARK: - Classes
/// General helper class
public class PrefPaneHelper {
    // MARK: - Functions
    /// Function that returns your app's App store review page URL
    /// - Parameter appID: ``PrefPaneData/appID``
    /// - Returns: A *https* **URL** to your app's App store page
    public static func appFeedbackURL(for appID: String) -> URL {
        if let appStoreURL = URL(string: "https://apps.apple.com/app/id\(appID)?action=write-review".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) {
            return appStoreURL
        } else {
            return URL(string: "")!
        }
    }
    /// Function to setup support email URL
    /// - Parameters:
    ///   - emailAddress: ``PrefPaneData/supportEmailAddress``
    ///   - emailSubject: ``PrefPaneData/supportEmailSubject``
    ///   - emailBody: ``PrefPaneData/supportEmailBody``
    /// - Returns: A *mailto* **URL** thats includes email address, subject & body
    public static func supportEmailURL(
        to emailAddress: String,
        subject emailSubject: String,
        message emailBody: String
    ) -> URL {
        if let supportEmailURL = URL(string: "mailto:\(emailAddress)?subject=\(emailSubject)&body=\(emailBody)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) {
            return supportEmailURL
        } else {
            return URL(string: "")!
        }
    }
    /// Function to check if legal disclaimer accepted
    /// - Parameter disclaimerAcceptedDefaultsKey: ``PrefPaneData/disclaimerAcceptedDefaultsKey``
    /// - Returns: true or false
    public static func checkDisclaimerAccepted(disclaimerAcceptedDefaultsKey: String) -> Bool {
        if UserDefaults.standard.bool(forKey: disclaimerAcceptedDefaultsKey) {
            return true
        } else {
            return false
        }
    }
    /// Function to set & date legal disclaimer user consent
    /// - Parameters:
    ///   - disclaimerAcceptedDefaultsKey: ``PrefPaneData/disclaimerAcceptedDefaultsKey``
    ///   - disclaimerAcceptedDateDefaultsKey: ``PrefPaneData/disclaimerAcceptedDateDefaultsKey``
    public static func acceptDisclaimer(
        disclaimerAcceptedDefaultsKey: String,
        disclaimerAcceptedDateDefaultsKey: String
    ) {
        UserDefaults.standard.set(true, forKey: disclaimerAcceptedDefaultsKey)
        UserDefaults.standard.set(Date(), forKey: disclaimerAcceptedDateDefaultsKey)
    }
    /// Function to check if privacy policy accepted
    /// - Parameter privacyPolicyAcceptedDefaultsKey: ``PrefPaneData/privacyPolicyAcceptedDefaultsKey``
    /// - Returns: true or false
    public static func checkPrivacyPolicyAccepted(privacyPolicyAcceptedDefaultsKey: String) -> Bool {
        if UserDefaults.standard.bool(forKey: privacyPolicyAcceptedDefaultsKey) {
            return true
        } else {
            return false
        }
    }
    /// Function to set & date privacy policy user consent
    /// - Parameters:
    ///   - privacyPolicyAcceptedDefaultsKey: ``PrefPaneData/privacyPolicyAcceptedDefaultsKey``
    ///   - privacyPolicyAcceptedDateDefaultsKey: ``PrefPaneData/privacyPolicyAcceptedDateDefaultsKey``
    public static func acceptPrivacyPolicy(
        privacyPolicyAcceptedDefaultsKey: String,
        privacyPolicyAcceptedDateDefaultsKey: String
    ) {
        UserDefaults.standard.set(true, forKey: privacyPolicyAcceptedDefaultsKey)
        UserDefaults.standard.set(Date(), forKey: privacyPolicyAcceptedDateDefaultsKey)
    }
}
