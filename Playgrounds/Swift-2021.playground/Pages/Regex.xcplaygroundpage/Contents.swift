import Foundation

let string = "LUT_256_myfilter"
let pattern = "LUT_([0-9]+)_.*"
let regex = try! NSRegularExpression(pattern: pattern, options: [])

guard let matched = regex.firstMatch(in: string, options: [], range: NSRange(location: 0, length: string.count)) else {
  fatalError()
}

(string as NSString).substring(with: matched.range(at: 1))

func hasMatches(regex: NSRegularExpression, string: String) -> Bool {
  return regex.firstMatch(in: string, options: [], range: NSRange(location: 0, length: string.count)) != nil
}
