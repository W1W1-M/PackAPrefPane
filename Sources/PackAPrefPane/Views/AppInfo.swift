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
        Section(header: HStack { // Customize this view
            Text("⚠️ Version \(appVersion)")
            Spacer()
            Text("\(buildVersion) Build ⚒")
        }) {
            VStack {
                HStack {
                    Spacer()
                    Text("Designed & Developped in 🏴‍☠️")
                    Spacer()
                }
                HStack {
                    Spacer()
                    Text("by a super dev")
                    Spacer()
                }
            }.padding(3)
            .font(.callout)
            HStack {
                Spacer()
                Text("Your app Copyright © 2021-2022")
                Spacer()
            }.font(.callout)
        }
        DisclosureGroup("Third-Party Code", isExpanded: $thirdPartyCodeExpanded) {
            VStack {
                HStack {
                    Text("PackAPrefPane by W1W1-M").font(.headline)
                    Spacer()
                }
                Spacer()
                HStack {
                    Link("github.com/W1W1-M/PackAPrefPane", destination: URL(string: "https://github.com/W1W1-M/PackAPrefPane")!)
                        .font(.callout)
                        .foregroundColor(.accentColor)
                    Spacer()
                }
                Spacer()
                HStack {
                    Spacer()
                    Text("MIT license").font(.subheadline)
                }
            }
            VStack {
                HStack {
                    Text("Font & Emoji by Apple Inc.").font(.headline)
                    Spacer()
                }
                Spacer()
                HStack {
                    Link("developer.apple.com/fonts", destination: URL(string: "https://developer.apple.com/fonts")!)
                        .font(.callout)
                        .foregroundColor(.accentColor)
                    Spacer()
                }
                Spacer()
                HStack {
                    Spacer()
                    Text("Copyright © All rights reserved").font(.subheadline)
                }
            }
            VStack {
                HStack {
                    Text("Some Third-Party software").font(.headline)
                    Spacer()
                }
                Spacer()
                HStack {
                    Link("github.com", destination: URL(string: "https://github.com")!)
                        .font(.callout)
                        .foregroundColor(.accentColor)
                    Spacer()
                }
                Spacer()
                HStack {
                    Spacer()
                    Text("some license").font(.subheadline)
                }
            }
        }
    }
}
// MARK: - Previews
struct VersionSection_Previews: PreviewProvider {
    static var previews: some View {
        Form {AppInfo()}.previewLayout(.sizeThatFits)
    }
}
