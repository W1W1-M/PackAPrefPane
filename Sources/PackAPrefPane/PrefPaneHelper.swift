//
//  PrefPaneHelper.swift
//  
//
//  Created by William Mead on 06/11/2021.
//
// MARK: - Modules
import Foundation
// MARK: - Structs
/// Custom type for third party code information
public struct ThirdPartyCode: Identifiable {
    public init( // public init for public struct
        sourceNameText: String,
        sourceURLText: String,
        sourceLicenseText: String
    ) {
        self.sourceNameText = sourceNameText
        self.sourceURLText = sourceURLText
        self.sourceLicenseText = sourceLicenseText
    }
    public let id = UUID()
    let sourceNameText: String
    let sourceURLText: String
    let sourceLicenseText: String
}
/// Custom type for FAQ information
public struct FrequentlyAskedQuestions: Identifiable {
    public init( // public init for public struct
        question: String,
        answer: String
    ) {
        self.question = question
        self.answer = answer
    }
    public let id = UUID()
    let question: String
    let answer: String
}
/// Custom type to group custom input data
public struct PackAPrefPaneData {
    public init( // public init for public struct
        showFeedbackLink: Bool,
        showSupportLink: Bool,
        showWhatsNew: Bool,
        showFAQ: Bool,
        appID: String,
        supportEmailAddress: String,
        supportEmailSubject: String,
        supportEmailBody: String,
        changelogText: String,
        faq: [FrequentlyAskedQuestions],
        developerInfoText: String,
        appCopyrightText: String,
        thirdPartyCode: [ThirdPartyCode],
        showDisclaimer: Bool,
        showPrivacyPolicy: Bool,
        showAcknowledgments: Bool,
        showTOS: Bool,
        disclaimerText: String,
        privacyPolicyText: String,
        acknowledgmentsText: String,
        termsOfServiceText: String
    ) {
        self.showFeedbackLink = showFeedbackLink
        self.showSupportLink = showSupportLink
        self.showWhatsNew = showWhatsNew
        self.showFAQ = showFAQ
        self.appID = appID
        self.supportEmailAddress = supportEmailAddress
        self.supportEmailSubject = supportEmailSubject
        self.supportEmailBody = supportEmailBody
        self.changelogText = changelogText
        self.faq = faq
        self.developerInfoText = developerInfoText
        self.appCopyrightText = appCopyrightText
        self.thirdPartyCode = thirdPartyCode
        self.showDisclaimer = showDisclaimer
        self.showPrivacyPolicy = showPrivacyPolicy
        self.showAcknowledgments = showAcknowledgments
        self.showTOS = showTOS
        self.disclaimerText = disclaimerText
        self.privacyPolicyText = privacyPolicyText
        self.acknowledgmentsText = acknowledgmentsText
        self.termsOfServiceText = termsOfServiceText
    }
    // Help constants from parent view
    let showFeedbackLink: Bool
    let showSupportLink: Bool
    let showWhatsNew: Bool
    let showFAQ: Bool
    let appID: String
    let supportEmailAddress: String
    let supportEmailSubject: String
    let supportEmailBody: String
    let changelogText: String
    let faq: [FrequentlyAskedQuestions]
    // AppInfo constants from parent view
    let developerInfoText: String
    let appCopyrightText: String
    let thirdPartyCode: [ThirdPartyCode]
    // Legal constant from parent view
    let showDisclaimer: Bool
    let showPrivacyPolicy: Bool
    let showAcknowledgments: Bool
    let showTOS: Bool
    let disclaimerText: String
    let privacyPolicyText: String
    let acknowledgmentsText: String
    let termsOfServiceText: String
}
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
    /// Function that checks if disclaimer accepted else shows disclaimer
    static func checkLegalDisclaimer() {
        
    }
    /// Function that checks if disclaimer accepted else shows disclaimer
    static func acceptLegalDisclaimer() {
        
    }
    /// Function that checks if privacy policy read else shows privacy policy
    static func checkLegalPrivacyPolicy() {
        
    }
    /// Function that checks if privacy policy read else shows privacy policy
    static func acceptLegalPrivacyPolicy() {
        
    }
}
