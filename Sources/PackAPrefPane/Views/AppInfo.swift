//
//  AppInfo.swift
//  
//
//  Created by William Mead on 05/11/2021.
//
// MARK: - Modules
import SwiftUI
// MARK: - Views
struct AppInfo: View {
    // Variables
    @State var thirdPartyCodeExpanded: Bool = false
    let packAPrefPaneData: PackAPrefPaneData
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
                    Text(packAPrefPaneData.developerInfoText).multilineTextAlignment(.center)
                    Spacer()
                }
            }.padding(3)
            .font(.callout)
            HStack {
                Spacer()
                Text(packAPrefPaneData.appCopyrightText).multilineTextAlignment(.center)
                Spacer()
            }.font(.callout)
        }
        DisclosureGroup("Third-Party Code", isExpanded: $thirdPartyCodeExpanded) {
            ForEach(packAPrefPaneData.thirdPartyCode) { ThirdPartyCode in
                VStack {
                    HStack {
                        Text(ThirdPartyCode.sourceNameText).font(.headline)
                        Spacer()
                    }
                    Spacer()
                    HStack {
                        Link(
                            ThirdPartyCode.sourceURLText.replacingOccurrences(of: "https://", with: ""),
                            destination: URL(string: ThirdPartyCode.sourceURLText)!
                        )
                            .font(.callout)
                            .foregroundColor(.accentColor)
                        Spacer()
                    }
                    Spacer()
                    HStack {
                        Spacer()
                        Text(ThirdPartyCode.sourceLicenseText).font(.subheadline)
                    }
                }
            }
        }
    }
}
// MARK: - Previews
struct AppInfo_Previews: PreviewProvider {
    static var previews: some View {
        Form {
            AppInfo(
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
                    showSpecialThanks: true,
                    disclaimerText: "Use of this app is for informational purposes only. You alone are responsable for the usages you make of this app and you use it at your own risk. We accept no responsability for any damage to users or to their belongings as a result of using this app.",
                    privacyPolicyText: "We don't store your data.",
                    specialThanksText: "Thanks to SwiftUI Jam"
                )
            )
        }.previewLayout(.sizeThatFits)
    }
}
