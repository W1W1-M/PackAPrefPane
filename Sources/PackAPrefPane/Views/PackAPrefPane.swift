//
//  PackAPrefPane.swift
//  PackAPrefPane
//
//  Created by William Mead on 05/11/2021.
//
// MARK: - Modules
import SwiftUI
// MARK: - Views
/// Main PackAPrefPane View
///
/// View composed of:
/// - Your nested app settings section view
/// - A ``PackAPrefPane/Help`` section
/// - An ``PackAPrefPane/About`` section
/// - A ``PackAPrefPane/Legal`` section 
@available(macOS 11.0, iOS 14, *)
public struct PackAPrefPane<Content: View>: View {
    // Variables
    /// **PackPrefPane** public initializer for swift package usage
    /// - Parameters:
    ///   - settingsSheetPresented: Boolean passed in from parent to control settings sheet presentation
    ///   - prefPaneData: Your customized **PrefPaneData**
    ///   - appSettingsView: Your custom nested view for dedicated app settings
    public init(
        settingsSheetPresented: Binding<Bool>,
        prefPaneData: PrefPaneData,
        @ViewBuilder appSettingsView: () -> Content // @ViewBuilder to pass in your app setting view
    ) {
        self._settingsSheetPresented = settingsSheetPresented
        self.prefPaneData = prefPaneData
        self.appSettingsView = appSettingsView()
    }
    @Binding var settingsSheetPresented: Bool
    let prefPaneData: PrefPaneData
    let appSettingsView: Content
    // UI
    public var body: some View {
        NavigationView {
            Form {
                appSettingsView
                Help(helpSectionData: prefPaneData.helpSectionData)
                About(aboutSectionData: prefPaneData.aboutSectionData)
                Legal(legalSectionData: prefPaneData.legalSectionData)
            }.navigationTitle(NSLocalizedString("Settings ⚙️", tableName: "Localizable", bundle: .module, value: "", comment: ""))
            .toolbar { // Toolbar with close button
                ToolbarItem(placement: .navigation) {
                    Button(action: {
                        // Close settings sheet
                        settingsSheetPresented.toggle()
                    }, label: {Text(NSLocalizedString("Close", tableName: "Localizable", bundle: .module, value: "", comment: ""))})
                }
            }
        }
    }
}
// MARK: - Previews
@available(macOS 11.0, iOS 14, *)
struct PackAPrefPane_Previews: PreviewProvider {
    static var previews: some View {
        PackAPrefPane(
            settingsSheetPresented: .constant(true),
            prefPaneData: PrefPaneData(
                helpSectionData: HelpSectionData(
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
                    ]
                ),
                aboutSectionData: AboutSectionData(
                    developerInfoText: "Designed & Developped in 🏴‍☠️ \n by a super dev",
                    appCopyrightText: "Your app Copyright © 2021-2022",
                    thirdPartyCode: [
                        ThirdPartyCode(
                            sourceNameText: "Font & Emoji by Apple Inc.",
                            sourceURLText: "https://developer.apple.com/fonts",
                            sourceLicenseText: "Copyright © All rights reserved"
                        )
                    ]
                ),
                legalSectionData: LegalSectionData(
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
        ) {
            Section(header: Text("🎛 Your nested App settings view")) {
                Toggle(isOn: .constant(true)) {
                    Text("Your nested app setting")
                }
                Toggle(isOn: .constant(false)) {
                    Text("Your other nested setting")
                }
            }
        }
    }
}
