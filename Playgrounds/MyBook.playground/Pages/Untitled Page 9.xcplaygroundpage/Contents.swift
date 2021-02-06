
import Foundation

let root = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true).first!
let rootDirectoryURL = URL(fileURLWithPath: root)
let addingPaths: [String] = ["a", "b"]

let path = addingPaths.reduce(rootDirectoryURL) { url, path in
  url.appendingPathComponent(path, isDirectory: true)
}

