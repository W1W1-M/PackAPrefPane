# ``PackAPrefPane``

Reusable & customizable SwiftUI settings sheet as a Swift package

## Overview

![PackAPrefPane Logo](PackAPrefPaneLogo.png)

PackAPrefPane lets developers quickly implement a settings sheet for their apps. A standard set of customizable elements are available as well as the possibility to include a custom nested view for dedicated app settings.

![PackAPrefPane preview](PackAPrefPanePreview.png)

## Usage

* Import ``PackAPrefPane/PackAPrefPane`` Swift package
* Setup a ``PrefPaneData`` typed var and customize it to your needs
* Setup your nested `appSettingsView` within a SwiftUI `Section` view
* Make sure you have a @State var for showing sheets `settingsSheetPresented: Bool`
* Use ``PackAPrefPane/PackAPrefPane`` view as in the following example:  
```
PackAPrefPane(  
    settingsSheetPresented: $yourSheetBool,  
    prefPaneData: yourPrefPaneData  
) {  
    YourNestedAppSettingsSectionView() 
}  
``` 

## Topics

### Essentials

- ``PackAPrefPane/PackAPrefPane``
- ``PrefPaneData``

### Help Section

- ``Help``
- ``HelpSectionData``
- ``FrequentlyAskedQuestions``

### About Section

- ``About``
- ``AboutSectionData``
- ``ThirdPartyCode``

### Legal Section

- ``Legal``
- ``LegalSectionData``

### Helper class

- ``PrefPaneHelper``
