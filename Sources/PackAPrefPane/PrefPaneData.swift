//
//  prefPaneData.swift
//  
//
//  Created by William Mead on 14/11/2021.
//
// MARK: - Modules
import Foundation
// MARK: - Structs
/// Type to group custom input data
public struct PrefPaneData {
    /// **PrefPaneData** public initializer for swift package usage
    /// 
    /// - Parameters:
    ///   - showHelpSection: ``PrefPaneData/showHelpSection``
    ///   - showFeedbackLink: ``PrefPaneData/showFeedbackLink``
    ///   - showSupportLink: ``PrefPaneData/showSupportLink``
    ///   - showWhatsNew: ``PrefPaneData/showWhatsNew``
    ///   - showFAQ: ``PrefPaneData/showFAQ``
    ///   - appID: ``PrefPaneData/appID``
    ///   - supportEmailAddress: ``PrefPaneData/supportEmailAddress``
    ///   - supportEmailSubject: ``PrefPaneData/supportEmailSubject``
    ///   - supportEmailBody: ``PrefPaneData/supportEmailBody``
    ///   - changelogText: ``PrefPaneData/changelogText``
    ///   - faq: ``PrefPaneData/faq``
    ///   - developerInfoText: ``PrefPaneData/developerInfoText``
    ///   - appCopyrightText: ``PrefPaneData/appCopyrightText``
    ///   - thirdPartyCode: ``PrefPaneData/thirdPartyCode``
    ///   - showLegalSection: ``PrefPaneData/showLegalSection``
    ///   - showDisclaimer: ``PrefPaneData/showDisclaimer``
    ///   - showPrivacyPolicy: ``PrefPaneData/showPrivacyPolicy``
    ///   - showAcknowledgments: ``PrefPaneData/showAcknowledgments``
    ///   - showTOS: ``PrefPaneData/showTOS``
    ///   - disclaimerText: ``PrefPaneData/disclaimerText``
    ///   - privacyPolicyText: ``PrefPaneData/privacyPolicyText``
    ///   - acknowledgmentsText: ``PrefPaneData/acknowledgmentsText``
    ///   - termsOfServiceText: ``PrefPaneData/termsOfServiceText``
    ///   - disclaimerAcceptedCheck: ``PrefPaneData/disclaimerAcceptedCheck``
    ///   - privacyPolicyAcceptedCheck: ``PrefPaneData/privacyPolicyAcceptedCheck``
    ///   - disclaimerAcceptedDefaultsKey: ``PrefPaneData/disclaimerAcceptedDefaultsKey``
    ///   - disclaimerAcceptedDateDefaultsKey: ``PrefPaneData/disclaimerAcceptedDateDefaultsKey``
    ///   - privacyPolicyAcceptedDefaultsKey: ``PrefPaneData/privacyPolicyAcceptedDefaultsKey``
    ///   - privacyPolicyAcceptedDateDefaultsKey: ``PrefPaneData/privacyPolicyAcceptedDateDefaultsKey``
    public init(
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
    /// Boolean to show or drop help section
    public let showHelpSection: Bool
    /// Boolean to show or drop feedback link
    public let showFeedbackLink: Bool
    /// Boolean to show or drop support link
    public let showSupportLink: Bool
    /// Boolean to show or drop release notes disclosure group
    public let showWhatsNew: Bool
    /// Boolean show or drop frequently asked questions disclosure group
    public let showFAQ: Bool
    /// Your app's App store ID.
    ///
    /// Example: *1564978634*
    public let appID: String
    /// Full email address for user support
    public let supportEmailAddress: String
    /// Text to prefill email subject
    public let supportEmailSubject: String
    /// Text to prefill email body
    public let supportEmailBody: String
    /// Your app's current release notes
    public let changelogText: String
    /// An array of [FrequentlyAskedQuestions]
    public let faq: [FrequentlyAskedQuestions]
    /// Your developer information text.
    ///
    /// Example: *Designed & Developped by you*
    public let developerInfoText: String
    /// Your app's copyright text.
    ///
    /// Example: *Copyright 2021-2022*
    public let appCopyrightText: String
    /// An array of [ThirdPartyCode]
    public var thirdPartyCode: [ThirdPartyCode]
    /// Boolean to show or drop legal section
    public let showLegalSection: Bool
    /// Boolean to show or drop disclaimer button
    public let showDisclaimer: Bool
    /// Boolean to show or drop privacy policy button
    public let showPrivacyPolicy: Bool
    /// Boolean to show or drop acknowledgments button
    public let showAcknowledgments: Bool
    /// Boolean to show or drop terms of service disclosure group
    public let showTOS: Bool
    /// Your legal disclaimer text
    public let disclaimerText: String
    /// Your privacy policy text
    public let privacyPolicyText: String
    /// Your special thanks text
    public let acknowledgmentsText: String
    /// Your service terms text
    public let termsOfServiceText: String
    /// Boolean to activate user accepted disclaimer check
    public let disclaimerAcceptedCheck: Bool
    /// Boolean to activate user accepted privacy policy check
    public let privacyPolicyAcceptedCheck: Bool
    /// Disclaimer accepted user defaults key String
    public let disclaimerAcceptedDefaultsKey: String
    /// Disclaimer accepted date user defaults key String
    public let disclaimerAcceptedDateDefaultsKey: String
    /// Privacy policy accepted user defaults key String
    public let privacyPolicyAcceptedDefaultsKey: String
    /// Privacy polcy date accepted user defaults key String
    public let privacyPolicyAcceptedDateDefaultsKey: String
    let thirdPartyCodePackAPrefPane: ThirdPartyCode = ThirdPartyCode(
        sourceNameText: "PackAPrefPane by W1W1-M",
        sourceURLText: "https://github.com/W1W1-M/PackAPrefPane",
        sourceLicenseText: "MIT license"
    )
}
/// Type for third party code information
///
/// Reference third party code to acknowledge other developers and respect their work.
public struct ThirdPartyCode: Identifiable {
    /// **ThirdParyCode** public initializer for swift package usage
    ///
    /// - Parameters:
    ///   - sourceNameText: ``ThirdPartyCode/sourceNameText``
    ///   - sourceURLText: ``ThirdPartyCode/sourceURLText``
    ///   - sourceLicenseText: ``ThirdPartyCode/sourceLicenseText``
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
    /// Text description of third party code name & author.
    ///
    /// Example: *PackAPrefPane by W1W1-M*
    public let sourceNameText: String
    /// Full Text URL to the third party code website.
    ///
    /// Example: *https:\//github.com/W1W1-M/PackAPrefPane*
    public let sourceURLText: String
    /// Text description of source code license.
    ///
    /// Example: *MIT license*
    public let sourceLicenseText: String
}
/// Type for FAQ information
///
/// An instance of FrequentlyAskedQuestions is composed of one question & one answer. Use an array in order to make up a complet FAQ.
public struct FrequentlyAskedQuestions: Identifiable {
    /// **FrequentlyAskedQuestions** public initializer for swift package usage
    ///
    /// - Parameters:
    ///   - question: ``FrequentlyAskedQuestions/question``
    ///   - answer: ``FrequentlyAskedQuestions/answer``
    public init(
        question: String,
        answer: String
    ) {
        self.question = question
        self.answer = answer
    }
    /// id is used for SwiftUI ForEach iterations in Help View
    public let id = UUID()
    /// Text description of  FAQ question.
    ///
    /// Example: *Q.1: How is this example calculated ?*
    public let question: String
    /// Text description of  FAQ answer.
    ///
    /// Example: *A.1: The example is calculated X-Y+Z*
    public let answer: String
}
