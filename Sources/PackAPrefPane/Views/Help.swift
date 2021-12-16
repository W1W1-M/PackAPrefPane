//
//  Help.swift
//  
//
//  Created by William Mead on 06/11/2021.
//
// MARK: - Modules
import SwiftUI
// MARK: - Views
/// Help section View using ``HelpSectionData``
@available(macOS 11.0, iOS 14, *)
public struct Help: View {
    // Variables
    let helpSectionData: HelpSectionData
    // UI
    public var body: some View {
        Section(header: Text(NSLocalizedString("🆘 Help", tableName: "Localizable", bundle: .module, value: "", comment: ""))) {
            if helpSectionData.showFeedbackLink {
                Feedback()
            }
            if helpSectionData.showSupportLink {
                Support()
            }
            if helpSectionData.showWhatsNew {
                WhatsNew()
            }
            if helpSectionData.showFAQ {
                FAQ(faq: helpSectionData.faq)
            }
        }.environmentObject(helpSectionData)
    }
}
// MARK: - Feedback
@available(macOS 11.0, iOS 14, *)
struct Feedback: View {
    // Variables
    @EnvironmentObject var helpSectionData: HelpSectionData
    // UI
    var body: some View {
        Link(destination: PrefPaneHelper.appFeedbackURL(for: helpSectionData.appID)) {
            HStack {
                Text(NSLocalizedString("Feedback", tableName: "Localizable", bundle: .module, value: "", comment: ""))
                Spacer()
                Image(systemName: "plus.bubble.fill").imageScale(.large)
            }
        }
    }
}
// MARK: - Support
@available(macOS 11.0, iOS 14, *)
struct Support: View {
    // Variables
    @EnvironmentObject var helpSectionData: HelpSectionData
    // UI
    var body: some View {
        Link(destination: PrefPaneHelper.supportEmailURL(
                to: helpSectionData.supportEmailAddress,
                subject: helpSectionData.supportEmailSubject,
                message: helpSectionData.supportEmailBody
            )
        ) {
            HStack {
                Text(NSLocalizedString("Support", tableName: "Localizable", bundle: .module, value: "", comment: ""))
                Spacer()
                Image(systemName: "cross.case.fill").imageScale(.large)
            }
        }
    }
}
// MARK: - WhatsNew
@available(macOS 11.0, iOS 14, *)
struct WhatsNew: View {
    // Variables
    @State private var whatsNewExpanded: Bool = false
    @EnvironmentObject var helpSectionData: HelpSectionData
    let appVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
    // UI
    var body: some View {
        DisclosureGroup(NSLocalizedString("What's New", tableName: "Localizable", bundle: .module, value: "", comment: ""), isExpanded: $whatsNewExpanded) {
            VStack {
                HStack {
                    Spacer()
                    Text(NSLocalizedString("Release Notes", tableName: "Localizable", bundle: .module, value: "", comment: ""))
                    Text("v\(appVersion)")
                    Spacer()
                }.font(.headline)
                Spacer()
                HStack {
                    Text(NSLocalizedString(helpSectionData.changelogText, tableName: "Localizable", bundle: .main, value: "", comment: ""))
                    Spacer()
                }
            }
        }
    }
}
// MARK: - FAQ
@available(macOS 11.0, iOS 14, *)
struct FAQ: View {
    // Variables
    @State private var faqExpanded: Bool = false
    let faq: [FrequentlyAskedQuestions]
    // UI
    var body: some View {
        DisclosureGroup(NSLocalizedString("FAQ", tableName: "Localizable", bundle: .module, value: "", comment: ""), isExpanded: $faqExpanded) {
            List {
                ForEach(faq) { FrequentlyAskedQuestions in
                    VStack {
                        HStack {
                            Text(NSLocalizedString(FrequentlyAskedQuestions.question, tableName: "Localizable", bundle: .main, value: "", comment: "")).font(.headline)
                            Spacer()
                        }
                        Spacer()
                        HStack {
                            Text(NSLocalizedString(FrequentlyAskedQuestions.answer, tableName: "Localizable", bundle: .main, value: "", comment: ""))
                            Spacer()
                        }
                    }
                }
            }
        }
    }
}
// MARK: - Previews
@available(macOS 11.0, iOS 14, *)
struct Help_Previews: PreviewProvider {
    @State var alertPresented: Bool = false
    static var previews: some View {
        Form{
            Help(helpSectionData: HelpSectionData(
                    showHelpSection: true,
                    showFeedbackLink: true,
                    showSupportLink: true,
                    showWhatsNew: true,
                    showFAQ: true,
                    appID: "1564978634",
                    supportEmailAddress: "support@super85.fr",
                    supportEmailSubject: "PackAPrefPane Test",
                    supportEmailBody: "Testing PackAPrefPane",
                    changelogText: "- New Feature \n- Upgraded feature \n- Bug fixed",
                    faq: [
                        FrequentlyAskedQuestions(
                            question: "Q.1: How is this example calculated ?",
                            answer: "A.1: The example's percentage is calculated by dividing the combined amount of this from each of that by the total quantity of those."
                        ),
                        FrequentlyAskedQuestions(
                            question: "Q.2: What % of this can I use ?",
                            answer: "A.2: Those can tolerate a small percentage of that in the these. Please enquire by your own means beforehand."
                        )
                    ]
                )
            )
        }.previewLayout(.sizeThatFits)
    }
}
