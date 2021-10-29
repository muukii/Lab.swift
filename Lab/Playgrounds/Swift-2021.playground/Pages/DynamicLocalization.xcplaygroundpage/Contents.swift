//: [Previous](@previous)

import Foundation

public struct Language: Hashable {

  public let identifier: String
}

public struct SupportedLanguages {

  public static let instance = SupportedLanguages()

  public let ja = Language(identifier: "ja")
  public let en = Language(identifier: "en")
}


@dynamicMemberLookup
public struct StringsTemplate<LanguageSet> {

  public var storage: [Language : String]

  public init() {
    self.storage = [:]
  }

  public init(_ build: (inout Self) -> Void) {
    var instance = Self.init()
    build(&instance)
    self = instance
  }

  public subscript (dynamicMember keyPath: KeyPath<SupportedLanguages, Language>) -> String? {
    get {
      let key = SupportedLanguages.instance[keyPath: keyPath]
      return storage[key]
    }
    mutating set {
      let key = SupportedLanguages.instance[keyPath: keyPath]
      storage[key] = newValue
    }
  }

}

typealias Strings = StringsTemplate<SupportedLanguages>

extension Strings {
  public init(ja: StaticString, zh_Hant: StaticString) {

  }
}

var strings = Strings()
strings.ja = "こんにちは"
strings.en = "Hello"

print(strings)

//: [Next](@next)
