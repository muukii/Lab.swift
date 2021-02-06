//: [Previous](@previous)

import Foundation

var str = "Kawa no nakani ishi ga aruyo"

let a = str.unicodeScalars.map { c -> String in
  if CharacterSet.whitespaces.contains(c) {
    return "    "
  } else if CharacterSet.letters.contains(c) {
    return ":alphabet-white-\(c):"
  } else {
    return c.description
  }
}

print(a.joined(separator: ""))

//: [Next](@next)
