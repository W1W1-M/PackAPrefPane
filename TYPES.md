## [Go to README](README.md)

## PrefPaneData type
### Help section
`showHelpSection: Bool` // Show or drop help section  
`showFeedbackLink: Bool` // Show or drop feedback link  
`showSupportLink: Bool` // Show or drop support link  
`showWhatsNew: Bool` // Show or drop changelog text  
`showFAQ: Bool` // Show or drop frequently asked questions disclosure group  
`appID: String` // Your app's App store ID  
`supportEmailAddress: String`  
`supportEmailSubject: String`  
`supportEmailBody: String`  
`changelogText: String` // Release notes text  
`faq: [FrequentlyAskedQuestions]` // Array of FrequentlyAskedQuestions  
### AppInfo section
`developerInfoText: String` // Text about you, the developer  
`appCopyrightText: String` // Your app's copyright info text  
`thirdPartyCode: [ThirdPartyCode]` // Array of ThirdPartyCode  
### Legal section
`showLegalSection: Bool` // Show or drop legal section  
`showDisclaimer: Bool` // Show or drop disclaimer button  
`showPrivacyPolicy: Bool` // Show or drop privacy policy button  
`showAcknowledgments: Bool` // Show or drop acknowledgments button  
`showTOS: Bool` // Show or drop terms of service disclosure group  
`disclaimerText: String` // Your legal disclaimer text  
`privacyPolicyText: String` // Your privacy policy text   
`acknowledgmentsText: String` // Special thanks text  
`termsOfServiceText: String` // Service terms text  
`disclaimerAcceptedCheck: Bool` // Bool to activate user accepted disclaimer check  
`privacyPolicyAcceptedCheck: Bool` // Bool to activate user accepted privacy policy check  
`disclaimerAcceptedDefaultsKey: String` // Disclaimer accepted user defaults key string  
`disclaimerAcceptedDateDefaultsKey: String` // Disclaimer accepted date user defaults key string  
`privacyPolicyAcceptedDefaultsKey: String` // Privacy policy accepted user defaults key string  
`privacyPolicyAcceptedDateDefaultsKey: String` // Privacy polcy date accepted user defaults key string  

## FrequentlyAskedQuestions type
`id = UUID()` // Identifiable for List ForEach  
`question: String` // A FAQ question text  
`answer: String` // A FAQ answer text  

## ThirdPartyCode type
`id = UUID()` // Identifiable for List ForEach  
`sourceNameText: String` // Third party code name and developer  
`sourceURLText: String` // Full URL to code web page  
`sourceLicenseText: String` // Source code license name  
