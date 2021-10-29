
@propertyWrapper
public struct Suspense<Value> {

  public enum State {
    case suspensive
    case resolving
    case resolved
    case failed
  }

  public private(set) var state: State = .suspensive

  /// A value that reloved from suspensive state.
  public private(set) var wrappedValue: Value?

  public private(set) var version: UInt64 = 0

  /// An error value that comes from while resolving the value.
  public private(set) var resolvingError: Error?

  public init(wrappedValue: Value?) {
    self.wrappedValue = wrappedValue
  }

  public mutating func markAsResolving(keepingValue keepValue: Bool = true) {
    state = .resolving
    if !keepValue {
      wrappedValue = nil
    }
  }

  public mutating func resolve(_ value: Value?) {
    resolvingError = nil
    wrappedValue = value
    state = .resolved
    version &+= 1
  }

  public mutating func resolve(error: Error, keepingValue keepValue: Bool = true) {

    state = .failed
    resolvingError = error
    if !keepValue {
      wrappedValue = nil
    }

  }

}

extension Suspense: Equatable where Value : Equatable {

  public static func == (lhs: Self, rhs: Self) -> Bool {
    lhs.wrappedValue == rhs.wrappedValue
  }

}

import UIKit

class Demo {

  @Suspense var image: UIImage?

}
