# Navigation

A modular, flexible, and type-safe navigation system for SwiftUI apps.
This packages allows for clean architecture and scalable routing — supporting push, modal, and full screen transitions.


## 🛠 Installation

Open XCode and then navigate to `File -> Add Package Dependencies...`.
In the searchbar paste in the following URL:

**With SSH**
```bash
git@github.com:wardell00/Navigation.git
```

**With HTTPS**
```bash
https://github.com/wardell00/Navigation.git
```

When added you can import the package like this:
```swift
import Navigation
```

## Navigation Protocols

To make navigating possible create 3 enums. One for Push, one for Sheet and 
one for FullScreen Cover.

### Push Navigation

```swift
enum PushDestination: PushNavigation {

var id: // Your IDs (Can be string, uuid ...)

case pushOne // your cases

func destinationView() -> some View {
    switch self {
      // your views
    }
  }
}
```

### Sheet Navigation

```swift
enum SheetNavigation: ModalNavigation {

var id: // Your IDs (Can be string, uuid ...)

case sheetOne // your cases

func destinationView() -> some View {
    switch self {
      // your views
    }
  }
}
```

### Fullscreen Cover Navigation

```swift
enum FullScreenNavigation: ModalNavigation {

var id: // Your IDs

case fullScreenOne // your cases (Can be string, uuid ...)

func destinationView() -> some View {
    switch self {
      // your views
    }
  }
}
```

## Typealias (Optional)

Generics can sometimes be a pain. To make things easier
you can create a typealias.

```swift
import Navigation

struct TypeAlias {
    typealias Router = NavigationRouter<PushDestination, SheetNavigation, FullScreenNavigation> // <- Add your NavigationEnums
    typealias Destin = Destination<PushDestination, SheetNavigation, FullScreenNavigation> // <- Add your NavigationEnums
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