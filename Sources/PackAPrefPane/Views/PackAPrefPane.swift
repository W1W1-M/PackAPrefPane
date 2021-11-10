//
//  PackAPrefPane.swift
//  PackAPrefPane
//
//  Created by William Mead on 05/11/2021.
//
// MARK: - Modules
import SwiftUI
// Custom type for third party code info
public struct ThirdPartyCode: Identifiable {
    public let id = UUID()
    let sourceNameText: String
    let sourceURLText: String
    let sourceLicenseText: String
}
// MARK: - Views
@available(iOS 14, *)
public struct PackAPrefPane<Content: View>: View {
    // Variables
    public init( // public init for public struct
        settingsSheetPresented: Binding<Bool>,
        developerInfoText: String,
        appCopyrightText: String,
        thirdPartyCode: [ThirdPartyCode],
        @ViewBuilder appSettingsView: () -> Content // @ViewBuilder to pass in your app setting view
    ) {
        self._settingsSheetPresented = settingsSheetPresented
        self.developerInfoText = developerInfoText
        self.appCopyrightText = appCopyrightText
        self.thirdPartyCode = thirdPartyCode
        self.appSettingsView = appSettingsView()
    }
    @Environment(\.managedObjectContext) private var viewContext
    @Binding var settingsSheetPresented: Bool // Bool to control sheet presentation
    
    // App settings view from parent view
    let appSettingsView: Content
    // Help constants from parent view
    
    // AppInfo constants from parent view
    let developerInfoText: String
    let appCopyrightText: String
    let thirdPartyCode: [ThirdPartyCode]
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
                    developerInfoText: developerInfoText,
                    appCopyrightText: appCopyrightText,
                    thirdPartyCode: thirdPartyCode
                )
                // Legal section
                Legal()
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
            ]
        ) {
            Section(header: Text("🎛 App settings")) {
                Text("Some important app setting")
            }
        }
    }
}
