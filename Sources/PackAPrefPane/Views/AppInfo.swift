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
    let developerInfoText: String
    let appCopyrightText: String
    let thirdPartyCode: [ThirdPartyCode]
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
                    Text(developerInfoText).multilineTextAlignment(.center)
                    Spacer()
                }
            }.padding(3)
            .font(.callout)
            HStack {
                Spacer()
                Text(appCopyrightText).multilineTextAlignment(.center)
                Spacer()
            }.font(.callout)
        }
        DisclosureGroup("Third-Party Code", isExpanded: $thirdPartyCodeExpanded) {
            ForEach(thirdPartyCode) { ThirdPartyCode in
                VStack {
                    HStack {
                        Text(ThirdPartyCode.sourceNameText).font(.headline)
                        Spacer()
                    }
                    Spacer()
                    HStack {
                        Link(
                            ThirdPartyCode.sourceURLText.replacingOccurrences(of: "https://", with: ""),
                            destination: URL(string: ThirdPartyCode.sourceURLText)!
                        )
                            .font(.callout)
                            .foregroundColor(.accentColor)
                        Spacer()
                    }
                    Spacer()
                    HStack {
                        Spacer()
                        Text(ThirdPartyCode.sourceLicenseText).font(.subheadline)
                    }
                }
            }
        }
    }
}
// MARK: - Previews
struct VersionSection_Previews: PreviewProvider {
    static var previews: some View {
        Form {
            AppInfo(
                developerInfoText: "Designed & Developped in 🏴‍☠️ \n by a super dev",
                appCopyrightText: "Your app Copyright © 2021-2022",
                thirdPartyCode: [
                    ThirdPartyCode(
                        sourceNameText: "PackAPrefPane by W1W1-M",
                        sourceURLText: "https://github.com/W1W1-M/PackAPrefPane",
                        sourceLicenseText: "MIT license"
                    ),
                    ThirdPartyCode(
                        sourceNameText: "Font & Emoji by Apple Inc.",
                        sourceURLText: "https://developer.apple.com/fonts",
                        sourceLicenseText: "Copyright © All rights reserved"
                    )
                ]
            )
        }.previewLayout(.sizeThatFits)
    }
}
