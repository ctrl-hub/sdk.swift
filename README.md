# CtrlHub

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fctrl-hub%2Fsdk.swift%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/ctrl-hub/sdk.swift)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fctrl-hub%2Fsdk.swift%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/ctrl-hub/sdk.swift)

This swift package is an SDK for the [Ctrl Hub API](https://docs.ctrl-hub.com/api-reference).


## Installation

Add the package with your package manager using `https://github.com/ctrl-hub/sdk.swift`

Then import the package into your bundle:

```swift
import CtrlHub
```


## Getting Started

The SDK uses a `.plist` configuration file called `CtrlHubConfig.plist` to collect all of the variables required to connect to the platform which you should add to to the root of your own project when integrating the SDK.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>authDomain</key>
    <string>https://auth.ctrl-hub.com</string>
    <key>apiDomain</key>
    <string>https://api.ctrl-hub.com</string>
</dict>
</plist>
```

To use the SDK, you need to import the package before calling any methods:

```swift
import CtrlHub

// Read the configuration from the CtrlHubConfig.plist in your app bundle:
if let configuration = CtrlHub.Config() {
    CtrlHub.config = configuration
} else {
    // there are errors in the config file
}

// Make requests to Ctrl Hub via the SDK:
do {
    let orgs = try await CtrlHub.Organisations.shared.Get()
} catch let error as CtrlHub.APIError {
    // handle the error
}
```
