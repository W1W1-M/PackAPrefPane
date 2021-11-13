//
//  Legals.swift
//  
//
//  Created by William Mead on 06/11/2021.
//
// MARK: - Modules
import SwiftUI
// MARK: - Views
struct Legal: View {
    // Variables
    @State private var tosExpanded: Bool = false
    @State private var alertPresented: Bool = false
    @State private var alert: alerts = .disclaimerAlert
    let packAPrefPaneData: PackAPrefPaneData
    enum alerts {
        case disclaimerAlert
        case privacyAlert
        case specialThanksAlert
    }
    // UI
    var body: some View {
        Section(header: Text(NSLocalizedString("❗️ Legal", tableName: "Localizable", bundle: .module, value: "", comment: ""))) {
            if packAPrefPaneData.showDisclaimer {
                Button(action: {
                    alert = alerts.disclaimerAlert
                    alertPresented.toggle()
                }, label: {
                    HStack {
                        Text(NSLocalizedString("Legal disclaimer", tableName: "Localizable", bundle: .module, value: "", comment: ""))
                        Spacer()
                        Image(systemName: "checkmark.shield.fill").imageScale(.large)
                    }
                })
            }
            if packAPrefPaneData.showPrivacyPolicy {
                Button(action: {
                    alert = alerts.privacyAlert
                    alertPresented.toggle()
                }, label: {
                    HStack {
                        Text(NSLocalizedString("Privacy policy", tableName: "Localizable", bundle: .module, value: "", comment: ""))
                        Spacer()
                        Image(systemName: "lock.shield.fill").imageScale(.large)
                    }
                })
            }
            if packAPrefPaneData.showAcknowledgments {
                Button(action: {
                    alert = alerts.specialThanksAlert
                    alertPresented.toggle()
                }, label: {
                    HStack {
                        Text(NSLocalizedString("Acknowledgments", tableName: "Localizable", bundle: .module, value: "", comment: ""))
                        Spacer()
                        Image(systemName: "figure.wave").imageScale(.large)
                    }
                })
            }
            if packAPrefPaneData.showTOS {
                DisclosureGroup(NSLocalizedString("Terms of Service", tableName: "Localizable", bundle: .module, value: "", comment: ""), isExpanded: $tosExpanded) {
                    Text(packAPrefPaneData.termsOfServiceText)
                }
            }
        }
        .alert(isPresented: $alertPresented, content: { // alert switch cases
            switch alert {
            case .disclaimerAlert:
                return Alert(
                    title: Text(NSLocalizedString("Legal disclaimer", tableName: "Localizable", bundle: .module, value: "", comment: "")),
                    message: Text(packAPrefPaneData.disclaimerText),
                    dismissButton: .default(Text("OK")) {
                        // Legal disclaimer accepted
                        // PrefPaneHelper.disclaimerAccepted()
                    }
                )
            case .privacyAlert:
                return Alert(
                    title: Text(NSLocalizedString("Privacy policy", tableName: "Localizable", bundle: .module, value: "", comment: "")),
                    message: Text(packAPrefPaneData.privacyPolicyText),
                    dismissButton: .default(Text("OK"))
                )
            case .specialThanksAlert:
                return Alert(
                    title: Text(NSLocalizedString("Acknowledgments", tableName: "Localizable", bundle: .module, value: "", comment: "")),
                    message: Text(packAPrefPaneData.acknowledgmentsText),
                    dismissButton: .default(Text("OK"))
                )
            }
        })
    }
}
// MARK: - Previews
struct Legal_Previews: PreviewProvider {
    static var previews: some View {
        Form{
            Legal(
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
