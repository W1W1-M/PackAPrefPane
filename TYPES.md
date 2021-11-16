## [Go to README](README.md)

## PrefPaneData type
### Help section
`showFeedbackLink: Bool` // Show or drop feedback link
`showSupportLink: Bool` // Show or drop support link
`showWhatsNew: Bool` // Show or drop changelog text
`showFAQ: Bool` // Show or drop frequently asked questions disclosure group
`appID: String`
`changelogText: String`
`faq: [FrequentlyAskedQuestions]` // Array of FrequentlyAskedQuestions
### AppInfo section
`developerInfoText: String`
`appCopyrightText: String`
`thirdPartyCode: [ThirdPartyCode]` // Array of ThirdPartyCode
### Legal section
`showDisclaimer: Bool` // Show or drop disclaimer button
`showPrivacyPolicy: Bool` // Show or drop privacy policy button
`showAcknowledgments: Bool` // Show or drop acknowledgments button
`showTOS: Bool` // Show or drop terms of service disclosure group
`disclaimerText: String`
`privacyPolicyText: String`
`acknowledgmentsText: String`
`termsOfServiceText: String`

## FrequentlyAskedQuestions type
`id = UUID()` // Identifiable for ForEach
`question: String`
`answer: String`

## ThirdPartyCode type
`id = UUID()` // Identifiable for ForEach
`sourceNameText: String` // Third party code name and developer
`sourceURLText: String` // Full URL to code web page
`sourceLicenseText: String` // Source code license name 
