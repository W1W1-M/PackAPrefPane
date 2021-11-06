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
    @State var thirdPartyCodeExpanded: Bool = false
    let appVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
    let buildVersion = Bundle.main.infoDictionary!["CFBundleVersion"] as! String
    // UI
    var body: some View {
        Section(header: HStack {
            Text("⚠️ Version \(appVersion)")
            Spacer()
            Text("\(buildVersion) Build ⚒")
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
        DisclosureGroup("Third-Party Code", isExpanded: $thirdPartyCodeExpanded) {
            VStack {
                HStack {
                    Text("PackAPrefPane v1.0").font(.headline)
                    Spacer()
                }
                Spacer()
                HStack {
                    Link("Github source code link", destination: URL(string: "https://github.com/W1W1-M/PackAPrefPane")!).foregroundColor(.accentColor)
                    Spacer()
                }
            }.foregroundColor(.primary)
            VStack {
                HStack {
                    Text("Some third party software vX.x").font(.headline)
                    Spacer()
                }
                Spacer()
                HStack {
                    Link("Source code link", destination: URL(string: "https://github.com")!).foregroundColor(.accentColor)
                    Spacer()
                }
            }.foregroundColor(.primary)
        }.foregroundColor(.accentColor)
    }
}
// MARK: - Previews
struct VersionSection_Previews: PreviewProvider {
    static var previews: some View {
        Form {AppInfo()}.previewLayout(.sizeThatFits)
    }
}
