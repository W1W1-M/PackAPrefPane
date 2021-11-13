//
//  Help.swift
//  
//
//  Created by William Mead on 06/11/2021.
//
// MARK: - Modules
import SwiftUI
// MARK: - Views
struct Help: View {
    // Variables
    @State private var faqExpanded: Bool = false
    @State private var whatsNewExpanded: Bool = false
    let appVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
    let packAPrefPaneData: PackAPrefPaneData
    // UI
    var body: some View {
        Section(header: Text(NSLocalizedString("🆘 Help", tableName: "Localizable", bundle: .module, value: "", comment: ""))) {
            if packAPrefPaneData.showFeedbackLink {
                Link(destination: PrefPaneHelper.appFeedback(appID: packAPrefPaneData.appID)) {
                    HStack {
                        Text(NSLocalizedString("Feedback", tableName: "Localizable", bundle: .module, value: "", comment: ""))
                        Spacer()
                        Image(systemName: "plus.bubble.fill").imageScale(.large)
                    }
                }
            }
            if packAPrefPaneData.showSupportLink {
                Link(destination: PrefPaneHelper.setSupportEmailURL(
                        supportEmailAddress: packAPrefPaneData.supportEmailAddress,
                        supportEmailSubject: packAPrefPaneData.supportEmailSubject,
                        supportEmailBody: packAPrefPaneData.supportEmailBody
                    )
                ) {
                    HStack {
                        Text(NSLocalizedString("Support", tableName: "Localizable", bundle: .module, value: "", comment: ""))
                        Spacer()
                        Image(systemName: "cross.case.fill").imageScale(.large)
                    }
                }
            }
            if packAPrefPaneData.showWhatsNew {
                DisclosureGroup(NSLocalizedString("What's New", tableName: "Localizable", bundle: .module, value: "", comment: ""), isExpanded: $whatsNewExpanded) {
                    VStack {
                        HStack {
                            Text(NSLocalizedString("Release Notes v\(appVersion)", tableName: "Localizable", bundle: .module, value: "", comment: ""))
                                .font(.headline)
                                .underline()
                            Spacer()
                        }
                        Spacer()
                        HStack {
                            Text(packAPrefPaneData.changelogText)
                            Spacer()
                        }
                    }
                }
            }
            if packAPrefPaneData.showFAQ {
                DisclosureGroup(NSLocalizedString("FAQ", tableName: "Localizable", bundle: .module, value: "", comment: ""), isExpanded: $faqExpanded) {
                    ForEach(packAPrefPaneData.faq) { FrequentlyAskedQuestions in
                        VStack {
                            HStack {
                                Text(FrequentlyAskedQuestions.question).font(.headline)
                                Spacer()
                            }
                            Spacer()
                            HStack {
                                Text(FrequentlyAskedQuestions.answer)
                                Spacer()
                            }
                        }
                    }
                }
            }
        }
    }
}
// MARK: - Previews
struct Help_Previews: PreviewProvider {
    @State var alertPresented: Bool = false
    static var previews: some View {
        Form{
            Help(
                packAPrefPaneData: PackAPrefPaneData(
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
                            sourceNameText: "PackAPrefPane by W1W1-M",
                            sourceURLText: "https://github.com/W1W1-M/PackAPrefPane",
                            sourceLicenseText: "MIT license"
                        ),
                        ThirdPartyCode(
                            sourceNameText: "Font & Emoji by Apple Inc.",
                            sourceURLText: "https://developer.apple.com/fonts",
                            sourceLicenseText: "Copyright © All rights reserved"
                        )
                    ],
                    showDisclaimer: true,
                    showPrivacyPolicy: true,
                    showAcknowledgments: true,
                    showTOS: true,
                    disclaimerText: "Use of this app is for informational purposes only. You alone are responsable for the usages you make of this app and you use it at your own risk. We accept no responsability for any damage to users or to their belongings as a result of using this app.",
                    privacyPolicyText: "We don't store your data.",
                    acknowledgmentsText: "Thanks to SwiftUI Jam",
                    termsOfServiceText: "Some terms of service that should be read by users."
                )
            )
        }.previewLayout(.sizeThatFits)
    }
}
