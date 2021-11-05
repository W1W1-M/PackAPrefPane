//
//  PackAPrefPane.swift
//  PackAPrefPane
//
//  Created by William Mead on 05/11/2021.
//
// MARK: - Modules
import SwiftUI
// MARK: - Views
public struct PackAPrefPane: View {
    // MARK: -  Variables
    public init(settingsSheetPresented: Binding<Bool>) {
        self._settingsSheetPresented = settingsSheetPresented
    }
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.locale) var locale: Locale
    @Binding var settingsSheetPresented: Bool
    @State private var alertPresented: Bool = false
    @State private var disclaimerAlert: Bool = false
    @State private var privacyAlert: Bool = false
    @State private var supportAlert: Bool = false
    @State private var metricSystem: Bool = true
    @State private var alert: alerts = .disclaimerAlert
    @State private var decimalFuelQuantity: Bool = false
    @AppStorage("MeasurementSystemSymbol") var measurementSystemSymbol: String?
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
                Section(header: Text("🎛 App settings")) {
                    HStack() {
                        Toggle(isOn: $alertPresented) {
                            Text("Some very important app setting")
                        }
                    }
                }
                Section(header: Text("🎚 User Preferences")) {
                    HStack() {
                        Toggle(isOn: $alertPresented) {
                            Text("An important user preference")
                        }
                    }
                }
                HelpSection(
                    alert: $alert,
                    alertPresented: $alertPresented
                )
                AppInfo()
                LegalSection(
                    alert: $alert,
                    alertPresented: $alertPresented
                )
            }.navigationTitle("Settings ⚙️")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(action: {
                        // Cancel and rollback settings
                        // viewContext.rollback()
                        // Close settings sheet
                        settingsSheetPresented.toggle()
                    }, label: {Text("Cancel")})
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button(action: {
                        // Save Settings
                        // Helper.saveContext(viewContext: viewContext)
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
                    title: Text("Send me an email"),
                    message: Text("w1w1_m@icloud.com"),
                    dismissButton: .default(Text("OK"))
                )
            }
        })
    }
}
// MARK: - Help Section
struct HelpSection: View {
    // Variables
    @Binding var alert: PackAPrefPane.alerts
    @Binding var alertPresented: Bool
    @State private var faqExpanded: Bool = false
    // UI
    var body: some View {
        Section(header: Text("⛑ Help")) {
            Button(action: {
                // Helper.requestAppFeedback()
            }, label: {
                HStack {
                    Text("Feedback")
                    Spacer()
                    Image(systemName: "plus.bubble.fill").imageScale(.large)
                }
            })
            Button(action: {
                alert = PackAPrefPane.alerts.supportAlert
                alertPresented.toggle()
            }, label: {
                HStack {
                    Text("Support")
                    Spacer()
                    Image(systemName: "cross.case.fill").imageScale(.large)
                }
            })
            Button(action: {
                alert = PackAPrefPane.alerts.supportAlert
                alertPresented.toggle()
            }, label: {
                HStack {
                    Text("What's new ?")
                    Spacer()
                    Image(systemName: "newspaper.fill").imageScale(.large)
                }
            })
            DisclosureGroup("FAQ", isExpanded: $faqExpanded) {
                VStack {
                    HStack {
                        Text("Q.1: How is the thing calculated ?").font(.headline)
                        Spacer()
                    }
                    Spacer()
                    HStack {
                        Text("A.1: The thing's percentage is calculated by dividing the combined amount of this from each of that by the total quantity of those.")
                        Spacer()
                    }
                }.foregroundColor(.primary)
                VStack {
                    HStack {
                        Text("Q.2: What % of this can I use ?").font(.headline)
                        Spacer()
                    }
                    Spacer()
                    HStack {
                        Text("A.2: Those can tolerate a small percentage of that in the these. Please enquire by your own means beforehand.")
                        Spacer()
                    }
                }.foregroundColor(.primary)
                VStack {
                    HStack {
                        Text("Q.3: How are those calculated ?").font(.headline)
                        Spacer()
                    }
                    Spacer()
                    HStack {
                        Text("A.3: Things are the difference between the total amount of the that using this and the same if only this was used.")
                        Spacer()
                    }
                }.foregroundColor(.primary)
            }.foregroundColor(.accentColor)
        }
    }
}
// MARK: - Legal Section
struct LegalSection: View {
    // Variables
    @Binding var alert: PackAPrefPane.alerts
    @Binding var alertPresented: Bool
    // UI
    var body: some View {
        Section(header: Text("❗️ Legal")) {
            Button(action: {
                alert = PackAPrefPane.alerts.disclaimerAlert
                alertPresented.toggle()
            }, label: {
                HStack {
                    Text("Legal disclaimer")
                    Spacer()
                    if(UserDefaults.standard.bool(forKey: "DisclaimerAccepted") == true) {
                        Image(systemName: "checkmark.shield.fill").imageScale(.large)
                    } else if(UserDefaults.standard.bool(forKey: "DisclaimerAccepted") == false) {
                        Image(systemName: "checkmark.shield").imageScale(.large)
                    }
                }
            })
            Button(action: {
                alert = PackAPrefPane.alerts.privacyAlert
                alertPresented.toggle()
            }, label: {
                HStack {
                    Text("Privacy policy")
                    Spacer()
                    Image(systemName: "lock.shield.fill").imageScale(.large)
                }
            })
            Button(action: {
                alert = PackAPrefPane.alerts.specialThanksAlert
                alertPresented.toggle()
            }, label: {
                HStack {
                    Text("Special Thanks")
                    Spacer()
                    Image(systemName: "figure.wave").imageScale(.large)
                }
            })
        }
    }
}
// MARK: - Previews
struct PackAPrefPane_Previews: PreviewProvider {
    static var previews: some View {
        PackAPrefPane(settingsSheetPresented: .constant(true))
    }
}
