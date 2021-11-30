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
    /// - Parameter appID: Your app's App store ID. Example: *1564978634*
    /// - Returns: A *https* **URL** to your app's App store page
    public static func appFeedbackURL(appID: String) -> URL {
        if let appStoreURL = URL(string: "https://apps.apple.com/app/id\(appID)?action=write-review".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) {
            return appStoreURL
        } else {
            return URL(string: "")!
        }
    }
    /// Function to setup support email URL
    /// - Parameters:
    ///   - supportEmailAddress: Full support email address
    ///   - supportEmailSubject: Text to prefill email subject
    ///   - supportEmailBody: Text to prefill email body
    /// - Returns: A *mailto* **URL** thats includes email address, subject & body
    public static func setSupportEmailURL(
        address: String,
        subject: String,
        body: String
    ) -> URL {
        if let supportEmailURL = URL(string: "mailto:\(address)?subject=\(subject)&body=\(body)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) {
            return supportEmailURL
        } else {
            return URL(string: "")!
        }
    }
    /// Function to check if legal disclaimer accepted
    /// - Parameter disclaimerAcceptedDefaultsKey: User defaults disclaimer accepted key string
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
    ///   - disclaimerAcceptedDefaultsKey: User defaults disclaimer accepted key string
    ///   - disclaimerAcceptedDateDefaultsKey: User defaults disclaimer accepted date key string
    public static func acceptDisclaimer(
        disclaimerAcceptedDefaultsKey: String,
        disclaimerAcceptedDateDefaultsKey: String
    ) {
        UserDefaults.standard.set(true, forKey: disclaimerAcceptedDefaultsKey)
        UserDefaults.standard.set(Date(), forKey: disclaimerAcceptedDateDefaultsKey)
    }
    /// Function to check if privacy policy accepted
    /// - Parameter privacyPolicyAcceptedDefaultsKey: User defaults privacy policy accepted key string
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
    ///   - privacyPolicyAcceptedDefaultsKey: User defaults privacy policy accepted key string
    ///   - privacyPolicyAcceptedDateDefaultsKey: User defaults privacy policy accepted date key string
    public static func acceptPrivacyPolicy(
        privacyPolicyAcceptedDefaultsKey: String,
        privacyPolicyAcceptedDateDefaultsKey: String
    ) {
        UserDefaults.standard.set(true, forKey: privacyPolicyAcceptedDefaultsKey)
        UserDefaults.standard.set(Date(), forKey: privacyPolicyAcceptedDateDefaultsKey)
    }
}
