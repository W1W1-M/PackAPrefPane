//
//  Legals.swift
//  
//
//  Created by William Mead on 06/11/2021.
//
// MARK: - Modules
import SwiftUI
// MARK: - Views
/// Legal section View using ``LegalSectionData``
@available(macOS 11.0, iOS 14, *)
public struct Legal: View {
    // Variables
    @State private var alertPresented: Bool = false
    @State private var alert: alerts = .disclaimerAlert
    let legalSectionData: LegalSectionData
    enum alerts {
        case disclaimerAlert
        case privacyAlert
        case acknowledgments
    }
    // UI
    public var body: some View {
        if legalSectionData.showLegalSection {
            Section(header: Text(NSLocalizedString("❗️ Legal", tableName: "Localizable", bundle: .module, value: "", comment: ""))) {
                if legalSectionData.showDisclaimer {
                    Disclaimer(
                        alertPresented: $alertPresented,
                        alert: $alert,
                        legalSectionData: legalSectionData
                    )
                }
                if legalSectionData.showPrivacyPolicy {
                    PrivacyPolicy(
                        alertPresented: $alertPresented,
                        alert: $alert,
                        legalSectionData: legalSectionData
                    )
                }
                if legalSectionData.showAcknowledgments {
                    Acknowledgments(alertPresented: $alertPresented, alert: $alert)
                }
                if legalSectionData.showTOS {
                    TermsOfService(legalSectionData: legalSectionData)
                }
            }.alert(isPresented: $alertPresented, content: { // alert switch cases
                switch alert {
                case .disclaimerAlert:
                    return Alert(
                        title: Text(NSLocalizedString("Legal disclaimer", tableName: "Localizable", bundle: .module, value: "", comment: "")),
                        message: Text(NSLocalizedString(legalSectionData.disclaimerText, tableName: "Localizable", bundle: .main, value: "", comment: "")),
                        dismissButton: .default(Text("OK")) {
                            if legalSectionData.disclaimerAcceptedCheck {
                                PrefPaneHelper.acceptDisclaimer(
                                    disclaimerAcceptedDefaultsKey: legalSectionData.disclaimerAcceptedDefaultsKey,
                                    disclaimerAcceptedDateDefaultsKey: legalSectionData.disclaimerAcceptedDateDefaultsKey
                                )
                            }
                        }
                    )
                case .privacyAlert:
                    return Alert(
                        title: Text(NSLocalizedString("Privacy policy", tableName: "Localizable", bundle: .module, value: "", comment: "")),
                        message: Text(NSLocalizedString(legalSectionData.privacyPolicyText, tableName: "Localizable", bundle: .main, value: "", comment: "")),
                        dismissButton: .default(Text("OK")) {
                            if legalSectionData.privacyPolicyAcceptedCheck {
                                PrefPaneHelper.acceptPrivacyPolicy(
                                    privacyPolicyAcceptedDefaultsKey: legalSectionData.privacyPolicyAcceptedDefaultsKey,
                                    privacyPolicyAcceptedDateDefaultsKey: legalSectionData.privacyPolicyAcceptedDateDefaultsKey
                                )
                            }
                        }
                    )
                case .acknowledgments:
                    return Alert(
                        title: Text(NSLocalizedString("Acknowledgments", tableName: "Localizable", bundle: .module, value: "", comment: "")),
                        message: Text(NSLocalizedString(legalSectionData.acknowledgmentsText, tableName: "Localizable", bundle: .main, value: "", comment: "")),
                        dismissButton: .default(Text("OK"))
                    )
                }
        })
        }
    }
}
// MARK: - Disclaimer
@available(macOS 11.0, iOS 14, *)
struct Disclaimer: View {
    // Variables
    @Binding var alertPresented: Bool
    @Binding var alert: Legal.alerts
    let legalSectionData: LegalSectionData
    // UI
    var body: some View {
        Button(action: {
            alert = Legal.alerts.disclaimerAlert
            alertPresented.toggle()
        }, label: {
            HStack {
                Text(NSLocalizedString("Legal disclaimer", tableName: "Localizable", bundle: .module, value: "", comment: ""))
                Spacer()
                if legalSectionData.disclaimerAcceptedCheck {
                    if UserDefaults.standard.bool(forKey: legalSectionData.disclaimerAcceptedDefaultsKey) {
                        Image(systemName: "checkmark.shield.fill").imageScale(.large)
                    } else {
                        Image(systemName: "checkmark.shield").imageScale(.large)
                    }
                } else {
                    Image(systemName: "checkmark.shield").imageScale(.large)
                }
            }
        })
    }
}
// MARK: - PrivacyPolicy
@available(macOS 11.0, iOS 14, tvOS 14, watchOS 7, *)
struct PrivacyPolicy: View {
    // Variables
    @Binding var alertPresented: Bool
    @Binding var alert: Legal.alerts
    let legalSectionData: LegalSectionData
    // UI
    var body: some View {
        Button(action: {
            alert = Legal.alerts.privacyAlert
            alertPresented.toggle()
        }, label: {
            HStack {
                Text(NSLocalizedString("Privacy policy", tableName: "Localizable", bundle: .module, value: "", comment: ""))
                Spacer()
                if legalSectionData.privacyPolicyAcceptedCheck {
                    if UserDefaults.standard.bool(forKey: legalSectionData.privacyPolicyAcceptedDefaultsKey) {
                        Image(systemName: "lock.shield.fill").imageScale(.large)
                    } else {
                        Image(systemName: "lock.shield").imageScale(.large)
                    }
                } else {
                    Image(systemName: "lock.shield").imageScale(.large)
                }
                
            }
        })
    }
}
// MARK: - Acknowledgments
@available(macOS 11.0, iOS 14, tvOS 14, watchOS 7, *)
struct Acknowledgments: View {
    // Variables
    @Binding var alertPresented: Bool
    @Binding var alert: Legal.alerts
    // UI
    var body: some View {
        Button(action: {
            alert = Legal.alerts.acknowledgments
            alertPresented.toggle()
        }, label: {
            HStack {
                Text(NSLocalizedString("Acknowledgments", tableName: "Localizable", bundle: .module, value: "", comment: ""))
                Spacer()
                Image(systemName: "figure.wave").imageScale(.large)
            }
        })
    }
}
// MARK: - TermsOfService
@available(macOS 11.0, iOS 14, tvOS 14, watchOS 7, *)
struct TermsOfService: View {
    // Variables
    @State private var tosExpanded: Bool = false
    let legalSectionData: LegalSectionData
    // UI
    var body: some View {
        DisclosureGroup(NSLocalizedString("Terms of Service", tableName: "Localizable", bundle: .module, value: "", comment: ""), isExpanded: $tosExpanded) {
            Text(legalSectionData.termsOfServiceText)
        }
    }
}
// MARK: - Previews
@available(macOS 11.0, iOS 14, tvOS 14, watchOS 7, *)
struct Legal_Previews: PreviewProvider {
    static var previews: some View {
        Form{
            Legal(legalSectionData: LegalSectionData(
                    showLegalSection: true,
                    showDisclaimer: true,
                    showPrivacyPolicy: true,
                    showAcknowledgments: true,
                    showTOS: true,
                    disclaimerText: "Use of this app is for informational purposes only. You alone are responsable for the usages you make of this app and you use it at your own risk. We accept no responsability for any damage to users or to their belongings as a result of using this app.",
                    privacyPolicyText: "We don't store your data.",
                    acknowledgmentsText: "Thanks to SwiftUI Jam",
                    termsOfServiceText: "Some terms of service that should be read by users.",
                    disclaimerAcceptedCheck: true,
                    privacyPolicyAcceptedCheck: true,
                    disclaimerAcceptedDefaultsKey: "disclaimerAccepted",
                    disclaimerAcceptedDateDefaultsKey: "disclaimerAcceptedDate",
                    privacyPolicyAcceptedDefaultsKey: "privacyPolicyAccepted",
                    privacyPolicyAcceptedDateDefaultsKey: "privacyPolicyAcceptedDate"
                )
            )
        }.previewLayout(.sizeThatFits)
    }
}
