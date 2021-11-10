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
                // Your nested app settings view
                appSettingsView
                // Help section
                Help()
                // App information section
                AppInfo(
                    developerInfoText: packAPrefPaneData.developerInfoText,
                    appCopyrightText: packAPrefPaneData.appCopyrightText,
                    thirdPartyCode: packAPrefPaneData.thirdPartyCode
                )
                // Legal section
                Legal(
                    disclaimerText: packAPrefPaneData.disclaimerText,
                    privacyPolicyText: packAPrefPaneData.privacyPolicyText,
                    specialThanksText: packAPrefPaneData.specialThanksText)
            }.navigationTitle("Settings ⚙️")
            .toolbar { // Toolbar with cancel & save buttons
                ToolbarItem(placement: .cancellationAction) {
                    Button(action: {
                        // Cancel and rollback settings
                        // PrefPaneHelper.rollbackSettings()
                        // Close settings sheet
                        settingsSheetPresented.toggle()
                    }, label: {Text("Cancel")})
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
                    }, label: {Text("Save")})
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
                disclaimerText: "Use of this app is for informational purposes only. You alone are responsable for the usages you make of this app and you use it at your own risk. We accept no responsability for any damage to users or to their belongings as a result of using this app.",
                privacyPolicyText: "We don't store your data.",
                specialThanksText: "Thanks to SwiftUI Jam"
            )
        ) {
            Section(header: Text("🎛 App settings")) {
                Text("Some important app setting")
            }
        }
    }
}
