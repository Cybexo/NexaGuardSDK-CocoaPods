
# NexaGuard CMP SDK for iOS (`NexaGuardSDK`)

**Privacy‑first, IAB TCF 2.3 + GPP compliant Consent Management Platform — in one tiny Swift package.**

---

## ✨ Highlights

|                         |                                                                                |
|-------------------------|--------------------------------------------------------------------------------|
| **🚀 Drop‑in UI**         | Modern banner **+** second layer with light/dark auto‑theme & rounded corners.   |
| **✅ TCF 2.3 compliant**  | Supports IAB Europe TCF 2.3 consent signaling across first layer and preferences. |
| **🔒 Reg‑tech inside**    | Generates full *Core* + *Disclosed / Allowed* TC‑String, CMP ID **471**.         |
| **📶 Offline‑first**      | Bundles last GVL snapshot & works without network after first launch.            |
| **🍪 Storage disclosure** | Per‑vendor cookie/device storage inventory dialog (ePrivacy Art. 5 / TTDSG §25). |
| **🧑‍💻 Pure Swift**      | No Objective‑C runtime tricks, no analytics, absolutely no tracking.             |
| **💡 Tiny footprint**     | ≈ 180 kB zipped **XCFramework** – link & ship.                                   |

---

## 🆕 Latest Public Updates

- Improved EU first-layer CMP UX with a more native iOS bottom-sheet style.
- Added cleaner first-layer content preview for data processing options.
- Added inline expand/collapse behavior for **View data processing options (N)**.
- Kept first-layer actions deterministic:
  - **Accept All** grants all supported consent mode keys.
  - **Reject All** denies all supported consent mode keys.
- Separated `analytics_storage` as SDK-managed non-TCF consent state.
- Added dedicated second-layer non-TCF analytics control.
- Improved special-feature behavior:
  - Show Special Features only when at least one configured vendor claims them.
  - Write special-feature consent only for vendors that claim that feature.
- Reduced redundant consent/log noise in repeated no-op write paths.

---

## 🔧 Requirements

- **iOS 13.0** or later
- **Xcode 15** or later
- **Swift 5.9**

---

## 📦 Installation

### CocoaPods *(recommended)*

```ruby
pod 'NexaGuardSDK', '~> 1.0'
```

Then `pod install` – done.

### Manual (XCFramework)

1. [Download the latest `NexaGuardSDK.xcframework`](https://github.com/Cybexo/NexaGuardSDK-CocoaPods/releases) from the Releases page of this repository.
2. Drag the `.xcframework` into your Xcode project under **Frameworks, Libraries & Embedded Content** (*Embed & Sign*).

---

## 🚀 Quick Start

```swift
import SwiftUI
import NexaGuardCMP   // re‑exported by the framework

struct ContentView: View {
  @State private var cmpReady = false

  var body: some View {
    VStack(spacing: 24) {
      Text("Welcome")
        .font(.largeTitle)
      Button("Show CMP banner") {
        NexaGuardCMP.shared.showBanner(force: true)
      }
    }
    .onAppear {
      guard !cmpReady else { return }
      NexaGuardCMP.shared.initialize(settingsId: "NXG‑Zmk9Zy0c1X") {
        print("CMP ready – TC stored")
      }
      cmpReady = true
    }
  }
}
```

### Top‑view‑controller helper *(SwiftUI only)*

The banner is UIKit. If your app is 100 % SwiftUI you need this once:

```swift
import UIKit
extension UIApplication {
  func topViewController(base: UIViewController? = nil) -> UIViewController? {
    let root = base ?? connectedScenes
      .compactMap { ($0 as? UIWindowScene)?.keyWindow }
      .first?.rootViewController
    if let nav = root as? UINavigationController {
      return topViewController(base: nav.visibleViewController)
    }
    if let tab = root as? UITabBarController, let sel = tab.selectedViewController {
      return topViewController(base: sel)
    }
    if let presented = root?.presentedViewController {
      return topViewController(base: presented)
    }
    return root
  }
}
```

---

## 🛠 API cheat‑sheet

| Method                                                 | Use‑case                                               |
|--------------------------------------------------------|--------------------------------------------------------|
| `acceptAllSelections()`                                | Accept all purposes & vendors (second‑layer shortcut). |
| `rejectAllSelections()`                                | Reject all.                                            |
| `applyCustomSelections(purposes:[Int], vendors:[Int])` | Persist selections from your custom UI.                |
| `makeTCStringRejectAll()`                              | Build a *Reject All* TC‑String without UI.             |
| `ConsentStorage.getTCString()`                         | Read the persisted TC‑String at any time.              |

---

## 📄 Licence & Pricing

`NexaGuardSDK` is **commercial software**. By integrating the binary you agree to the terms in [`LICENSE`](LICENSE). A paid NexaGuard CMP subscription is required for production traffic.

---

## 🤝 Support

- **Docs:** [https://developer.nexaguard.com/](https://developer.nexaguard.com/)
- **Dashboard:** [https://dashboard.nexaguard.com](https://dashboard.nexaguard.com)
- **Email:** [ios@nexaguard.com](mailto:ios@nexaguard.com)

> 📨 We reply within one business day – usually faster.

---

© 2026 **NexaGuard Inc.**  All rights reserved.
