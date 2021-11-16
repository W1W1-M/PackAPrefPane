//
//  prefPaneData.swift
//  
//
//  Created by William Mead on 14/11/2021.
//
// MARK: - Modules
import Foundation
// MARK: - Structs
/// Custom type to group custom input data
public struct PrefPaneData {
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
