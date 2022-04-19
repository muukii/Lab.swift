import Foundation

public var environmentValues: [String : Any] {
  Thread.current.threadDictionary["withEnviroment"] as? [String : Any] ?? [:]
}

public func withEnvironment(values: [String : Any], perform: () -> Void) {
  Thread.current.threadDictionary["withEnviroment"] = values
  perform()
  Thread.current.threadDictionary["withEnviroment"] = nil
}

print(environmentValues)

withEnvironment(values: ["a" : 1]) {

  print(environmentValues)
}

print(environmentValues)
