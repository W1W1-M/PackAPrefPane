//
//  Legals.swift
//  
//
//  Created by William Mead on 06/11/2021.
//
// MARK: - Modules
import SwiftUI
// MARK: - Views
struct Legal: View {
    // Variables
    @State private var alertPresented: Bool = false
    @State private var alert: alerts = .disclaimerAlert
    enum alerts {
        case disclaimerAlert
        case privacyAlert
        case specialThanksAlert
    }
    // UI
    var body: some View {
        Section(header: Text("❗️ Legal")) { // Customize this view
            Button(action: {
                alert = alerts.disclaimerAlert
                alertPresented.toggle()
            }, label: {
                HStack {
                    Text("Legal disclaimer")
                    Spacer()
                    Image(systemName: "checkmark.shield.fill").imageScale(.large)
                }
            })
            Button(action: {
                alert = alerts.privacyAlert
                alertPresented.toggle()
            }, label: {
                HStack {
                    Text("Privacy policy")
                    Spacer()
                    Image(systemName: "lock.shield.fill").imageScale(.large)
                }
            })
            Button(action: {
                alert = alerts.specialThanksAlert
                alertPresented.toggle()
            }, label: {
                HStack {
                    Text("Special Thanks")
                    Spacer()
                    Image(systemName: "figure.wave").imageScale(.large)
                }
            })
        }
        .alert(isPresented: $alertPresented, content: { // alert switch cases
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
            }
        })
    }
}
// MARK: - Previews
struct Legal_Previews: PreviewProvider {
    static var previews: some View {
        Form{
            Legal()
        }.previewLayout(.sizeThatFits)
    }
}
