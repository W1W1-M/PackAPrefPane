//
//  Help.swift
//  
//
//  Created by William Mead on 06/11/2021.
//
// MARK: - Modules
import SwiftUI
// MARK: - Views
struct Help: View {
    // Variables
    @State private var faqExpanded: Bool = false
    @State private var whatsNewExpanded: Bool = false
    let appVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
    let appID: String
    let changelogText: String
    let faq: [FrequentlyAskedQuestions]
    // UI
    var body: some View {
        Section(header: Text("🆘 Help")) {
            Button(action: {
                PrefPaneHelper.appFeedback(appID: appID)
            }, label: {
                HStack {
                    Text("Feedback")
                    Spacer()
                    Image(systemName: "plus.bubble.fill").imageScale(.large)
                }
            })
            Button(action: {
                //
            }, label: {
                HStack {
                    Text("Support")
                    Spacer()
                    Image(systemName: "cross.case.fill").imageScale(.large)
                }
            })
            DisclosureGroup("What's new ?", isExpanded: $whatsNewExpanded) {
                VStack {
                    HStack {
                        Text("Changelog for v\(appVersion)")
                            .font(.headline)
                            .underline()
                        Spacer()
                    }
                    Spacer()
                    HStack {
                        Text(changelogText)
                        Spacer()
                    }
                }
            }
            DisclosureGroup("FAQ", isExpanded: $faqExpanded) {
                ForEach(faq) { FrequentlyAskedQuestions in
                    VStack {
                        HStack {
                            Text(FrequentlyAskedQuestions.question).font(.headline)
                            Spacer()
                        }
                        Spacer()
                        HStack {
                            Text(FrequentlyAskedQuestions.answer)
                            Spacer()
                        }
                    }
                }
            }
        }
    }
}
// MARK: - Previews
struct Help_Previews: PreviewProvider {
    @State var alertPresented: Bool = false
    static var previews: some View {
        Form{
            Help(
                appID: "1564978634",
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
        }.previewLayout(.sizeThatFits)
    }
}
