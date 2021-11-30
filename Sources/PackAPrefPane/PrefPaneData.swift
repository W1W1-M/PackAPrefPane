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
    /// **PrefPaneData** public initializer for swift package usage
    /// 
    /// - Parameters:
    ///   - showHelpSection: Boolean to show or drop help section
    ///   - showFeedbackLink: Boolean to show or drop feedback link
    ///   - showSupportLink: Boolean to show or drop support link
    ///   - showWhatsNew: Boolean to show or drop release notes disclosure group
    ///   - showFAQ: Boolean show or drop frequently asked questions disclosure group 
    ///   - appID: Your app's App store ID. Example: *1564978634*
    ///   - supportEmailAddress: Full email address for user support
    ///   - supportEmailSubject: Text to prefill email subject
    ///   - supportEmailBody: Text to prefill email body
    ///   - changelogText: Your app's current release notes
    ///   - faq: An array of [FrequentlyAskedQuestions]
    ///   - developerInfoText: Your developer information text. Example: *Designed & Developped by you*
    ///   - appCopyrightText: Your app's copyright text. Example: *Copyright 2021-2022*
    ///   - thirdPartyCode: An array of [ThirdPartyCode]
    ///   - showLegalSection: Boolean to show or drop legal section
    ///   - showDisclaimer: Boolean to show or drop disclaimer button
    ///   - showPrivacyPolicy: Boolean to show or drop privacy policy button
    ///   - showAcknowledgments: Boolean to show or drop acknowledgments button
    ///   - showTOS: Boolean to show or drop terms of service disclosure group
    ///   - disclaimerText: Your legal disclaimer text 
    ///   - privacyPolicyText: Your privacy policy text
    ///   - acknowledgmentsText: Your special thanks text 
    ///   - termsOfServiceText: Your service terms text 
    ///   - disclaimerAcceptedCheck: Boolean to activate user accepted disclaimer check 
    ///   - privacyPolicyAcceptedCheck: Boolean to activate user accepted privacy policy check
    ///   - disclaimerAcceptedDefaultsKey: Disclaimer accepted user defaults key String 
    ///   - disclaimerAcceptedDateDefaultsKey: Disclaimer accepted date user defaults key String 
    ///   - privacyPolicyAcceptedDefaultsKey: Privacy policy accepted user defaults key String 
    ///   - privacyPolicyAcceptedDateDefaultsKey: Privacy polcy date accepted user defaults key String  
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
    public let showHelpSection: Bool
    public let showFeedbackLink: Bool
    public let showSupportLink: Bool
    public let showWhatsNew: Bool
    public let showFAQ: Bool
    public let appID: String
    public let supportEmailAddress: String
    public let supportEmailSubject: String
    public let supportEmailBody: String
    public let changelogText: String
    public let faq: [FrequentlyAskedQuestions]
    public let developerInfoText: String
    public let appCopyrightText: String
    public var thirdPartyCode: [ThirdPartyCode]
    public let showLegalSection: Bool
    public let showDisclaimer: Bool
    public let showPrivacyPolicy: Bool
    public let showAcknowledgments: Bool
    public let showTOS: Bool
    public let disclaimerText: String
    public let privacyPolicyText: String
    public let acknowledgmentsText: String
    public let termsOfServiceText: String
    public let disclaimerAcceptedCheck: Bool
    public let privacyPolicyAcceptedCheck: Bool
    public let disclaimerAcceptedDefaultsKey: String
    public let disclaimerAcceptedDateDefaultsKey: String
    public let privacyPolicyAcceptedDefaultsKey: String
    public let privacyPolicyAcceptedDateDefaultsKey: String
    let thirdPartyCodePackAPrefPane: ThirdPartyCode = ThirdPartyCode(
        sourceNameText: "PackAPrefPane by W1W1-M",
        sourceURLText: "https://github.com/W1W1-M/PackAPrefPane",
        sourceLicenseText: "MIT license"
    )
}
/// Custom type for third party code information
///
/// Reference third party code to acknowledge other developers and respect their work.
public struct ThirdPartyCode: Identifiable {
    /// **ThirdParyCode** public initializer for swift package usage
    ///
    /// - Parameters:
    ///   - sourceNameText: Text description of third party code name & author. Example: *PackAPrefPane by W1W1-M*
    ///   - sourceURLText: Full Text URL to the third party code website. Example: *https:\//github.com/W1W1-M/PackAPrefPane*
    ///   - sourceLicenseText: Text description of source code license. Example: *MIT license*
    public init(
        sourceNameText: String,
        sourceURLText: String,
        sourceLicenseText: String
    ) {
        self.sourceNameText = sourceNameText
        self.sourceURLText = sourceURLText
        self.sourceLicenseText = sourceLicenseText
    }
    /// id is used for SwiftUI ForEach iterations in About View
    public let id = UUID()
    public let sourceNameText: String
    public let sourceURLText: String
    public let sourceLicenseText: String
}
/// Custom type for FAQ information
///
/// An instance of FrequentlyAskedQuestions is composed of one question & one answer. Use an array in order to make up a complet FAQ.
public struct FrequentlyAskedQuestions: Identifiable {
    /// **FrequentlyAskedQuestions** public initializer for swift package usage
    ///
    /// - Parameters:
    ///   - question: Text description of  FAQ question. Example: *Q.1: How is this example calculated ?*
    ///   - answer: Text description of  FAQ answer. Example: *A.1: The example is calculated X-Y+Z*
    public init(
        question: String,
        answer: String
    ) {
        self.question = question
        self.answer = answer
    }
    /// id is used for SwiftUI ForEach iterations in Help View
    public let id = UUID()
    public let question: String
    public let answer: String
}
