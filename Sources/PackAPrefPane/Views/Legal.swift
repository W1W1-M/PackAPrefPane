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
    @Binding var alert: PackAPrefPane.alerts
    @Binding var alertPresented: Bool
    // UI
    var body: some View {
        Section(header: Text("❗️ Legal")) { // Customize this view
            Button(action: {
                alert = PackAPrefPane.alerts.disclaimerAlert
                alertPresented.toggle()
            }, label: {
                HStack {
                    Text("Legal disclaimer")
                    Spacer()
                    Image(systemName: "checkmark.shield.fill").imageScale(.large)
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
struct Legal_Previews: PreviewProvider {
    static var previews: some View {
        Form{
            Legal(
                alert: .constant(PackAPrefPane.alerts.disclaimerAlert),
                alertPresented: .constant(false)
            )
        }.previewLayout(.sizeThatFits)
    }
}
