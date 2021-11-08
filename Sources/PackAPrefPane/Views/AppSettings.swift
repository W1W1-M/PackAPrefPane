//
//  AppSettings().swift
//  
//
//  Created by William Mead on 06/11/2021.
//
// MARK: - Modules
import SwiftUI
// MARK: - Views
struct AppSettings<Content: View>: View {
    // Variables
    let nestedView: Content // Declare nestedView var with Content type
    init(@ViewBuilder nestedView: () -> Content) { // Custom init with @ViewBuilder
        self.nestedView = nestedView()
    }
    // UI
    var body: some View {
        Section(header: Text("🎛 App settings")) { // Customize this view
            self.nestedView
        }
    }
}
// MARK: - Previews
struct AppSettings_Previews: PreviewProvider {
    static var previews: some View {
        Form {
            AppSettings {
                Toggle(isOn: .constant(true)) {
                    Text("Some very important app setting")
                }
            }
        }.previewLayout(.sizeThatFits)
    }
}
