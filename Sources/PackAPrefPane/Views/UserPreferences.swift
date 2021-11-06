//
//  AppSettings.swift
//  
//
//  Created by William Mead on 06/11/2021.
//
// MARK: - Modules
import SwiftUI
// MARK: - Views
struct AppSettings: View {
    // Variables
    @State var someUserPreference: Bool = false
    // UI
    var body: some View {
        Section(header: Text("🎚 User Preferences")) { // Customize this view
            HStack() {
                Toggle(isOn: $someUserPreference) {
                    Text("An important user preference")
                }
            }
        }
    }
}
// MARK: - Previews
struct AppSettings_Previews: PreviewProvider {
    static var previews: some View {
        Form{AppSettings()}.previewLayout(.sizeThatFits)
    }
}
