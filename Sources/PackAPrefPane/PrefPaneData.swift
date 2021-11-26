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
        showHelpSection: Bool,
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
        showLegalSection: Bool,
        showDisclaimer: Bool,
        showPrivacyPolicy: Bool,
        showAcknowledgments: Bool,
        showTOS: Bool,
        disclaimerText: String,
        privacyPolicyText: String,
        acknowledgmentsText: String,
        termsOfServiceText: String,
        disclaimerAcceptedCheck: Bool,
        privacyPolicyAcceptedCheck: Bool,
        disclaimerAcceptedDefaultsKey: String,
        disclaimerAcceptedDateDefaultsKey: String,
        privacyPolicyAcceptedDefaultsKey: String,
        privacyPolicyAcceptedDateDefaultsKey: String
    ) {
        self.showHelpSection = showHelpSection
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
        self.thirdPartyCode.insert(thirdPartyCodePackAPrefPane, at: 0)
        self.showLegalSection = showLegalSection
        self.showDisclaimer = showDisclaimer
        self.showPrivacyPolicy = showPrivacyPolicy
        self.showAcknowledgments = showAcknowledgments
        self.showTOS = showTOS
        self.disclaimerText = disclaimerText
        self.privacyPolicyText = privacyPolicyText
        self.acknowledgmentsText = acknowledgmentsText
        self.termsOfServiceText = termsOfServiceText
        self.disclaimerAcceptedCheck = disclaimerAcceptedCheck
        self.privacyPolicyAcceptedCheck = privacyPolicyAcceptedCheck
        self.disclaimerAcceptedDefaultsKey = disclaimerAcceptedDefaultsKey
        self.disclaimerAcceptedDateDefaultsKey = disclaimerAcceptedDateDefaultsKey
        self.privacyPolicyAcceptedDefaultsKey = privacyPolicyAcceptedDefaultsKey
        self.privacyPolicyAcceptedDateDefaultsKey = privacyPolicyAcceptedDateDefaultsKey
    }
    // Help constants from parent view
    let showHelpSection: Bool
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
    var thirdPartyCode: [ThirdPartyCode]
    // Legal constants from parent view
    let showLegalSection: Bool
    let showDisclaimer: Bool
    let showPrivacyPolicy: Bool
    let showAcknowledgments: Bool
    let showTOS: Bool
    let disclaimerText: String
    let privacyPolicyText: String
    let acknowledgmentsText: String
    let termsOfServiceText: String
    let disclaimerAcceptedCheck: Bool
    let privacyPolicyAcceptedCheck: Bool
    let disclaimerAcceptedDefaultsKey: String
    let disclaimerAcceptedDateDefaultsKey: String
    let privacyPolicyAcceptedDefaultsKey: String
    let privacyPolicyAcceptedDateDefaultsKey: String
    //
    let thirdPartyCodePackAPrefPane: ThirdPartyCode = ThirdPartyCode(
        sourceNameText: "PackAPrefPane by W1W1-M",
        sourceURLText: "https://github.com/W1W1-M/PackAPrefPane",
        sourceLicenseText: "MIT license"
    )
}
/// Custom type for third party code information
public struct ThirdPartyCode: Identifiable {
    /// **ThirdParyCode** public initializer for swift package usage
    /// - Parameters:
    ///   - sourceNameText: A **String** to describe the third party code
    ///   - sourceURLText: A **String** to the third party code website
    ///   - sourceLicenseText: A **String** of third party code license
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
