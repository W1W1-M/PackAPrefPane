//
//  AppInfo.swift
//  
//
//  Created by William Mead on 05/11/2021.
//
// MARK: - Modules
import SwiftUI
// MARK: - Views
struct AppInfo: View {
    // Variables
    let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    let buildVersion = Bundle.main.infoDictionary?["CFBundleVersion"] as? String
    // UI
    var body: some View {
        Section(header: HStack {
            Text("⚠️ Version \(appVersion ?? "")")
            Spacer()
            Text("\(buildVersion ?? "") Build ⚒")
        }) {
            VStack {
                HStack {
                    Spacer()
                    Text("Designed & Developped in 🇫🇷")
                    Spacer()
                }
                HStack {
                    Spacer()
                    Text("by William Mead")
                    Spacer()
                }
            }.padding(3)
                .font(.callout)
            HStack {
                Spacer()
                Text("Font & Emoji by Apple Inc.")
                Spacer()
            }.font(.callout)
            HStack {
                Spacer()
                Text("Copyright © 2021-2022")
                Spacer()
            }.font(.callout)
        }
    }
}
// MARK: - Previews
struct VersionSection_Previews: PreviewProvider {
    static var previews: some View {
        Form {AppInfo()}
    }
}
