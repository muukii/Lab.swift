import Foundation
import UIKit

func cfNetworkVersion() -> String? {
  guard
    let bundle = Bundle(identifier: "com.apple.CFNetwork"),
    let versionAny = bundle.infoDictionary?[kCFBundleVersionKey as String],
    let version = versionAny as? String
  else { return nil }
  return version
}

/**
 https://en.wikipedia.org/wiki/Darwin_(operating_system)
 */
func darwinVersion() -> String {
  var systemInfo = utsname()
  uname(&systemInfo)
  let machineMirror = Mirror(reflecting: systemInfo.release)
  let darvinVersionString = machineMirror.children.reduce("") { identifier, element in
    guard let value = element.value as? Int8,
          value != 0 else {
      return identifier
    }

    return identifier + String(UnicodeScalar(UInt8(value)))
  }
  return darvinVersionString
}

print(UIDevice.current.systemVersion)
print(cfNetworkVersion() ?? "null")
print(kCFCoreFoundationVersionNumber)
print(darwinVersion())
