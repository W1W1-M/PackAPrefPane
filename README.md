![release](https://img.shields.io/github/v/release/W1W1-M/PackAPrefPane?display_name=tag)
![code-size](https://img.shields.io/github/languages/code-size/W1W1-M/PackAPrefPane)
![license](https://img.shields.io/github/license/W1W1-M/PackAPrefPane)
[![swift-versions](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FW1W1-M%2FPackAPrefPane%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/W1W1-M/PackAPrefPane)
[![platforms](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FW1W1-M%2FPackAPrefPane%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/W1W1-M/PackAPrefPane)

# **PackAPrefPane**

### *Reusable & customizable SwiftUI settings sheet as a Swift package*
### Initial version made at November 2021 SwiftUI Jam https://www.swiftuijam.com

![PackAPrefPane Logo](/Sources/PackAPrefPane/Documentation.docc/Resources/PackAPrefPaneLogo.png)

## Features
* Swift package
* 100% Swift
* 100% SwiftUI
* Simple design
* Lightweight
* Customizable
* Localizable
* Open source
* Documentation in DocC 
* Target: iOS 14 >

![PackAPrefPane preview](/Sources/PackAPrefPane/Documentation.docc/Resources/PackAPrefPanePreview.png)

## Usage
* Import `PackAPrefPane` Swift package
* Setup a var with `PrefPaneData` type and customize each variable to your needs
* Setup your nested `appSettingsView` within a SwiftUI `Section` view
* Make sure you have a var for showing sheets `settingsSheetPresented: Bool`
* Use `PackAPrefPane` view with the above variables as in this example:  
```
PackAPrefPane(  
    settingsSheetPresented: yourSheetbool,  
    prefPaneData: yourPrefPaneData  
) {  
    Section(header: Text("Your nested app settings view section")) {  
        YourNestedAppSettingsView()  
    }  
}  
``` 

## Documentation

Classes, Structs, Methods & Properties are documented using DocC and can be found within Xcode developer documentaiton

## Project assets in releases
* Mind map in MindNode format
* Logo design in AffinityDesigner format

## License
PackAPrefPane is designed and coded by W1W1-M and released under MIT license
