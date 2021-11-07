//
//  AppSettings().swift
//  
//
//  Created by William Mead on 06/11/2021.
//
// MARK: - Modules
import SwiftUI
// MARK: - Views
struct AppSettings: View {
    // Variables
    @State var someAppSetting: Bool = false
    // UI
    var body: some View {
        Section(header: Text("🎛 App settings")) { // Customize this view
            HStack() {
                Toggle(isOn: $someAppSetting) {
                    Text("Some very important app setting")
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
