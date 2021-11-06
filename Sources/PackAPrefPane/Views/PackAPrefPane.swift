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
public struct PackAPrefPane: View {
    // MARK: -  Variables
    public init(settingsSheetPresented: Binding<Bool>) {
        self._settingsSheetPresented = settingsSheetPresented
    }
    @Environment(\.managedObjectContext) private var viewContext
    @Binding var settingsSheetPresented: Bool
    @State private var alertPresented: Bool = false
    @State private var alert: alerts = .disclaimerAlert
    enum alerts {
        case disclaimerAlert
        case privacyAlert
        case specialThanksAlert
        case supportAlert
    }
    // MARK: -  UI
    public var body: some View {
        NavigationView {
            Form {
                // Primary parameters for app settings
                AppSettings()
                // Secondary parameters for user preferences
                UserPreferences()
                // Help section
                Help(
                    alert: $alert,
                    alertPresented: $alertPresented
                )
                // App information section
                AppInfo()
                // Legal section
                Legal(
                    alert: $alert,
                    alertPresented: $alertPresented
                )
            }.navigationTitle("Settings ⚙️")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(action: {
                        // Cancel and rollback settings
                        // Helper.rollbackSettings()
                        // Close settings sheet
                        settingsSheetPresented.toggle()
                    }, label: {Text("Cancel")})
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button(action: {
                        // Save Settings
                        // Helper.saveSomeSettings()
                        // Set new app settings & user preferences
                        // Helper.setSomeAppSettings()
                        // Helper.setSomeUserPreferences()
                        // Close settings sheet
                        settingsSheetPresented.toggle()
                    }, label: {Text("Save")})
                }
            }
        }.onAppear(perform: {
            // Load app settings & user preferences
            // HelperClass.loadSomeAppSettings()
            // HelperClass.loadSomeUserPreferences()
            // Check if legal disclaimer accepted else show disclaimer alert
            if(UserDefaults.standard.bool(forKey: "DisclaimerAccepted") == false) {
                alert = .disclaimerAlert
                alertPresented.toggle()
            }
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
                        UserDefaults.standard.set(true, forKey: "DisclaimerAccepted")
                    }
                )
            case .privacyAlert:
                return Alert(
                    title: Text("Privacy policy"),
                    message: Text("We don't store your data, The End."),
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
                    message: Text("w1w1_m@icloud.com"),
                    dismissButton: .default(Text("OK"))
                )
            }
        })
    }
}
// MARK: - Previews
struct PackAPrefPane_Previews: PreviewProvider {
    static var previews: some View {
        PackAPrefPane(settingsSheetPresented: .constant(true))
    }
}
