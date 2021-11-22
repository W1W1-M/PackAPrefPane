//
//  Legals.swift
//  
//
//  Created by William Mead on 06/11/2021.
//
// MARK: - Modules
import SwiftUI
// MARK: - Views
@available(macOS 11.0, iOS 14, *)
struct Legal: View {
    // Variables
    @State private var alertPresented: Bool = false
    @State private var alert: alerts = .disclaimerAlert
    let prefPaneData: PrefPaneData
    enum alerts {
        case disclaimerAlert
        case privacyAlert
        case acknowledgments
    }
    // UI
    var body: some View {
        if prefPaneData.showLegalSection {
            Section(header: Text(NSLocalizedString("❗️ Legal", tableName: "Localizable", bundle: .module, value: "", comment: ""))) {
                if prefPaneData.showDisclaimer {
                    Disclaimer(
                        alertPresented: $alertPresented,
                        alert: $alert,
                        prefPaneData: prefPaneData
                    )
                }
                if prefPaneData.showPrivacyPolicy {
                    PrivacyPolicy(
                        alertPresented: $alertPresented,
                        alert: $alert,
                        prefPaneData: prefPaneData
                    )
                }
                if prefPaneData.showAcknowledgments {
                    Acknowledgments(alertPresented: $alertPresented, alert: $alert)
                }
                if prefPaneData.showTOS {
                    TermsOfService(prefPaneData: prefPaneData)
                }
            }.alert(isPresented: $alertPresented, content: { // alert switch cases
                switch alert {
                case .disclaimerAlert:
                    return Alert(
                        title: Text(NSLocalizedString("Legal disclaimer", tableName: "Localizable", bundle: .module, value: "", comment: "")),
                        message: Text(NSLocalizedString(prefPaneData.disclaimerText, tableName: "Localizable", bundle: .main, value: "", comment: "")),
                        dismissButton: .default(Text("OK")) {
                            if prefPaneData.disclaimerAcceptedCheck {
                                PrefPaneHelper.acceptDisclaimer(
                                    disclaimerAcceptedDefaultsKey: prefPaneData.disclaimerAcceptedDefaultsKey,
                                    disclaimerAcceptedDateDefaultsKey: prefPaneData.disclaimerAcceptedDateDefaultsKey
                                )
                            }
                        }
                    )
                case .privacyAlert:
                    return Alert(
                        title: Text(NSLocalizedString("Privacy policy", tableName: "Localizable", bundle: .module, value: "", comment: "")),
                        message: Text(NSLocalizedString(prefPaneData.privacyPolicyText, tableName: "Localizable", bundle: .main, value: "", comment: "")),
                        dismissButton: .default(Text("OK")) {
                            if prefPaneData.privacyPolicyAcceptedCheck {
                                PrefPaneHelper.acceptPrivacyPolicy(
                                    privacyPolicyAcceptedDefaultsKey: prefPaneData.privacyPolicyAcceptedDefaultsKey,
                                    privacyPolicyAcceptedDateDefaultsKey: prefPaneData.privacyPolicyAcceptedDateDefaultsKey
                                )
                            }
                        }
                    )
                case .acknowledgments:
                    return Alert(
                        title: Text(NSLocalizedString("Acknowledgments", tableName: "Localizable", bundle: .module, value: "", comment: "")),
                        message: Text(NSLocalizedString(prefPaneData.acknowledgmentsText, tableName: "Localizable", bundle: .main, value: "", comment: "")),
                        dismissButton: .default(Text("OK"))
                    )
                }
        })
        }
    }
}
// MARK: - Disclaimer
@available(macOS 11.0, iOS 14, *)
struct Disclaimer: View {
    // Variables
    @Binding var alertPresented: Bool
    @Binding var alert: Legal.alerts
    let prefPaneData: PrefPaneData
    // UI
    var body: some View {
        Button(action: {
            alert = Legal.alerts.disclaimerAlert
            alertPresented.toggle()
        }, label: {
            HStack {
                Text(NSLocalizedString("Legal disclaimer", tableName: "Localizable", bundle: .module, value: "", comment: ""))
                Spacer()
                if prefPaneData.disclaimerAcceptedCheck {
                    if UserDefaults.standard.bool(forKey: prefPaneData.disclaimerAcceptedDefaultsKey) {
                        Image(systemName: "checkmark.shield.fill").imageScale(.large)
                    } else {
                        Image(systemName: "checkmark.shield").imageScale(.large)
                    }
                } else {
                    Image(systemName: "checkmark.shield").imageScale(.large)
                }
            }
        })
    }
}
// MARK: - PrivacyPolicy
@available(macOS 11.0, iOS 14, tvOS 14, watchOS 7, *)
struct PrivacyPolicy: View {
    // Variables
    @Binding var alertPresented: Bool
    @Binding var alert: Legal.alerts
    let prefPaneData: PrefPaneData
    // UI
    var body: some View {
        Button(action: {
            alert = Legal.alerts.privacyAlert
            alertPresented.toggle()
        }, label: {
            HStack {
                Text(NSLocalizedString("Privacy policy", tableName: "Localizable", bundle: .module, value: "", comment: ""))
                Spacer()
                if prefPaneData.privacyPolicyAcceptedCheck {
                    if UserDefaults.standard.bool(forKey: prefPaneData.privacyPolicyAcceptedDefaultsKey) {
                        Image(systemName: "lock.shield.fill").imageScale(.large)
                    } else {
                        Image(systemName: "lock.shield").imageScale(.large)
                    }
                } else {
                    Image(systemName: "lock.shield").imageScale(.large)
                }
                
            }
        })
    }
}
// MARK: - Acknowledgments
@available(macOS 11.0, iOS 14, tvOS 14, watchOS 7, *)
struct Acknowledgments: View {
    // Variables
    @Binding var alertPresented: Bool
    @Binding var alert: Legal.alerts
    // UI
    var body: some View {
        Button(action: {
            alert = Legal.alerts.acknowledgments
            alertPresented.toggle()
        }, label: {
            HStack {
                Text(NSLocalizedString("Acknowledgments", tableName: "Localizable", bundle: .module, value: "", comment: ""))
                Spacer()
                Image(systemName: "figure.wave").imageScale(.large)
            }
        })
    }
}
// MARK: - TermsOfService
@available(macOS 11.0, iOS 14, tvOS 14, watchOS 7, *)
struct TermsOfService: View {
    // Variables
    @State private var tosExpanded: Bool = false
    let prefPaneData: PrefPaneData
    // UI
    var body: some View {
        DisclosureGroup(NSLocalizedString("Terms of Service", tableName: "Localizable", bundle: .module, value: "", comment: ""), isExpanded: $tosExpanded) {
            Text(prefPaneData.termsOfServiceText)
        }
    }
}
// MARK: - Previews
@available(macOS 11.0, iOS 14, tvOS 14, watchOS 7, *)
struct Legal_Previews: PreviewProvider {
    static var previews: some View {
        Form{
            Legal(
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
