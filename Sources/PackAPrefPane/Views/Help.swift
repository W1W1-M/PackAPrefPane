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
    @Binding var alert: PackAPrefPane.alerts
    @Binding var alertPresented: Bool
    @State private var faqExpanded: Bool = false
    @State private var whatsNewExpanded: Bool = false
    let appVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
    // UI
    var body: some View {
        Section(header: Text("⛑ Help")) { // Customize this view
            Button(action: {
                PrefPaneHelper.appFeedback()
            }, label: {
                HStack {
                    Text("Feedback")
                    Spacer()
                    Image(systemName: "plus.bubble.fill").imageScale(.large)
                }
            })
            Button(action: {
                alert = PackAPrefPane.alerts.supportAlert
                alertPresented.toggle()
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
                        Text("- New Feature \n- Upgraded feature \n- Bug fixed")
                        Spacer()
                    }
                }
            }
            DisclosureGroup("FAQ", isExpanded: $faqExpanded) {
                VStack {
                    HStack {
                        Text("Q.1: How is the thing calculated ?").font(.headline)
                        Spacer()
                    }
                    Spacer()
                    HStack {
                        Text("A.1: The thing's percentage is calculated by dividing the combined amount of this from each of that by the total quantity of those.")
                        Spacer()
                    }
                }
                VStack {
                    HStack {
                        Text("Q.2: What % of this can I use ?").font(.headline)
                        Spacer()
                    }
                    Spacer()
                    HStack {
                        Text("A.2: Those can tolerate a small percentage of that in the these. Please enquire by your own means beforehand.")
                        Spacer()
                    }
                }
                VStack {
                    HStack {
                        Text("Q.3: How are those calculated ?").font(.headline)
                        Spacer()
                    }
                    Spacer()
                    HStack {
                        Text("A.3: Things are the difference between the total amount of the that using this and the same if only this was used.")
                        Spacer()
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
                alert: .constant(PackAPrefPane.alerts.supportAlert),
                alertPresented: .constant(false)
            )
        }.previewLayout(.sizeThatFits)
    }
}
