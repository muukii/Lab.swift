import Foundation

extension String {
  public init(template: StaticString, args: [String : CustomStringConvertible]) {
    var text = template.description

    for arg in args {
      do {
        let format = "{{ \(arg.key) }}"
        text = text.replacingOccurrences(of: format, with: arg.value.description)
      }
      do {
        let format = "{{\(arg.key)}}"
        text = text.replacingOccurrences(of: format, with: arg.value.description)
      }
    }

    self = text
  }
}

public struct Language: Hashable {

  public let identifier: String
}

public protocol LanguageSetType {
  static var instance: Self { get }
}

@dynamicMemberLookup
public struct StringsTemplate<LanguageSet: LanguageSetType> {

  public var storage: [Language: StaticString]

  public static func makeDraft() -> Self {
    .init()
  }

  init() {
    self.storage = [:]
  }

  public subscript(dynamicMember keyPath: KeyPath<LanguageSet, Language>) -> StaticString? {
    get {
      let key = LanguageSet.instance[keyPath: keyPath]
      return storage[key]
    }
    mutating set {
      let key = LanguageSet.instance[keyPath: keyPath]
      storage[key] = newValue
    }
  }

  public func string(parameters: [String : CustomStringConvertible]) -> String {

    String(template: rawString(), args: parameters)

  }

  public func rawString() -> StaticString {

    let allLanguages = Locale.preferredLanguages.map(Locale.init(identifier:))

    guard let firstLanguage = allLanguages.first else {
      fatalError()
    }

    return storage.first { $0.key.identifier == firstLanguage.languageCode }?.value ?? storage.first?.value ?? "_l10n_not_available_"

  }

}

public struct SupportedLanguages: LanguageSetType {

  public static let instance = SupportedLanguages()

  public let ja = Language(identifier: "ja")
  public let ko = Language(identifier: "ko")
  public let zh_Hant = Language(identifier: "zh-Hant")
}

typealias Strings = StringsTemplate<SupportedLanguages>

extension Strings {
  public init(
    ja: StaticString,
    ko: StaticString,
    zh_Hant: StaticString
  ) {

    var instance = Self.makeDraft()
    instance.ja = ja
    instance.ko = ko
    instance.zh_Hant = zh_Hant
    self = instance

  }
}

//: [Next](@next)
