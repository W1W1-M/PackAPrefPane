# **PackAPrefPane**

### *Reusable & customizable SwiftUI settings sheet as a Swift package*

## Features
* Swift package
* 100% Swift
* 99% SwiftUI
* Simple design
* Lightweight
* Customizable
* Nothing exotic
* Open source
* Target: iOS 14 >

## Usage
* Import PackAPrefPane Swift package
* Create a var with PackAPrefPaneData type
* Pass PackAPrefPaneData var into PackAPrefPane view

### PackAPrefPaneData type
#### Help section
`showFeedbackLink: Bool`
`showSupportLink: Bool`
`showWhatsNew: Bool`
`showFAQ: Bool`
`appID: String`
`changelogText: String`
`faq: [FrequentlyAskedQuestions]` // Array of FrequentlyAskedQuestions
#### AppInfo section
`developerInfoText: String`
`appCopyrightText: String`
`thirdPartyCode: [ThirdPartyCode]` // Array of ThirdPartyCode
#### Legal section
`showDisclaimer: Bool`
`showPrivacyPolicy: Bool`
`showSpecialThanks: Bool`
`disclaimerText: String`
`privacyPolicyText: String`
`specialThanksText: String`

### FrequentlyAskedQuestions type
`id = UUID()` // Identifiable for ForEach
`question: String
`answer: String

### ThirdPartyCode type
`id = UUID()`// Identifiable for ForEach
`sourceNameText: String` // Third party code name and developer
`sourceURLText: String` // Full URL to code web page
`sourceLicenseText: String`// Source code license name

## Project resources
* Mind map in MindNode format

### Initial version made at November 2021 SwiftUI Jam https://www.swiftuijam.com

## License
PackAPrefPane is designed and coded by W1W1-M and released under MIT license
