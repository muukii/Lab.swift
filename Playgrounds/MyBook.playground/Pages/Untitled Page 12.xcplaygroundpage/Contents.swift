
import Foundation

func modify(_ value: inout String) {
  value = "modified"
}

func nomodify(_ value: inout String) {
}

var text = ""

print(withUnsafeMutablePointer(to: &text) { $0 })
print(withUnsafeMutablePointer(to: &text) { $0 })

nomodify(&text)

print(withUnsafeMutablePointer(to: &text) { $0 })

modify(&text)

print(withUnsafeMutablePointer(to: &text) { $0 })

print(#fileID, #file, #filePath)
