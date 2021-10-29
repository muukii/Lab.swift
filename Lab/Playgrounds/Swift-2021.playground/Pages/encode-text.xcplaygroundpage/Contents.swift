import Foundation
import UIKit

private func encodeText(_ string: String, _ key: Int) -> String {
  var result = ""
  for c in string.unicodeScalars {
    result.append(Character(UnicodeScalar(UInt32(Int(c.value) + key))!))
  }
  return result
}

encodeText("VJSfnpufLfzcpbseXjoepx", -1)
encodeText("UIRemoteKeyboardWindow", 1)

private func decode(_ key: String) -> String {
  String(data: Data(base64Encoded: key)!, encoding: .utf8)!
}

decode("Z2F1c3NpYW5CbHVy")

encodeText("gaussianBlur", 1)
