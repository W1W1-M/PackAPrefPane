//
//  UserPreferences.swift
//  
//
//  Created by William Mead on 06/11/2021.
//
// MARK: - Modules
import SwiftUI
// MARK: - Views
struct UserPreferences: View {
    // Variables
    @State var someAppSetting: Bool = false
    // UI
    var body: some View {
        Section(header: Text("🎛 App settings")) {
            HStack() {
                Toggle(isOn: $someAppSetting) {
                    Text("Some very important app setting")
                }
            }
        }
    }
}
// MARK: - Previews
struct UserPreferences_Previews: PreviewProvider {
    static var previews: some View {
        Form{UserPreferences()}.previewLayout(.sizeThatFits)
    }
}
