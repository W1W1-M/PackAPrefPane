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
public struct PackAPrefPane: View {
    // Variables
    public init( // public init for public struct
        settingsSheetPresented: Binding<Bool>,
        developerInfoText: String,
        appCopyrightText: String,
        thirdPartyCode: [ThirdPartyCode]
    ) {
        self._settingsSheetPresented = settingsSheetPresented
        self.developerInfoText = developerInfoText
        self.appCopyrightText = appCopyrightText
        self.thirdPartyCode = thirdPartyCode
    }
    @Environment(\.managedObjectContext) private var viewContext
    @Binding var settingsSheetPresented: Bool // Bool to control sheet presentation
    @State private var alertPresented: Bool = false
    @State private var alert: alerts = .disclaimerAlert
    @State var someAppSetting: Bool = false
    // Help constants from parent view
    
    // AppInfo constants from parent view
    let developerInfoText: String
    let appCopyrightText: String
    let thirdPartyCode: [ThirdPartyCode]
    //
    enum alerts {
        case disclaimerAlert
        case privacyAlert
        case specialThanksAlert
        case supportAlert
    }
    // UI
    public var body: some View {
        NavigationView {
            Form {
                // Primary parameters for app settings
                AppSettings {
                    Toggle(isOn: $someAppSetting) {
                        Text("Some important app setting 1")
                    }
                    Toggle(isOn: $someAppSetting) {
                        Text("Some important app setting 2")
                    }
                }
                // Secondary parameters for user preferences
                UserPreferences()
                // Help section
                Help(
                    alert: $alert,
                    alertPresented: $alertPresented
                )
                // App information section
                AppInfo(
                    developerInfoText: developerInfoText,
                    appCopyrightText: appCopyrightText,
                    thirdPartyCode: thirdPartyCode
                )
                // Legal section
                Legal(
                    alert: $alert,
                    alertPresented: $alertPresented
                )
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
        // alert switch cases
        .alert(isPresented: $alertPresented, content: {
            switch alert {
            case .disclaimerAlert:
                return Alert(
                    title: Text("Legal disclaimer"),
                    message: Text("Use of this app is for informational purposes only. You alone are responsable for the usages you make of this app and you use it at your own risk. We accept no responsability for any damage to users or to their belongings as a result of using this app."),
                    dismissButton: .default(Text("OK")) {
                        // Legal disclaimer accepted
                        // PrefPaneHelper.disclaimerAccepted()
                    }
                )
            case .privacyAlert:
                return Alert(
                    title: Text("Privacy policy"),
                    message: Text("We don't store your data."),
                    dismissButton: .default(Text("OK"))
                )
            case .specialThanksAlert:
                return Alert(
                    title: Text("Special Thanks"),
                    message: Text("Thanks to SwiftUI Jam"),
                    dismissButton: .default(Text("OK"))
                )
            case .supportAlert:
                return Alert(
                    title: Text("Send us an email"),
                    message: Text("youremail@someappdeveloper.com"),
                    dismissButton: .default(Text("OK"))
                )
            }
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
        )
    }
}
