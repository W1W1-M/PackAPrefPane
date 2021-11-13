//
//  PackAPrefPane.swift
//  PackAPrefPane
//
//  Created by William Mead on 05/11/2021.
//
// MARK: - Modules
import SwiftUI
// MARK: - Views
@available(iOS 14, *)
public struct PackAPrefPane<Content: View>: View {
    // Variables
    public init( // public init for public struct
        settingsSheetPresented: Binding<Bool>,
        packAPrefPaneData: PackAPrefPaneData,
        @ViewBuilder appSettingsView: () -> Content // @ViewBuilder to pass in your app setting view
    ) {
        self._settingsSheetPresented = settingsSheetPresented
        self.packAPrefPaneData = packAPrefPaneData
        self.appSettingsView = appSettingsView()
    }
    @Environment(\.managedObjectContext) private var viewContext
    @Binding var settingsSheetPresented: Bool // Bool to control sheet presentation
    let packAPrefPaneData: PackAPrefPaneData // Your custom data
    let appSettingsView: Content // App settings view from parent view
    // UI
    public var body: some View {
        NavigationView {
            Form {
                // Your nested app settings view section
                appSettingsView
                // Help section
                Help(packAPrefPaneData: packAPrefPaneData)
                // App information section
                AppInfo(packAPrefPaneData: packAPrefPaneData)
                // Legal section
                Legal(packAPrefPaneData: packAPrefPaneData)
            }.navigationTitle(NSLocalizedString("Settings ⚙️", tableName: "Localizable", bundle: .module, value: "", comment: ""))
            .toolbar { // Toolbar with cancel & save buttons
                ToolbarItem(placement: .cancellationAction) {
                    Button(action: {
                        // Cancel and rollback settings
                        // PrefPaneHelper.rollbackSettings()
                        // Close settings sheet
                        settingsSheetPresented.toggle()
                    }, label: {Text(NSLocalizedString("Cancel", tableName: "Localizable", bundle: .module, value: "", comment: ""))})
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button(action: {
                        // Save Settings
                        // PrefPaneHelper.saveSomeSettings()
                        // Set new app settings & user preferences
                        // PrefPaneHelper.setSomeAppSettings()
                        // PrefPaneHelper.setSomeUserPreferences()
                        // Close settings sheet
                        settingsSheetPresented.toggle()
                    }, label: {Text(NSLocalizedString("Save", tableName: "Localizable", bundle: .module, value: "", comment: ""))})
                }
            }
        }.onAppear(perform: { // Using onAppear modifier for loading user defaults
            // Load app settings & user preferences
            // PrefPaneHelper.loadSomeAppSettings()
            // PrefPaneHelper.loadSomeUserPreferences()
            // Check if legal disclaimer accepted else show disclaimer alert
            // PrefPaneHelper.checkLegalDisclaimer()
        })
    }
}
// MARK: - Previews
struct PackAPrefPane_Previews: PreviewProvider {
    static var previews: some View {
        PackAPrefPane(
            settingsSheetPresented: .constant(true),
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
        ) {
            Section(header: Text("🎛 App settings")) {
                Toggle(isOn: .constant(true)) {
                    Text("Some important app setting")
                }
                Toggle(isOn: .constant(false)) {
                    Text("Some other app setting")
                }
            }
        }
    }
}
