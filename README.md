# Navigation

[![Swift](https://img.shields.io/badge/Swift-6.0-orange?logo=swift)](https://swift.org)
[![iOS](https://img.shields.io/badge/iOS-18%2B-blue?logo=apple)](https://developer.apple.com/ios/)
[![macOS](https://img.shields.io/badge/macOS-15%2B-blue?logo=apple)](https://developer.apple.com/macos/)
[![SwiftUI](https://img.shields.io/badge/SwiftUI-compatible-green?logo=swift)](https://developer.apple.com/xcode/swiftui/)
[![SPM](https://img.shields.io/badge/SPM-supported-informational?logo=swift)](https://swift.org/package-manager/)

> A modular, type-safe, and scalable navigation system for SwiftUI apps.

Navigation enables you to implement **clean architecture and flexible routing** using push, sheet, and fullscreen cover presentations — with built-in support for **alerts** and **confirmation dialogs**.

---


## 🛠 Installation

In Xcode:

> **File → Add Package Dependencies...**

Paste the repository URL:

**SSH**
```bash
git@github.com:wardell00/Navigation.git
```

**HTTPS**
```bash
https://github.com/wardell00/Navigation.git
```

Import the package in your files:
```swift
import Navigation
```

## 🚦 Navigation Protocols

To define your navigation structure, create three enums:

- One for push navigation
- One for sheet presentation
- One for fullscreen cover

### Push Navigation

```swift
enum PushDestination: PushNavigation {
    var id: String { ... } // or UUID, etc.

    case pushOne

    func destinationView() -> some View {
        switch self {
        case .pushOne:
            // return your view here
        }
    }
}

```

### Sheet Navigation

```swift
enum SheetNavigation: ModalNavigation {
    var id: String { ... }

    case sheetOne

    func destinationView() -> some View {
        switch self {
        case .sheetOne:
            // return your view here
        }
    }
}
```

### Fullscreen Cover Navigation

```swift
enum FullScreenNavigation: ModalNavigation {
    var id: String { ... }

    case fullScreenOne

    func destinationView() -> some View {
        switch self {
        case .fullScreenOne:
            // return your view here
        }
    }
}
```

## 🧩 Typealias (Optional)

To simplify generic usage, define a central alias:

```swift
import Navigation

enum AppNavigationConfig {
    typealias Router = NavigationRouter<PushDestination, SheetNavigation, FullScreenNavigation>
    typealias Destin = Destination<PushDestination, SheetNavigation, FullScreenNavigation>
}
```

## Features

### NavigationRouter

This class is respsonsible for the navigating logic.
You can initialize it like this:

**Without** Typealias
```swift
@State private var router: NavigationRouter<PushDestination, SheetNavigation, FullScreenNavigation> // <- Add your NavigationEnums = .init()
```

**With** Typealias
```swift
@State private var router: TypeAlias.Router = .init()
```

### NavigationContainer
This view wraps your views inside a NavigationStack and provides the Navigation Environment.
If you want to use the navigation package you have to wrap all your RootViews inside the NavigationContainer.

```swift
import Navigation

struct Screen: View {
    @State private var router: TypeAlias.Router = .init()

    var body: some View {
        NavigationContainer(router: router) {
            YourRootView()
        }
    }
}
```
All child views of ``YourRootView()`` can access your Router init like this:

```swift
@Environment(TypeAlias.Router.self) private var router
```

### NavigationButton

With a click on this button you can navigate to a new page or open a sheet or fullscreen cover.
To make your life a little bit more convenient create a file ``NavigationButton.swift`` and add this code:



```swift
import Navigation
import SwiftUI

struct NavigationButton<Content: View>: View {
    
    @Environment(TypeAlias.Router.self) private var router
    let destination: TypeAlias.Destin
    @ViewBuilder let label: () -> Content
    
    var body: some View {
        @Bindable var bindingRouter = router
        _NavigationButton(router: bindingRouter, destination: destination, label: label)
    }
}
```

To navigate to a new page use the button like this:

```swift
NavigationButton(destination: .push(.pushOne)) { 
  // Your label
}
```

To open to a sheet use the button like this:

```swift
NavigationButton(destination: .sheet(.sheetOne)) { 
  // Your label
}
```

To open to a fullscreen cover use the button like this:

```swift
NavigationButton(destination: .fullScreen(.fullScreenOne)) { 
  // Your label
}
```

If you want to navigate without a button. For example you might want to open a sheet when a specific screen appears you can do this:

```swift
struct Screen: View {
  @Environment(TypeAlias.Router.self) private var router

  var body: some View {
    SwiftUIView()
    .task {
      router.navigate(.sheet(.sheetOne))
    }
  }
}
```

## Alert

The struct ``AlertPush`` provides convenient inits for Alerts.

If you want to to show an alert without a specific button make use of this init:

```swift
let alert: AlertPush = .init(
        title: "Your title",
        message: "Your message"
    ) 

```
This creates an alert with a title, message and a dismiss button.

If you want your alert to have specific buttons make use of this init:

```swift

let alert: AlertPush = .init(
       title: "Your title",
       message: "Your message"
) {
  Button {

  } label: {

  }
}
```
You can add as many button as you want. However I would suggest to limit the buttons to 3.

### Extending AlertPush
If you have many different alerts you want to show in your app the best way is to add them as a static variable or function to your AlertPush extension.

```swift
import Navigation

extension AlertPush {

  static func simpleAlert() -> Self {
    .init(
       title: "Simple Alert",
       message: "This simple alert is shown using the navigation package"
    )
  }
}
```

### How to show  the alert
The following code shows an example how the alert can be shown.

```swift
import Navigation

struct Screen: View {

  @State private var alertPush: AlertPush? = nil

  var body: some View {

      Button {
        alert = .simpleAlert()
      } label: {
        Text("Show Alert")
      }
      .alert($alertPush)
  }
}
```
