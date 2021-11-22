//
//  About.swift
//  
//
//  Created by William Mead on 05/11/2021.
//
// MARK: - Modules
import SwiftUI
// MARK: - Views
@available(macOS 11.0, iOS 14, *)
struct About: View {
    // Variables
    let prefPaneData: PrefPaneData
    // UI
    var body: some View {
        AppInfo(prefPaneData: prefPaneData)
        ThirdPartyCodeList(prefPaneData: prefPaneData)
    }
}
// MARK: - AppInfo
@available(macOS 11.0, iOS 14, *)
struct AppInfo: View {
    // Variables
    let prefPaneData: PrefPaneData
    let appVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
    let buildVersion = Bundle.main.infoDictionary!["CFBundleVersion"] as! String
    // UI
    var body: some View {
        Section(header: HStack {
            Text("⚠️ Version \(appVersion)")
            Spacer()
            Text("\(buildVersion) Build ⚒")
        }) {
            VStack {
                HStack {
                    Spacer()
                    Text(NSLocalizedString(prefPaneData.developerInfoText, tableName: "Localizable", bundle: .main, value: "", comment: "")).multilineTextAlignment(.center)
                    Spacer()
                }
            }.padding(3)
            .font(.callout)
            HStack {
                Spacer()
                Text(NSLocalizedString(prefPaneData.appCopyrightText, tableName: "Localizable", bundle: .main, value: "", comment: "")).multilineTextAlignment(.center)
                Spacer()
            }.font(.callout)
        }
    }
}
// MARK: - ThirdParyCodeList
@available(macOS 11.0, iOS 14, *)
struct ThirdPartyCodeList: View {
    // Variables
    @State var thirdPartyCodeExpanded: Bool = false
    let prefPaneData: PrefPaneData
    // UI
    var body: some View {
        Section {
            DisclosureGroup(NSLocalizedString("Third-Party Code", tableName: "Localizable", bundle: .module, value: "", comment: ""), isExpanded: $thirdPartyCodeExpanded) {
                List {
                    ForEach(prefPaneData.thirdPartyCode) { ThirdPartyCode in
                        ThirdPartyCodeItem(thirdPartyCode: ThirdPartyCode)
                    }
                }
            }
        }
    }
}
// MARK: - ThirdPartyCodeItem
@available(macOS 11.0, iOS 14, *)
struct ThirdPartyCodeItem: View {
    // Variables
    let thirdPartyCode: ThirdPartyCode
    // UI
    var body: some View {
        VStack {
            HStack {
                Text(NSLocalizedString(thirdPartyCode.sourceNameText, tableName: "Localizable", bundle: .main, value: "", comment: "")).font(.headline)
                Spacer()
            }
            Spacer()
            HStack {
                Link(
                    thirdPartyCode.sourceURLText.replacingOccurrences(of: "https://", with: ""),
                    destination: URL(string: thirdPartyCode.sourceURLText)!
                )
                    .font(.callout)
                    .foregroundColor(.accentColor)
                Spacer()
            }
            Spacer()
            HStack {
                Spacer()
                Text(NSLocalizedString(thirdPartyCode.sourceLicenseText, tableName: "Localizable", bundle: .main, value: "", comment: "")).font(.subheadline)
            }
        }
    }
}
// MARK: - Previews
@available(macOS 11.0, iOS 14, *)
struct About_Previews: PreviewProvider {
    static var previews: some View {
        Form {
            About(
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
