import Foundation

let path = URL(fileURLWithPath: "/Users/muukii/Desktop/text.md")

let text = String(data: try Data(contentsOf: path), encoding: .utf8)!

print(text)

var modified = "\n"
text.enumerateLines { line, _ in
  modified += line + "Hello" + "\n"
}

try modified.write(to: path, atomically: true, encoding: .utf8)

print("end")

