//
//  Help.swift
//  
//
//  Created by William Mead on 06/11/2021.
//
// MARK: - Modules
import SwiftUI
// MARK: - Views
/// Help section View
@available(macOS 11.0, iOS 14, *)
public struct Help: View {
    // Variables
    let prefPaneData: PrefPaneData
    // UI
    public var body: some View {
        if prefPaneData.showHelpSection {
            Section(header: Text(NSLocalizedString("🆘 Help", tableName: "Localizable", bundle: .module, value: "", comment: ""))) {
                if prefPaneData.showFeedbackLink {
                    Feedback(prefPaneData: prefPaneData)
                }
                if prefPaneData.showSupportLink {
                    Support(prefPaneData: prefPaneData)
                }
                if prefPaneData.showWhatsNew {
                    WhatsNew(prefPaneData: prefPaneData)
                }
                if prefPaneData.showFAQ {
                    FAQ(prefPaneData: prefPaneData)
                }
            }
        }
    }
}
// MARK: - Feedback
@available(macOS 11.0, iOS 14, *)
struct Feedback: View {
    // Variables
    let prefPaneData: PrefPaneData
    // UI
    var body: some View {
        Link(destination: PrefPaneHelper.appFeedbackURL(for: prefPaneData.appID)) {
            HStack {
                Text(NSLocalizedString("Feedback", tableName: "Localizable", bundle: .module, value: "", comment: ""))
                Spacer()
                Image(systemName: "plus.bubble.fill").imageScale(.large)
            }
        }
    }
}
// MARK: - Support
@available(macOS 11.0, iOS 14, *)
struct Support: View {
    // Variables
    let prefPaneData: PrefPaneData
    // UI
    var body: some View {
        Link(destination: PrefPaneHelper.supportEmailURL(
                to: prefPaneData.supportEmailAddress,
                subject: prefPaneData.supportEmailSubject,
                message: prefPaneData.supportEmailBody
            )
        ) {
            HStack {
                Text(NSLocalizedString("Support", tableName: "Localizable", bundle: .module, value: "", comment: ""))
                Spacer()
                Image(systemName: "cross.case.fill").imageScale(.large)
            }
        }
    }
}
// MARK: - WhatsNew
@available(macOS 11.0, iOS 14, *)
struct WhatsNew: View {
    // Variables
    @State private var whatsNewExpanded: Bool = false
    let prefPaneData: PrefPaneData
    let appVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
    // UI
    var body: some View {
        DisclosureGroup(NSLocalizedString("What's New", tableName: "Localizable", bundle: .module, value: "", comment: ""), isExpanded: $whatsNewExpanded) {
            VStack {
                HStack {
                    Spacer()
                    Text(NSLocalizedString("Release Notes", tableName: "Localizable", bundle: .module, value: "", comment: ""))
                    Text("v\(appVersion)")
                    Spacer()
                }.font(.headline)
                Spacer()
                HStack {
                    Text(NSLocalizedString(prefPaneData.changelogText, tableName: "Localizable", bundle: .main, value: "", comment: ""))
                    Spacer()
                }
            }
        }
    }
}
// MARK: - FAQ
@available(macOS 11.0, iOS 14, *)
struct FAQ: View {
    // Variables
    @State private var faqExpanded: Bool = false
    let prefPaneData: PrefPaneData
    // UI
    var body: some View {
        DisclosureGroup(NSLocalizedString("FAQ", tableName: "Localizable", bundle: .module, value: "", comment: ""), isExpanded: $faqExpanded) {
            List {
                ForEach(prefPaneData.faq) { FrequentlyAskedQuestions in
                    VStack {
                        HStack {
                            Text(NSLocalizedString(FrequentlyAskedQuestions.question, tableName: "Localizable", bundle: .main, value: "", comment: "")).font(.headline)
                            Spacer()
                        }
                        Spacer()
                        HStack {
                            Text(NSLocalizedString(FrequentlyAskedQuestions.answer, tableName: "Localizable", bundle: .main, value: "", comment: ""))
                            Spacer()
                        }
                    }
                }
            }
        }
    }
}
// MARK: - Previews
@available(macOS 11.0, iOS 14, *)
struct Help_Previews: PreviewProvider {
    @State var alertPresented: Bool = false
    static var previews: some View {
        Form{
            Help(
                prefPaneData: PrefPaneData(
                    showHelpSection: true,
                    showFeedbackLink: true,
                    showSupportLink: true,
                    showWhatsNew: true,
                    showFAQ: true,
                    appID: "1564978634",
                    supportEmailAddress: "support@super85.fr",
                    supportEmailSubject: "PackAPrefPane Test",
                    supportEmailBody: "Testing PackAPrefPane",
                    changelogText: "- New Feature \n- Upgraded feature \n- Bug fixed",
                    faq: [
                        FrequentlyAskedQuestions(
                            question: "Q.1: How is this example calculated ?",
                            answer: "A.1: The example's percentage is calculated by dividing the combined amount of this from each of that by the total quantity of those."
                        ),
                        FrequentlyAskedQuestions(
                            question: "Q.2: What % of this can I use ?",
                            answer: "A.2: Those can tolerate a small percentage of that in the these. Please enquire by your own means beforehand."
                        )
                    ],
                    developerInfoText: "Designed & Developped in 🏴‍☠️ \n by a super dev",
                    appCopyrightText: "Your app Copyright © 2021-2022",
                    thirdPartyCode: [
                        ThirdPartyCode(
                            sourceNameText: "Font & Emoji by Apple Inc.",
                            sourceURLText: "https://developer.apple.com/fonts",
                            sourceLicenseText: "Copyright © All rights reserved"
                        )
                    ],
                    showLegalSection: true,
                    showDisclaimer: true,
                    showPrivacyPolicy: true,
                    showAcknowledgments: true,
                    showTOS: true,
                    disclaimerText: "Use of this app is for informational purposes only. You alone are responsable for the usages you make of this app and you use it at your own risk. We accept no responsability for any damage to users or to their belongings as a result of using this app.",
                    privacyPolicyText: "We don't store your data.",
                    acknowledgmentsText: "Thanks to SwiftUI Jam",
                    termsOfServiceText: "Some terms of service that should be read by users.",
                    disclaimerAcceptedCheck: true,
                    privacyPolicyAcceptedCheck: true,
                    disclaimerAcceptedDefaultsKey: "disclaimerAccepted",
                    disclaimerAcceptedDateDefaultsKey: "disclaimerAcceptedDate",
                    privacyPolicyAcceptedDefaultsKey: "privacyPolicyAccepted",
                    privacyPolicyAcceptedDateDefaultsKey: "privacyPolicyAcceptedDate"
                )
            )
        }.previewLayout(.sizeThatFits)
    }
}
