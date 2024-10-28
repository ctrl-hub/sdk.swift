# CtrlHubAPI

This swift package is an SDK for the Ctrl Hub API.

## Installation

Add the package with your package manager using `https://github.com/ctrl-hub/sdk.swift`

Then import the package into your bundle:

```swift
import CtrlHubAPI
```

## Getting Started

The SDK uses a `.plist` configuration file called `CtrlHubAPI.plist` to collect all of the variables required to connect to the platform which you should add to to the root of your own project when integrating the SDK.

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
import CtrlHubAPI

// Read the configuration from the CtrlHubAPI.plist in your app bundle:
if let configuration = CtrlHubAPI.Config() {
    CtrlHubAPI.config = configuration
} else {
    // there are errors in the config file
}

// Make requests to Ctrl Hub via the SDK:
do {
    let submissions = try await CtrlHubAPI.Submissions.get()
    // do something with the submissions
} catch {
    print(error)
    // handle any errors that are thrown
}
```
