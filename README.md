# CtrlHub

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
import CtrlHubAPI

// Read the configuration from the CtrlHubAPI.plist in your app bundle:
if let configuration = CtrlHubAPI.Config() {
    CtrlHubAPI.config = configuration
} else {
    // there are errors in the config file
}

// Make requests to Ctrl Hub via the SDK:
let _ = CtrlHubAPI.ServiceAccounts.get(org: "50d096a7-d686-4c1a-bdfd-a084f42e8043") { response in
    switch response {
    case .Success(let data):
        debugPrint("service accounts count:", data.serviceAccounts.count)
        data.serviceAccounts.forEach() { account in
            print("account:", account) // access each account
        }
    case .Fail(let error):
        print("error:", error)
    }
}
```


### Note on requests

Calls via the SDK to the API will return the Alamofire request that was used. This allows you to make some assertions in the case of failing requests. You will see in the documentation an empty `let` var which is set, but this is not necessary - they're there because XCode will complain about the syntax if this is missing.

For example:

```swift
CtrlHubAPI.Organisations.get() { response in
    // handle the response
}
```

Is similar to:

```swift
let _ = CtrlHubAPI.Organisations.get() { response in
    // handle the response
}
```

And of course, if you'd like to mapiulate the request, you can:

```swift
let request = CtrlHubAPI.Organisations.get() { response in
    // handle the response
}
// do something with request, e.g. `request.cancel()`
```


## Supported Resources

### Organisations

Get all the organisations a user can access:

```swift
CtrlHubAPI.Organisations.get() { response in
    switch response {
    case .success(let data):
        debugPrint(data)
    case .fail(let error):
        print(error)
    }
}
```

Get an organisation that the user can access:

```swift
let orgId = "ebfca9a0-7dc3-4648-b074-d87a95884492"
CtrlHubAPI.Organisations.get(orgId: orgId) { response in
    switch response {
    case .success(let data):
        debugPrint(data)
    case .fail(let error):
        print(error)
    }
}
```
