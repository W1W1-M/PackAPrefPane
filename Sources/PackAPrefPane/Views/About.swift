//
//  About.swift
//  
//
//  Created by William Mead on 05/11/2021.
//
// MARK: - Modules
import SwiftUI
// MARK: - Views
/// About section View using ``AboutSectionData``
@available(macOS 11.0, iOS 14, *)
public struct About: View {
    // Variables
    let aboutSectionData: AboutSectionData
    // UI
    public var body: some View {
        AppInfo(aboutSectionData: aboutSectionData)
        ThirdPartyCodeList(thirdPartyCode: aboutSectionData.thirdPartyCode)
    }
}
// MARK: - AppInfo
@available(macOS 11.0, iOS 14, *)
struct AppInfo: View {
    // Variables
    let aboutSectionData: AboutSectionData
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
                    Text(NSLocalizedString(aboutSectionData.developerInfoText, tableName: "Localizable", bundle: .main, value: "", comment: "")).multilineTextAlignment(.center)
                    Spacer()
                }
            }.padding(3)
            .font(.callout)
            HStack {
                Spacer()
                Text(NSLocalizedString(aboutSectionData.appCopyrightText, tableName: "Localizable", bundle: .main, value: "", comment: "")).multilineTextAlignment(.center)
                Spacer()
            }.font(.callout)
        }
    }
}
// MARK: - ThirdParyCodeList
@available(macOS 11.0, iOS 14, *)
struct ThirdPartyCodeList: View {
    // Variables
    @State var thirdPartyCodeExpanded: Bool = false
    let thirdPartyCode: [ThirdPartyCode]
    // UI
    var body: some View {
        Section {
            DisclosureGroup(NSLocalizedString("Third-Party Code", tableName: "Localizable", bundle: .module, value: "", comment: ""), isExpanded: $thirdPartyCodeExpanded) {
                List {
                    ForEach(thirdPartyCode) { ThirdPartyCode in
                        ThirdPartyCodeItem(thirdPartyCodeItem: ThirdPartyCode)
                    }
                }
            }
        }
    }
}
// MARK: - ThirdPartyCodeItem
@available(macOS 11.0, iOS 14, *)
struct ThirdPartyCodeItem: View {
    // Variables
    let thirdPartyCodeItem: ThirdPartyCode
    // UI
    var body: some View {
        VStack {
            HStack {
                Text(NSLocalizedString(thirdPartyCodeItem.sourceNameText, tableName: "Localizable", bundle: .main, value: "", comment: "")).font(.headline)
                Spacer()
            }
            Spacer()
            HStack {
                Link(
                    thirdPartyCodeItem.sourceURLText.replacingOccurrences(of: "https://", with: ""),
                    destination: URL(string: thirdPartyCodeItem.sourceURLText)!
                )
                    .font(.callout)
                    .foregroundColor(.accentColor)
                Spacer()
            }
            Spacer()
            HStack {
                Spacer()
                Text(NSLocalizedString(thirdPartyCodeItem.sourceLicenseText, tableName: "Localizable", bundle: .main, value: "", comment: "")).font(.subheadline)
            }
        }
    }
}
// MARK: - Previews
@available(macOS 11.0, iOS 14, *)
struct About_Previews: PreviewProvider {
    static var previews: some View {
        Form {
            About(aboutSectionData: AboutSectionData(
                    developerInfoText: "Designed & Developped in 🏴‍☠️ \n by a super dev",
                    appCopyrightText: "Your app Copyright © 2021-2022",
                    thirdPartyCode: [
                        ThirdPartyCode(
                            sourceNameText: "Font & Emoji by Apple Inc.",
                            sourceURLText: "https://developer.apple.com/fonts",
                            sourceLicenseText: "Copyright © All rights reserved"
                        )
                    ]
                )
            )
        }.previewLayout(.sizeThatFits)
    }
}
